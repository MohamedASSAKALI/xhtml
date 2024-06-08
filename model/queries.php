<?php
// model/auth.php
session_start();
include 'db_connection.php';

function getPaidInvoicesCount($conn) {
    $sql = "SELECT COUNT(*) AS total_paid_invoices FROM Invoice";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $row = mysqli_fetch_assoc($result);
        echo json_encode(array('success' => 'true', 'total_paid_invoices' => $row['total_paid_invoices']));
    } else {
        echo json_encode(array('success' => 'false', 'error' => mysqli_error($conn)));
    }
}


if (isset($_POST['action']) && $_POST['action'] == 'get_paid_invoices_count') {
    getPaidInvoicesCount($conn);
}
?>
