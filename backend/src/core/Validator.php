<?php

class Validator {
    public static function check(array $data, array $rules){
        $errors = [];

        foreach ($rules as $field => $ruleString){
            $value = $data[$field] ?? null;
            $ruleList = explode('|', $ruleString);

            foreach ($ruleList as $rule){
                $parts = explode(':', $rule, 2);
                $ruleName = $parts[0];
                $param = $parts[1] ?? null;

                switch ($ruleName) {

                    case 'required':
                        if ($value === null || $value === "") {
                            $errors[$field][] = "$field is required";
                        }
                        break;

                    case 'email':
                        if ($value && !filter_var($value, FILTER_VALIDATE_EMAIL)) {
                            $errors[$field][] = "$field must be a valid email";
                        }
                        break;

                    case 'min':
                        if ($value && strlen((string)$value) < (int)$param) {
                            $errors[$field][] = "$field must be at least $param characters";
                        }
                        break;

                    case 'max':
                        if ($value && strlen((string)$value) > (int)$param) {
                            $errors[$field][] = "$field must be at most $param characters";
                        }
                        break;

                    case 'in':
                        $allowed = explode(',', $param);
                        if($value && !in_array($value, $allowed)) {
                            $errors[$field][] = "$field must be one of: " . implode('. ', $allowed);
                        }
                        break;
                }
            }
        }

        return $errors;
    }
}