<?php
require 'db_connection.php';

function createUser($username, $plainPassword, $Role, $email) {
    $hashedPassword = password_hash($plainPassword, PASSWORD_DEFAULT);
    $conn = openConnection();

    $stmt = $conn->prepare("INSERT INTO `User` (username, password, role, email) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $username, $hashedPassword, $Role, $email);  

    if ($stmt->execute()) {
        echo "New user created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    closeConnection($conn);
}


// Example usage
//createUser('few', 'few','Apah' ,'feeew@gmail.com');
?>
