<?php
require_once __DIR__ . '/vendor/autoload.php';

$dotenv = \Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$GLOBALS[container] = [];

require_once __DIR__ . './src/core/SupabaseClient.php';
$GLOBALS[container][supabase] = new SupabaseClient;

