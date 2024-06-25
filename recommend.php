<?php
session_start();
error_reporting(0);
ini_set('display_errors', 1);
include('includes/config.php');

// Function to get recommended products based on the highest ratings
function getRecommendedProducts($con, $currentProductId) {
    $query_highest_rated = "SELECT products.*, AVG(item_rating.ratingNumber) AS avg_rating 
                            FROM products 
                            LEFT JOIN item_rating ON products.id = item_rating.productId 
                            WHERE products.id <> $currentProductId
                            GROUP BY products.id 
                            ORDER BY avg_rating DESC 
                            LIMIT 4";

    $result_highest_rated = mysqli_query($con, $query_highest_rated);

    $recommendedProducts = array();
    while ($row_highest_rated = mysqli_fetch_assoc($result_highest_rated)) {
        $recommendedProducts[] = $row_highest_rated;
    }

    return $recommendedProducts;
}

// Assuming you have the current product's ID
$currentProductId = intval($_GET['pid']);
$recommendedProducts = getRecommendedProducts($con, $currentProductId);

// Your existing HTML and code for displaying product details...

if (!empty($recommendedProducts)) {
    echo "<h5 class='section-title'>Top Rated Products</h5>";
    echo "<div class='owl-carousel sidebar-carousel custom-carousel owl-theme outer-top-xs'>";
    foreach ($recommendedProducts as $recommendedProduct) {
        echo "<div>";
        echo '<img src="admin/productimages/' . htmlentities($recommendedProduct['id']) . '/' . htmlentities($recommendedProduct['productImage3']) . '" width="150" height="150" alt="">';
        echo "<h5>" . $recommendedProduct['productName'] . "</h5>";
        echo "<h5> Product Brand :" . $recommendedProduct['productCompany'] . "</h5>";
        echo "<div class='product-price'>	
                <span class='price'>
                    Product Price : Rs. " . htmlentities($recommendedProduct['productPrice']) . ".00
                </span>
                <br><span class='price-before-discount'> Price Before Discount : Rs." . htmlentities($recommendedProduct['productPriceBeforeDiscount']) . "</span>	</br>				
            </div><!-- /.product-price -->";
        echo "<h4>" . $recommendedProduct['productAvailability'] . "</h4>";

        // Display the rating
        echo '<div><span class="average">' . sprintf('%.1f', $average) . ' <small>/ 5</small></span> <span class="rating-reviews" style="font-size:16px;"><a href="show_rating.php?item_id=' . $recommendedProduct["id"] . '">Rating & Reviews</a></span></div>';
				

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

        echo "</div>";
    }
    echo "</div>"; // Close the sidebar carousel container
} else {
    echo "<p>No recommended products available.</p>";
}

