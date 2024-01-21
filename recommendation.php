<?php
session_start();

$title = 'Recommendation';

// Step 1: Fetch Data from the Database
include "includes/config.php";


// Define the recommendProductsBasedOnHighestAverageRating function
function recommendProductsBasedOnHighestAverageRating($con, $numRecommendations) {
    $query = "SELECT productId, AVG(ratingNumber) AS averageRating FROM item_rating GROUP BY productId ORDER BY averageRating DESC LIMIT $numRecommendations";
    $result = mysqli_query($con, $query);

    $recommendations = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $productId = $row['productId'];
        $averageRating = $row['averageRating'];
        $recommendations[$productId] = $averageRating;
    }

    return $recommendations;
}

function displayProductDetails($con, $productId) {
    $query = "SELECT * FROM products WHERE id = '$productId'";
    $result = mysqli_query($con, $query);
    $productDetails = mysqli_fetch_assoc($result);

    echo "<div>";
    echo '<img src="admin/productimages/' . htmlentities($productDetails['id']) . '/' . htmlentities($productDetails['productImage3']) . '" width="200" height="200" alt="">';
    echo "<h4>" . $productDetails['productName'] . "</h4>";
    echo "<h4> Product Brand :" . $productDetails['productCompany'] . "</h4>";
    echo "<div class='product-price'>	
            <span class='price'>
                Product Price : Rs. " . htmlentities($productDetails['productPrice']) . ".00
            </span>
            <br><span class='price-before-discount'> Price Before Discount : Rs." . htmlentities($productDetails['productPriceBeforeDiscount']) . "</span>	</br>				
        </div><!-- /.product-price -->";
    echo "<h4>" . $productDetails['productAvailability'] . "</h4>";

    if ($productDetails['productAvailability'] == 'In Stock') {
        echo "<div class='cart clearfix animate-effect'>";
        echo "<div class='action'>";
        echo "<div class='add-cart-button btn-group'>";
        echo "<i class='fa fa-shopping-cart'></i>";
        echo "<a href='category.php?page=product&action=add&id={$productDetails['id']}'>";
        echo "<button class='btn btn-primary' type='button'>Add to cart</button>";
        echo "</a>";
        echo "</div>";
        echo "</div><!-- /.action -->";
        echo "</div><!-- /.cart -->";
    }

    echo "<br><p><bold> Description: " . $productDetails['productDescription'] . "</br></bold></p>";
    echo "</div>";
}

// Define other functions (getUserRatings, calculateAverageRating, findNearestNeighbors, generateRecommendations, calculateSimilarity)

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if user is not logged in
if (!isset($_SESSION['login'])) {
    // User not logged in
    $recommendations = recommendProductsBasedOnHighestAverageRating($con, 4); // Change 4 to the desired number of recommendations
    // Debugging: Output the recommendations for debugging purposes
   
} else {
    $query1 = "SELECT id, email FROM users WHERE email = '" . $_SESSION['login'] . "' LIMIT 1";
    $result1 = mysqli_query($con, $query1);

    if ($result1) {
        $row = mysqli_fetch_assoc($result1);

        if (isset($row['id'])) {
            $targetUserId = $row['id'];

            // Check if the user has rated any products
            $queryTargetUserRatings = "SELECT * FROM item_rating WHERE userId = '$targetUserId'";
            $resultTargetUserRatings = mysqli_query($con, $queryTargetUserRatings);

            if ($resultTargetUserRatings && mysqli_num_rows($resultTargetUserRatings) > 0) {
                // User has rated products, recommend based on similarity
                $queryNumNeighbors = "SELECT COUNT(*) as num_neighbors FROM item_rating WHERE userId != '$targetUserId'";
                $resultNumNeighbors = mysqli_query($con, $queryNumNeighbors);
                $rowNumNeighbors = mysqli_fetch_assoc($resultNumNeighbors);
                $numNeighbors = $rowNumNeighbors['num_neighbors'];

                function getUserRatings($userId) {
                    global $con;
                
                    $query = "SELECT * FROM item_rating WHERE userId = '$userId'";
                    $result = mysqli_query($con, $query);
                
                    if (!$result) {
                        die("Query failed: " . mysqli_error($con) . "<br>Query: " . $query);
                    }
                
                    $ratings = [];
                    while ($row = mysqli_fetch_assoc($result)) {
                        $ratings[] = $row;
                    }
                
                    return $ratings;
                }

                if (!isset($users[$targetUserId]) || count($users[$targetUserId]) == 0) {
                    // If there are no ratings for the target user, recommend products based on highest average rating
                    $recommendations = recommendProductsBasedOnHighestAverageRating($con, 4); // Change 4 to the desired number of recommendations
                    // Debugging: Output the recommendations for debugging purposes
                   
                } else {
                    // User has rated products, find similarities and recommend
                    $nearestNeighbors = findNearestNeighbors($targetUserId, $users, $numNeighbors);
                    $recommendations = generateRecommendations($targetUserId, $nearestNeighbors, $users);
                    // Debugging: Output the recommendations for debugging purposes
                  
                }
            } else {
                // User has not rated any products
                $recommendations = recommendProductsBasedOnHighestAverageRating($con, 4); // Change 4 to the desired number of recommendations
                // Debugging: Output the recommendations for debugging purposes
         
            }
        } else {
            echo "<br><br><p style=\"font-weight: bold;\">No recommendations available.</p>";
            exit;
        }
    } else {
        echo "<br><br><p style=\"font-weight: bold;\">Error fetching user data. Please try again later.</p>";
        exit;
    }
}

// Display recommendations
if (empty($recommendations)) {
    echo "<br><br><p style=\"font-weight: bold;\">No personalized recommendations available. Explore our top-rated products:</p>";
    $recommendations = recommendProductsBasedOnHighestAverageRating($con, 4); // Change 4 to the desired number of recommendations
} else {
    foreach ($recommendations as $productId => $score) {
        displayProductDetails($con, $productId);
    }
}

mysqli_close($con);

echo "<style>";
echo "   p {";
echo "       color: red;";
echo "   }";
echo "</style>";
?>
