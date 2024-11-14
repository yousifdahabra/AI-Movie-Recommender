<?php
include 'connections.php';
$user_id = $_GET['user_id'];

$sql = "SELECT movies_tbl.movie_title, movies_tbl.movie_image FROM movies_bookmark_tbl 
        JOIN movies_tbl ON movies_bookmark_tbl.movie_id = movies_tbl.movie_id 
        WHERE movies_bookmark_tbl.user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$bookmarks = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode(['bookmarks' => $bookmarks]);
?>
