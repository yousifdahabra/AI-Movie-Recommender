<?php
require './../conection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_SESSION['user_id'])) {
        echo json_encode([
            "success" => false,
            "message" => "User not authenticated"
        ]);
        exit;
    }

    $data = json_decode(file_get_contents("php://input"), true);
    $userId = $_SESSION['user_id'];
    $oldPassword = $data['oldPassword'] ?? '';
    $newName = $data['newName'] ?? '';
    $newPassword = $data['newPassword'] ?? '';

    $stmt = $conection->prepare("SELECT password FROM users_tbl WHERE user_id = ?");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();
    $stmt->close();

    if (!password_verify($oldPassword, $user['password'])) {
        echo json_encode([
            "success" => false,
            "message" => "Incorrect current password",
            "field" => "oldPassword"
        ]);
        exit;
    }

    if (empty($newName)) {
        echo json_encode([
            "success" => false,
            "message" => "Please enter a new name",
            "field" => "newName"
        ]);
        exit;
    }

    $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
    $updateStmt = $conection->prepare("UPDATE users_tbl SET 
        full_name = ?,
        password = ?
        WHERE user_id = ?");
    
    $updateStmt->bind_param("ssi", $newName, $hashedPassword, $userId);

    if ($updateStmt->execute()) {
        $_SESSION['full_name'] = $newName;

        echo json_encode([
            "success" => true,
            "message" => "Profile updated successfully"
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Error updating profile",
            "field" => "general"
        ]);
    }
    
    $updateStmt->close();
} else {
    echo json_encode([
        "success" => false,
        "message" => "Invalid request method"
    ]);
}
?>