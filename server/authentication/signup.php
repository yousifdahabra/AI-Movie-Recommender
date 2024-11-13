<?php
require './../conection.php.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);


    $fullName = $data['fullName'] ?? '';
    $username = $data['username'] ?? '';
    $password = $data['password'] ?? '';

    if (empty($fullName) || empty($username) || empty($password)) {
        echo json_encode([
            "success" => false,
            "message" => "All fields are required"
        ]);
        exit;
    }
} else {
    echo json_encode([
        "success" => false,
        "message" => "Invalid request method"
    ]);
}
