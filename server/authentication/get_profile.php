<?php
require './../conection.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (!isset($_SESSION['user_id'])) {
        echo json_encode([
            "success" => false,
            "message" => "User not authenticated"
        ]);
        exit;
    }

    $userId = $_SESSION['user_id'];

    $stmt = $conection->prepare("SELECT full_name, username FROM users_tbl WHERE user_id = ?");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();
    $stmt->close();

    if ($user) {
        echo json_encode([
            "success" => true,
            "data" => [
                "name" => $user['full_name'],
            ]
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "User not found"
        ]);
    }
} else {
    echo json_encode([
        "success" => false,
        "message" => "Invalid request method"
    ]);
}
