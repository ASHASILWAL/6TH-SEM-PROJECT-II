<?php
include('includes/config.php');

if(isset($_GET['oid'])) {
    $orderId = $_GET['oid'];

    // Update the order status in the database to 'Cancelled'
    $updateQuery = mysqli_query($con, "UPDATE orders SET orderStatus='Cancelled' WHERE id='$orderId'");

    if ($updateQuery) {
        // Successfully updated status
        header("Location: order-history.php"); // Redirect back to the page
        exit();
    } else {
        // Error updating status
        echo "Error: " . mysqli_error($con);
    }
} else {
    // No order ID provided
    echo "Invalid request";
}
?>
