<?php
session_start();
include('include/config.php');
$category = $subcat = $productname = $productcompany = $productprice = $productpricebd = $productdescription = $productscharge = $productavailability = $productimage1 = '';


if (strlen($_SESSION['alogin']) == 0) {
    header('location:index.php');
} else {
    if (isset($_POST['submit'])) {
        $category = $_POST['category'];
        $subcat = $_POST['subcategory'];
        $productname = $_POST['productName'];
        $productcompany = $_POST['productCompany'];
        $productprice = $_POST['productprice'];
        $productpricebd = $_POST['productpricebd'];
        $productdescription = $_POST['productDescription'];
        $productscharge = $_POST['productShippingcharge'];
        $productavailability = $_POST['productAvailability'];
        $productimage1 = $_FILES["productimage1"]["name"];

        // Validation for product name and empty fields
        $errorMessages = [];

        if (empty($category) || empty($subcat) || empty($productname) || empty($productcompany) || empty($productprice) || empty($productpricebd) || empty($productdescription) || empty($productavailability) || empty($productimage1)) {
            $errorMessages[] = 'All fields are required. Please fill in all fields.';
        }

        if (empty($productname)) {
            $errorMessages[] = 'Product name is required.';
        } elseif (!preg_match('/^[a-zA-Z\s-]+$/', $productname)) {
            $errorMessages[] = 'Product name can only contain alphabets, spaces, and dashes.';
        }

		if (empty($productprice)) {
            $errorMessages[] = 'Product price is required.';
        } elseif ($productprice > $productpricebd) {
            $errorMessages[] = 'Product price after discount must be less than Product price before discount  ';
        }

		if (empty($productdescription)) {
			$errorMessages[] = 'Product Description is required.';
		} elseif (strlen($productdescription) > 100) {
			$errorMessages[] = 'Description must be up to 50 characters or less.';
		}
		


		if (empty($productscharge)) {
            $errorMessages[] = 'Shipping charge is required.';
        } elseif (($productscharge > $productprice && $productpricebd) || ($productscharge > 800)) {
            $errorMessages[] = 'Shipping charge must not be greater than product charge and more than 800';
        }

        if (empty($errorMessages)) {
            // Continue with inserting the product
            $query = mysqli_query($con, "select max(id) as pid from products");
            $result = mysqli_fetch_array($query);
            $productid = $result['pid'] + 1;
            $dir = "productimages/$productid";
            if (!is_dir($dir)) {
                mkdir("productimages/" . $productid);
            }
            move_uploaded_file($_FILES["productimage1"]["tmp_name"], "productimages/$productid/" . $_FILES["productimage1"]["name"]);
            $sql = mysqli_query($con, "insert into products(category,subCategory,productName,productCompany,productPrice,productDescription,shippingCharge,productAvailability,productImage3,productPriceBeforeDiscount) values('$category','$subcat','$productname','$productcompany','$productprice','$productdescription','$productscharge','$productavailability','$productimage1','$productpricebd')");
            $_SESSION['msg'] = "Product Inserted Successfully !!";
        } else {
            $errorMessagesString = implode("\\n", $errorMessages);
            echo "<script>alert('$errorMessagesString');</script>";
        }
    }
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>THE FASHION GALLERY-ADMIN</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
<script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>

   <script>
function getSubcat(val) {
	$.ajax({
	type: "POST",
	url: "get_subcat.php",
	data:'cat_id='+val,
	success: function(data){
		$("#subcategory").html(data);
	}
	});
}
function selectCountry(val) {
$("#search-box").val(val);
$("#suggesstion-box").hide();
}
</script>	


</head>
<body>
<?php include('include/header.php');?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
<?php include('include/sidebar.php');?>				
			<div class="span9">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>Insert Product</h3>
							</div>
							<div class="module-body">

									<?php if(isset($_POST['submit']))
{?>
									<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?>
									</div>
<?php } ?>


									<?php if(isset($_GET['del']))
{?>
									<div class="alert alert-error">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?>
									</div>
<?php } ?>

									<br />

			<form class="form-horizontal row-fluid" name="insertproduct" method="post" enctype="multipart/form-data">

			<div class="control-group">
    <label class="control-label" for="basicinput">Category</label>
    <div class="controls">
        <select name="category" class="span8 tip" onChange="getSubcat(this.value);" required>
            <option value="">Select Category</option>
            <?php
            $query = mysqli_query($con, "select * from category");
            while ($row = mysqli_fetch_array($query)) {
                $selected = ($row['id'] == $category) ? 'selected' : ''; // Add selected attribute
                echo "<option value='{$row['id']}' $selected>{$row['categoryName']}</option>";
            }
            ?>
        </select>
    </div>
</div>

									
<div class="control-group">
<label class="control-label" for="basicinput">Sub Category</label>
<div class="controls">
<select   name="subcategory"  id="subcategory" class="span8 tip" required>
</select>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Product Name</label>
<div class="controls">
<input type="text"    name="productName"  placeholder="Enter Product Name" value="<?php echo $productname; ?>" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Product Company</label>
<div class="controls">
<input type="text"    name="productCompany"  placeholder="Enter Product Comapny Name" value="<?php echo $productcompany; ?>" class="span8 tip" required>
</div>
</div>
<div class="control-group">
<label class="control-label" for="basicinput">Product Price Before Discount</label>
<div class="controls">
<input type="text"    name="productpricebd"  placeholder="Enter Product Price" value="<?php echo $productpricebd; ?>" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Product Price After Discount(Selling Price)</label>
<div class="controls">
<input type="text"    name="productprice"  placeholder="Enter Product Price" value="<?php echo $productprice; ?>" class="span8 tip" required>
</div>
</div>

<div class="control-group">
    <label class="control-label" for="basicinput">Product Description</label>
    <div class="controls">
        <textarea name="productDescription" placeholder="Enter Product Description" rows="2" class="span8 tip"><?php echo isset($_POST['productDescription']) ? $_POST['productDescription'] : ''; ?></textarea>
    </div>
</div>


<div class="control-group">
<label class="control-label" for="basicinput">Product Shipping Charge</label>
<div class="controls">
<input type="text"    name="productShippingcharge"  placeholder="Enter Product Shipping Charge" value="<?php echo $productscharge; ?>" class="span8 tip" required>
</div>
</div>

<div class="control-group">
    <label class="control-label" for="basicinput">Product Availability</label>
    <div class="controls">
        <select name="productAvailability" id="productAvailability" class="span8 tip" required>
            <option value="">Select</option>
            <option value="In Stock" <?php if ($productavailability == "In Stock") echo 'selected="selected"'; ?>>In Stock</option>
            <option value="Out of Stock" <?php if ($productavailability == "Out of Stock") echo 'selected="selected"'; ?>>Out of Stock</option>
        </select>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="basicinput">Product Image</label>
    <div class="controls">
        <input type="file" name="productimage1" id="productimage1" class="span8 tip" <?php if (isset($productimage1)) { echo "style='display: none;'"; } ?> required>
        <input type="hidden" name="prev_productimage1" value="<?php echo $productimage1; ?>">
        <?php if (isset($productimage1)) { ?>
            <span>Selected Image: <?php echo $productimage1; ?></span>
            <a href="javascript:void(0);" onclick="document.getElementById('productimage1').style.display = 'block'; this.style.display = '24px';">Change Image</a>
        <?php } ?>
    </div>
</div>


	<div class="control-group">
											<div class="controls">
												<button type="submit" name="submit" class="btn">Insert</button>
											</div>
										</div>
									</form>
							</div>
						</div>


	
						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
