<?php
require './../conection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    session_unset();
    session_destroy();
    
    echo json_encode([
        "success" => true,
        "message" => "Logged out successfully"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Invalid request method"
    ]);
}
?>