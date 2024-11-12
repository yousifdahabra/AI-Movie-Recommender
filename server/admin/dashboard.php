<?php 

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

if(isset($_POST['update_status_users'])){
    if(isset($_POST['user_id'])){
        $user_id = $_POST['user_id'];
        $users_query = $conection->prepare("Select * from users_tbl where user_id  = ?   ");
        $users_query->bind_param("i",$user_id);
        $users_query->execute();
        $get_users = $users_query->get_result();
        $user = $get_users->fetch_assoc();
        $is_active = $user['is_active'];
        if($is_active == 0){
            $users_update_query = $conection->prepare("update users_tbl set is_active = 1 where user_id  = ?   ");
            $users_update_query->bind_param("i",$user_id);
            $users_update_query->execute();
        }else{
            $users_update_query = $conection->prepare("update users_tbl set is_active = 0 where user_id  = ?   ");
            $users_update_query->bind_param("i",$user_id);
            $users_update_query->execute();
        }
        $response = [
            "states" => "1",
            "result" => "Update user status",
        ];
        echo  json_encode($response)  ;

    }else{
        $response = [
            "states" => "0",
            "result" => "There are no Users",
        ];
        echo  json_encode($response)  ;
    }
}