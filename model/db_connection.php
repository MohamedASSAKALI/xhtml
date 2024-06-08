<?php
// model/db_connection.php

function openConnection() {
    $servername = "localhost";
    $username = "root"; // replace with your DB username
    $password = ""; // replace with your DB password
    $dbname = "g_cabinet";
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    return $conn;
}

function closeConnection($conn) {
    $conn->close();
}

function isUserPresent($username) {
    $conn = openConnection();
    $stmt = $conn->prepare("SELECT id FROM user WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->store_result();

    $isPresent = $stmt->num_rows > 0;

    $stmt->close();
    closeConnection($conn);
    return $isPresent;
}
?>
