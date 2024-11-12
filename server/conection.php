<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: Content-Type');

session_start();

$host = "localhost";
$username = "root";
$password = "";
$database = "movies_db";
$conection = new mysqli($host,$username,$password,$database);
if(!$conection)
    die("Error conection to the database ");
