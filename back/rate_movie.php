<?php
header('Content-Type: application/json');

include "connections";
$data = json_decode(file_get_contents('php://input'), true);

$movie_id = $data['movie_id'];
$user_id = $data['user_id'];
$rating = $data['rating'];

$query = "SELECT * FROM movies_rate_tbl WHERE movie_id = ? AND user_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param('ii', $movie_id, $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $updateQuery = "UPDATE movies_rate_tbl SET scale = ? WHERE movie_id = ? AND user_id = ?";
    $updateStmt = $conn->prepare($updateQuery);
    $updateStmt->bind_param('iii', $scale, $movie_id, $user_id);
    $success = $updateStmt->execute();
} else {
    $insertQuery = "INSERT INTO movies_rate_tbl (movie_id, user_id, scale) VALUES (?, ?, ?)";
    $insertStmt = $conn->prepare($insertQuery);
    $insertStmt->bind_param('iii', $movie_id, $user_id, $scale);
    $success = $insertStmt->execute();
}

echo json_encode(['success' => $success]);
$conn->close();
?>
