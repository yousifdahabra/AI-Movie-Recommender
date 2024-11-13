<?php
require './../conection.php';


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);
    $username = $data['username'] ?? '';
    $password = $data['password'] ?? '';

    if (empty($username) || empty($password)) {
        echo json_encode([
            "success" => false,
            "message" => "Username and password are required"
        ]);
        exit;
    }
    $stmt = $conection->prepare("SELECT user_id, full_name, username, password, role, is_active 
                                FROM users_tbl 
                                WHERE username = ?");

    $stmt->bind_param("s", $username);
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

        if ($password ==  $user['password']) {
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['full_name'] = $user['full_name'];
            $_SESSION['role'] = $user['role'];

            echo json_encode([
                "success" => true,
                "user" => [
                    "id" => $user['user_id'],
                    "full_name" => $user['full_name'],
                    "role" => $user['role']
                ]
            ]);
        } else {
            echo json_encode([
                "success" => false,
                "message" => "invalid password"
            ]);
        }
    } else {
        echo json_encode([
            "success" => false,
            "message" => "invalid username"
        ]);
    }

    $stmt->close();
} else {
    echo json_encode([
        "success" => false,
        "message" => "Invalid request method"
    ]);
}
