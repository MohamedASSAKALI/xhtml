<?php
// model/auth.php
session_start();
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $conn = openConnection();

    // Prepared statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT password FROM user WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->bind_result($hashed_password);
    $stmt->fetch();
    
    if ($hashed_password) {
        if (password_verify($password, $hashed_password)) {
            $_SESSION['username'] = $username;
            header("Location: ../Dash.php"); // Assuming the dashboard is a PHP file
        } else {
            echo "Invalid username or password";
        }
    } else {
        echo "Invalid username or password";
    }

    $stmt->close();
    closeConnection($conn);
}
?>
