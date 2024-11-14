<?php
include "connections.php";
$data = json_decode(file_get_contents('php://input'), true);
$user_id = $data['user_id'];
$movie_id = $data['movie_id'];


$query = "SELECT * FROM movies_bookmark_tbl WHERE user_id = ? AND movie_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("ii", $user_id, $movie_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $query = "INSERT INTO movies_bookmark_tbl (user_id, movie_id) VALUES (?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ii", $user_id, $movie_id);
    $stmt->execute();
    $response = array('success' => true, 'isBookmarked' => true);
}

$stmt->close();
$conn->close();
echo json_encode($response);
?>
