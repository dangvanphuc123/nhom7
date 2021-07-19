<?php

$servername = "MYSQL5025.site4now.net";
$username = "a778ea_demo";
$password = "phuctram1230";
$db = "db_a778ea_demo";

// Create connection
$con = mysqli_connect($servername, $username, $password,$db);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}


?>
