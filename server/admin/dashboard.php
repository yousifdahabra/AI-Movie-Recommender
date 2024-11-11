<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: Content-Type');

include "../conection.php";

if(isset($_POST['get_users'])){
    $users_query = $conection->prepare("Select * from users_tbl  ");
    $users_query->execute();
    $get_users = $users_query->get_result();
    $user_array = [];
    if($get_users->num_rows > 0){
        
        while($user = $get_users->fetch_assoc()){
            $user_array[] = $user;
        }

        $response = [
            "states" => "1",
            "result" => $user_array,
        ];
        echo json_encode($response);

    }else{
        $response = [
            "states" => "0",
            "result" => "There are no Users",
        ];
        echo  json_encode($response)  ;
    }

}