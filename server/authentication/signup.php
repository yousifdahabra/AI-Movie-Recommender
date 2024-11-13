<?php
require './../conection.php';

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

    $stmt = $conection->prepare("SELECT user_id FROM users_tbl WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    
    if ($stmt->get_result()->num_rows > 0) {
        echo json_encode([
            "success" => false,
            "message" => "username already exists"
        ]);
        $stmt->close();
        exit;
    }

    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    $role = 'normal';
    $isActive = 1;
    
    $stmt = $conection->prepare("INSERT INTO users_tbl (full_name, username, password, role, create_date, is_active) 
                                VALUES (?, ?, ?, ?, NOW(), ?)");
    
    $stmt->bind_param("ssssi", $fullName, $username, $hashedPassword, $role, $isActive);
    
    if ($stmt->execute()) {
        echo json_encode([
            "success" => true,
            "message" => "Registration successful"
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Registration failed: " . $stmt->error
        ]);
    }
    
    $stmt->close();
} else {
    echo json_encode([
        "success" => false,
        "message" => "Invalid request method"
    ]);
}
?>