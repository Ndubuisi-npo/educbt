<?php

class SupabaseClient {
    private string $url;
    private string $serviceKey;
    private string $anonKey;

    public function __construct() {
        $this->url = rtrim($_ENV['SUPABASE_URL'], '/');
        $this->serviceKey = $_ENV['SERVICE_KEY'];
        $this->anonKey = $_ENV['ANON_KEY'];
    }

    private function makeRequest(string $url, string $method, array $headers, ?array $data): array{
        $ch = curl_init($url);

        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => $headers,
            CURLOPT_CUSTOMREQUEST => $method,
            CURLOPT_TIMEOUT => 10,
            CURLOPT_SSL_VERIFYPEER => true,
        ]);

        if ($data !== null && in_array($method, ['POST', 'PATCH', 'PUT'])){
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        }

        $response = curl_exec($ch);
        $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);

        if($curlError){
            return [
                'success' => false,
                'status' => 0,
                'error' =>  'Network Error: ' . $curlError,
                'data' => null,
            ];
        }

        $decoded = json_decode($response, true);
        
        $isError = $statusCode >= 400;

        return [
            'success' => !$isError,
            'status' => $statusCode,
            'data' => $isError ? null : $decoded,
            'error' => $isError ? ($decoded['message'] ?? $decoded['error'] ?? 'Unknown error') : null,
        ];
    }

    public function query(string $endpoint, string $method = 'GET', ?array $data = null, bool $useService = false): array{
        $apiKey = $useService ? $this->serviceKey : $this->anonKey;
        $url = $this->url . '/rest/v1' . $endpoint;
        
        $headers = [
            'apiKey: '      . $apiKey,
            'Authorization: Bearer ' . $apiKey,
            'Content-Type: application/json',
            'Accept: application/json',
            'Prefer: return=representation'
        ];

        return $this->makeRequest($url, $method, $headers, $data);
    }

    public function authRequest(string $endpoint, array $data = [], ?string $userJwt = null): array{
    $url = $this->url . '/auth/v1/' . $endpoint;

    $headers = [
        'apikey: ' . $this->anonKey,
        'Content-Type: application/json',
        'Accept: application/json',
    ];

    if ($userJwt) {
        $headers[] = 'Authorization: Bearer ' . $userJwt;
    } else {
        $headers[] = 'Authorization: Bearer ' . $this->anonKey;
    }

    return $this->makeRequest($url, 'POST', $headers, $data);
}
};