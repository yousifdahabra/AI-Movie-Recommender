<?php 
require './../conection.php';
if (isset($_SESSION['user_id'])) {
    echo json_encode([
        "success" => true,
        "message" => "User  authenticated"
    ]);
    exit;
}else{
    echo json_encode([
        "success" => false,
        "message" => "User not authenticated"
    ]);
    exit;
}



?>