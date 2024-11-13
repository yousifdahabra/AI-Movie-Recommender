<?php
require 'config.php';


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);
    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';

    if (empty($email) || empty($password)) {
        echo json_encode([
            "success" => false,
            "message" => "Email and password are required"
        ]);
        exit;
    }

    $stmt = $conection->prepare("SELECT user_id, full_name, username, password, role, is_active 
                                FROM users_tbl 
                                WHERE username = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        if ($user['is_active'] == 0) {
            echo json_encode([
                "success" => false,
                "message" => "Account is deactivated"
            ]);
            exit;
        }
    }
}
