<?php
session_start();
error_reporting(0);

// Include the database connection configuration file
require_once 'includes/config.php';

  // Create a new mysqli object for database connection
    $con = new mysqli(DB_SERVER, DB_USER, DB_PASS, DB_NAME);

    // Check connection
    if ($con->connect_error) {
        die("Connection failed: " . $con->connect_error);
    }

    // Prepare the SQL statement to insert data into the database
    $stmt = $con->prepare("INSERT INTO ratings (user_id, email, rating, feedback, submit_date) VALUES (?, ?, ?, ?, NOW())");
    $stmt->bind_param("isds", $userId, $email, $rating, $feedback);

    // Execute the statement
    if ($stmt->execute()) {
        echo "Thank you for your feedback!";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close the statement and connection
    $stmt->close();
    $con->close();
 else {
    echo "Invalid request";
}

// Ensure that the form was submitted
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Validate and sanitize user inputs
    $userId = filter_input(INPUT_POST, "user_id", FILTER_SANITIZE_NUMBER_INT);
    $email = filter_input(INPUT_POST, "email", FILTER_SANITIZE_EMAIL);
    $rating = filter_input(INPUT_POST, "rating", FILTER_VALIDATE_INT, array("options" => array("min_range" => 1, "max_range" => 5)));
    $feedback = filter_input(INPUT_POST, "feedback", FILTER_SANITIZE_STRING);

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Invalid email format");
    }

    // Validate rating
    if ($rating === false || $rating < 1 || $rating > 5) {
        die("Invalid rating");
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Rating Stars and Feedback</title>
</head>
<body>
    <h1>Rate Us</h1>
    <form action="rate.php" method="post">
        <p>
            <label for="user_id">User ID:</label>
            <input type="text" name="user_id" required>
        </p>
        <p>
            <label for="email">Email:</label>
            <input type="email" name="email" required>
        </p>
        <p>
            <label for="rating">Rating:</label>
            <select name="rating" required>
                <option value="">Select a rating</option>
                <option value="1">1 Star</option>
                <option value="2">2 Stars</option>
                <option value="3">3 Stars</option>
                <option value="4">4 Stars</option>
                <option value="5">5 Stars</option>
            </select>
        </p>
        <p>
            <label for="feedback">Feedback:</label><br>
            <textarea name="feedback" rows="4" cols="50" required></textarea>
        </p>
        <p>
            <input type="submit" value="Submit">
        </p>
    </form>
</body>
</html>
