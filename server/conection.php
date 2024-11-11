<?php 
session_start();

$host = "localhost";
$username = "root";
$password = "";
$database = "movies_db";
$conection = new mysqli($host,$username,$password,$database);
if(!$conection)
    die("Error conection to the database ");
