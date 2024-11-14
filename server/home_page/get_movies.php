<?php 
include "../conection.php";

if(isset($_GET['filter_by'])){
    if($_GET['filter_by'] == 'new'){
        $mvoies_query = $conection->prepare("Select * from movies_tbl order by movie_release_date DESC limit 4");

    }else if($_GET['filter_by'] == 'trend'){
        $mvoies_query = $conection->prepare("SELECT m.*,sum(scale) as total_scale FROM movies_tbl m INNER JOIN movies_rate_tbl mr on mr.movie_id = m.movie_id GROUP BY m.movie_id order by total_scale DESC limit 4");

    }else if($_GET['filter_by'] == 'recommend'){
        if (isset($_SESSION['user_id'])) {
            $user_id=$_SESSION['user_id'];
            $mvoies_query = $conection->prepare("SELECT m.movie_id
                FROM movies_tbl m
                JOIN movies_category_tbl mc ON m.movie_id = mc.movie_id
                WHERE mc.category_id IN (
                    SELECT DISTINCT mc2.category_id
                    FROM movies_category_tbl mc2
                    JOIN movies_rate_tbl r ON mc2.movie_id = r.movie_id
                    WHERE r.user_id = ?
                )
                AND m.movie_id NOT IN (
                    SELECT r.movie_id
                    FROM movies_rate_tbl r
                    WHERE r.user_id = ?
                )
                limit 4;");
            $mvoies_query->bind_param('ii',$user_id,$user_id);

        }else{
            $mvoies_query = $conection->prepare("
                SELECT m.*
                FROM movies_tbl m
                JOIN movies_category_tbl mc ON m.movie_id = mc.movie_id
                WHERE mc.category_id IN (
                    SELECT DISTINCT mc2.category_id
                    FROM movies_category_tbl mc2
                    JOIN movies_rate_tbl r ON mc2.movie_id = r.movie_id
                )
                AND m.movie_id NOT IN (
                    SELECT r.movie_id
                    FROM movies_rate_tbl r
                )
                ORDER BY RAND()
                LIMIT 4;
            ");
        }
    }else{
        $mvoies_query = $conection->prepare("Select * from movies_tbl  limit 4");
    }
     
}else{
    $mvoies_query = $conection->prepare("Select * from movies_tbl  limit 4");
}
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