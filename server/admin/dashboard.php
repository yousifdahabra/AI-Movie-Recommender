<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: Content-Type');

include "../conection.php";

if(isset($_POST['get_users'])){
    $response = [
        "states" => "1",
        "messages" => "you are in the right place",

    ];
    echo  json_encode($response)  ;

}