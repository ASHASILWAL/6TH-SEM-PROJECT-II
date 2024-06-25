<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>THE FASHION GALLERY</title>
    <style>
        /* Add your styles for the printable bill here */
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        /* Additional styles go here */
    </style>
</head>
<body>
    <h2>Invoice</h2>

    <!-- Display user information -->
    <p><strong>Billing Address:</strong></p>
    <p><?php echo $userData['billingAddress']; ?></p>
    <p><?php echo $userData['billingState'] . ', ' . $userData['billingCity'] . ', ' . $userData['billingPincode']; ?></p>

    <!-- Display cart items -->
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Image</th>
                <th>Quantity</th>
                <th>Price Per Unit</th>
                <th>Shipping Charge</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($cartData as $item) : ?>
                <tr>
                    <td><?php echo $item['productName']; ?></td>
                  <td> <?php  echo '<img src="admin/productimages/' . htmlentities($item['id']) . '/' . htmlentities($item['productImage3']) . '" width="200" height="200" alt="">'; ?> </td>
     <td><?php echo $item['quantity']; ?></td>
                    <td><?php echo "Rs. " . $item['productPrice']; ?></td>
                    <td><?php echo "Rs. " . $item['shippingCharge']; ?></td>
                    <td><?php echo "Rs. " . $item['subtotal']; ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Display total price -->
    <p><strong>Total Price: Rs. <?php echo $totalPrice; ?></strong></p>

    <!-- Additional information and styling for the bill -->

    <!-- Add a print button -->
    <button onclick="window.print()">Print Invoice</button>
</body>
</html>
