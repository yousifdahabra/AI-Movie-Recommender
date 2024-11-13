<?php 
include "../conection.php";

$mvoies_query = $conection->prepare("Select * from movies_tbl  limit 4");
$mvoies_query->execute();
$get_movies = $mvoies_query->get_result();
$movies_array = [];
if($get_movies->num_rows > 0){
    while($movies = $get_movies->fetch_assoc()){
        $movies_array[] = $movies;
    }
    $response = [
        "states" => "1",
        "result" => $movies_array,
    ];
    echo json_encode($response);

}else{
    $response = [
        "states" => "0",
        "result" => "There are no movies",
    ];
    echo  json_encode($response)  ;
}


?>