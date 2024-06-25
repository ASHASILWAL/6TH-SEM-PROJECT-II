<?php 
session_start();
error_reporting(0);
include('includes/config.php');

if (strlen($_SESSION['login']) == 0) {   
    header('location:login.php');
} else {
    if (isset($_POST['submit'])) {
        mysqli_query($con, "update orders set paymentMethod='" . $_POST['paymethod'] . "' where userId='" . $_SESSION['id'] . "' and paymentMethod is null ");
        unset($_SESSION['cart']);
        header('location:order-history.php');
    }
?>

<!-- Your HTML and PHP code here -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<?php 
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
{   
    header('location:login.php');
}
else {
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="MediaCenter, Template, eCommerce">
    <meta name="robots" content="all">

    <title>THE FASHION GALLERY </title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/maroon.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/owl.transitions.css">
    <link href="assets/css/lightbox.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/rateit.css">
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
    
    <script language="javascript" type="text/javascript">
        var popUpWin=0;
        function popUpWindow(URLStr, left, top, width, height)
        {
            if(popUpWin)
            {
                if(!popUpWin.closed) popUpWin.close();
            }
            popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
        }
    </script>
</head>
<body class="cnt-home">
    <header class="header-style-1">
    </header>

    <div class="breadcrumb">
        <div class="container">
            <div class="breadcrumb-inner">
                <ul class="list-inline list-unstyled">
                    <li><a href="order-history.php">Back</a></li>
                    <li class='active'>Your Order Statement</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="body-content outer-top-xs">
        <div class="container">
            <div class="row inner-bottom-sm">
                <div class="shopping-cart">
                    <div class="col-md-12 col-sm-12 shopping-cart-table">
                        <div class="table-responsive">
                            
                            <form name="cart" method="post">
                                
                                <table class="table table-bordered">
                                    <!-- Table header -->

                                    <thead>
                                        <tr>
                                            <th class="cart-romove item">#</th>
                                            <th class="cart-description item">Image</th>
                                            <th class="cart-product-name item">Product Name</th>
                                            <th class="cart-qty item">Quantity</th>
                                            <th class="cart-sub-total item">Price Per unit</th>
                                            <th class="cart-sub-total item">Shipping Charge</th>
                                            <th class="cart-total item">Grandtotal</th>
                                            <th class="cart-total item">Payment Method</th>
                                            <th class="cart-total item">Order Status</th>
                                            <th class="cart-description item">Order Date</th>
                                            <th class="cart-total last-item">Action</th>
                                        </tr>
                                    </thead>



<!-- Table body -->
<tbody>
    <?php
    $query = mysqli_query($con, "select products.productImage3 as pimg3,products.productName as pname,products.id as proid,orders.productId as opid,orders.quantity as qty,products.productPrice as pprice,products.shippingCharge as shippingcharge,orders.paymentMethod as paym,orders.orderStatus as status, orders.orderDate as odate,orders.id as orderid from orders join products on orders.productId=products.id where orders.userId='" . $_SESSION['id'] . "' and orders.paymentMethod is not null");
    $cnt = 1;
    $grandTotal = 0;
    while ($row = mysqli_fetch_array($query)) {
        $qty = $row['qty'];
        $price = $row['pprice'];
        $shippcharge = $row['shippingcharge'];
        $totalAmount = ($qty * $price) + $shippcharge;
        $grandTotal += $totalAmount;
    ?>
        <tr>


                                        <tr>
                                            <td><?php echo $cnt;?></td>
                                            <td class="cart-image">
                                                <a class="entry-thumbnail" href="detail.html">
                                                    <img src="admin/productimages/<?php echo $row['proid'];?>/<?php echo $row['pimg3'];?>" alt="" width="84" height="146">
                                                </a>
                                            </td>
                                            <td class="cart-product-name-info">
                                                <h4 class='cart-product-description'>
                                                    <a href="product-details.php?pid=<?php echo $row['opid'];?>">
                                                        <?php echo $row['pname'];?>
                                                    </a>
                                                </h4>
                                            </td>
                                            <td class="cart-product-quantity">
                                                <?php echo $qty=$row['qty']; ?>   
                                            </td>
                                            <td class="cart-product-sub-total">
                                                <?php echo $price=$row['pprice']; ?>  
                                            </td>
                                            <td class="cart-product-sub-total">
                                                <?php echo $shippcharge=$row['shippingcharge']; ?>  
                                            </td>
                                            <td class="cart-product-grand-total">
                                                <?php echo (($qty*$price)+$shippcharge);?>
                                            </td>
                                            <td class="cart-product-sub-total">
                                                <?php echo $row['paym']; ?>  
                                            </td>
                                            <td class="cart-product-sub-total">
                                                <?php echo $row['status']; ?>  
                                            </td>
                                            <td class="cart-product-sub-total">
                                                <?php echo $row['odate']; ?>  
                                            </td>
                                            <td>
                                                <a href="javascript:void(0);" onClick="popUpWindow('track-order.php?oid=<?php echo htmlentities($row['orderid']);?>');" title="Track order">Track</a>
                                            </td>
                                        </tr>
                                        <?php $cnt=$cnt+1;} ?>
        </tr>
    <?php $cnt = $cnt + 1;
    } ?>
</tbody>

<!-- Table footer (display grand total) -->
<tfoot>
    <tr>
        <!-- <td colspan="6" class="text-right"><strong>Grand Total:</strong></td>
        <td class="cart-product-grand-total"><strong><?php echo $grandTotal; ?></strong></td> -->
        <td colspan="3"></td>
    </tr>
</tfoot>
</table>
</form>
<div class="text-right">
    <button class="btn btn-primary" onclick="printInvoice()">Print Invoice</button>
</div>
</div>
</div>
</div>
</div>
</div>

 <script src="assets/js/jquery-1.11.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/echo.min.js"></script>
    <script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/bootstrap-slider.min.js"></script>
    <script src="assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/scripts.js"></script>

    <script>
        function printInvoice() {
            window.print();
        }
    </script>
</body>
</html>
<?php } ?>



<style>
	.body-content{
		margin-top: 50px;
	}
	</style>