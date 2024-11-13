<?php
include 'connections.php';
$sql = "SELECT movie_id, movie_title, movie_image FROM movies_tbl";
$result = $conn->query($sql);

if (!$result) {
    die("Error executing query: " . $conn->error);
}

$movies = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $movies[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($movies);

$conn->close();
?>
