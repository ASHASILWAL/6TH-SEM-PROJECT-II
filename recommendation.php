<?php
include('includes/config.php');

// Function to get recommended products based on the clicked product
function getRecommendedProducts($con, $clickedProductId) {
    // Get category and subcategory of the clicked product
    $query_category = "SELECT category, subCategory FROM products WHERE id = '$clickedProductId'";
    $result_category = mysqli_query($con, $query_category);

    if ($result_category && mysqli_num_rows($result_category) > 0) {
        $row_category = mysqli_fetch_assoc($result_category);
        $category = $row_category['category'];
        $subCategory = $row_category['subCategory'];

        // You need to implement your recommendation logic here
        // This is just a placeholder, and you should replace it with your actual recommendation algorithm
        $query_recommend = "SELECT * FROM products WHERE id != '$clickedProductId' AND category = '$category' AND subCategory = '$subCategory' LIMIT 4";
        $result_recommend = mysqli_query($con, $query_recommend);

        $recommendedProducts = array();
        while ($row_recommend = mysqli_fetch_assoc($result_recommend)) {
            $recommendedProducts[] = $row_recommend;
        }

        return $recommendedProducts;
    }

    return array(); // Return an empty array if category information is not available
}

// Check if the product ID is set in the URL
if (isset($_GET['pid'])) {
    $pid = intval($_GET['pid']);

    // Get product details
    $query_product = "SELECT * FROM products WHERE id = '$pid'";
    $result_product = mysqli_query($con, $query_product);

    if ($result_product && mysqli_num_rows($result_product) > 0) {
        $row = mysqli_fetch_assoc($result_product);

        // Display product details here

        // Get recommended products based on the clicked product
        $recommendedProducts = getRecommendedProducts($con, $pid);
    } else {
        // Product not found
        echo "Product not found.";
    }
} else {
    // Product ID not set in the URL
    echo "Invalid product ID.";
}

// The rest of your HTML and code for displaying product details...

// Display recommended products
if (!empty($recommendedProducts)) {
    echo "<h5 class='section-title'>You May Like </h5>";
    echo"<div class='owl-carousel sidebar-carousel custom-carousel owl-theme outer-top-xs'>";
    foreach ($recommendedProducts as $recommendedProduct) {
        // Display all details of the recommended product
        echo "<div>";
       echo '<img src="admin/productimages/' . htmlentities($recommendedProduct['id']) . '/' . htmlentities($recommendedProduct['productImage3']) . '" width="200" height="200" alt="">';
        echo "<h4>" . $recommendedProduct['productName'] . "</h4>";
        echo "<h4> Product Brand :" . $recommendedProduct['productCompany'] . "</h4>";
        echo "<div class='product-price'>	
                <span class='price'>
                    Product Price : Rs. " . htmlentities($recommendedProduct['productPrice']) . ".00
                </span>
                <br><span class='price-before-discount'> Price Before Discount : Rs." . htmlentities($recommendedProduct['productPriceBeforeDiscount']) . "</span>	</br>				
            </div><!-- /.product-price -->";
        echo "<h4>" . $recommendedProduct['productAvailability'] . "</h4>";

        if ($recommendedProduct['productAvailability'] == 'In Stock') {
            echo "<div class='cart clearfix animate-effect'>";
            echo "<div class='action'>";
            echo "<div class='add-cart-button btn-group'>";
            echo "<i class='fa fa-shopping-cart'></i>";
            echo "<a href='category.php?page=product&action=add&id={$recommendedProduct['id']}'>";
            echo "<button class='btn btn-primary' type='button'>Add to cart</button>";
            echo "</a>";
            echo "</div>";
            echo "</div><!-- /.action -->";
            echo "</div><!-- /.cart -->";
        }
        echo"</div>";
    }
  
}
?>
