<?php 
session_start();
include('admin/include/config.php');
include('includes/header.php');
?>
<script src="js/rating.js"></script>
<link rel="stylesheet" href="css/styles.css">

<div class="container">		
<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">
	    <title>THE FASHION GALLERY</title>
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

        <!-- Fonts --> 
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
	
	</head>
    <body class="cnt-home">
	
<header class="header-style-1">

	<!-- ============================================== TOP MENU ============================================== -->

<?php include('includes/main-header.php');?>
	<!-- ============================================== NAVBAR ============================================== -->
<?php include('includes/menu-bar.php');?>
<!-- ============================================== NAVBAR : END ============================================== -->

</header>
	<?php
	include 'includes/menu.php';
	include 'class/Rating.php';
	$rating = new Rating();
	$itemList = $rating->getItemList();
	foreach($itemList as $products){
		$average = $rating->getRatingAverage($products["id"]);
	?>	
	
	<div class="col-sm-9">
	<div class="image">
								<img src="admin/productimages/<?php echo htmlentities($products['id']);?>/<?php echo htmlentities($products['productImage3']);?>"  width="80" height="80" alt="">
							</div>
		<div class="col-sm-9">
		<h4 style="margin-top:10px; width:350px;"><?php echo $products["productName"]; ?></h4>
		<div><span class="average"><?php printf('%.1f', $average); ?> <small>/ 5</small></span> <span class="rating-reviews"><a href="show_rating.php?item_id=<?php echo $products["id"]; ?>">Rating & Reviews</a></span></div>
		<span class = "desc"> <?php echo $products["productDescription"];  ?>	</span>	
		</div>		
	</div>
	<?php } ?>	
</div>	
</div>	
<?php include('includes/footer.php');?>
