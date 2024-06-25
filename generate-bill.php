<?php
session_start();
include('includes/config.php');

if (isset($_SESSION['id'])) {
    $userId = $_SESSION['id'];

    // Fetch user details for billing and shipping addresses
    $userQuery = mysqli_query($con, "SELECT * FROM users WHERE id='$userId'");
    $userData = mysqli_fetch_assoc($userQuery);

    // Fetch cart items for the user
    $pdtid = $_SESSION['pid'];
    $cartQuery = mysqli_query($con, "SELECT * FROM products WHERE id IN (" . implode(',', $pdtid) . ")");
    $cartData = array();
    $totalPrice = 0;
    while ($row = mysqli_fetch_assoc($cartQuery)) {
        $row['quantity'] = $_SESSION['cart'][$row['id']]['quantity'];
        $row['subtotal'] = ($row['quantity'] * $row['productPrice']) + $row['shippingCharge'];
        $totalPrice += $row['subtotal'];
        $cartData[] = $row;
    }

    // Display the bill
    include('includes/bill-template.php');
} else {
    header('location: login.php');
}
?>
