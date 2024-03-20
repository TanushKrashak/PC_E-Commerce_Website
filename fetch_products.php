<?php
// Include your database connection file
include_once "db.php";

// Check if the request contains minimum and maximum price parameters
if (isset($_POST['minPrice']) && isset($_POST['maxPrice'])) {
    // Sanitize and validate input
    $minPrice = floatval($_POST['minPrice']);
    $maxPrice = floatval($_POST['maxPrice']);

    // Prepare SQL statement to fetch products within the specified price range
    $sql = "SELECT * FROM products WHERE product_price BETWEEN ? AND ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("dd", $minPrice, $maxPrice);
    $stmt->execute();
    $result = $stmt->get_result();

    // Output HTML for displaying filtered products
    while ($row = $result->fetch_assoc()) {
        echo "<div class='product'>";
        echo "<h2>" . $row['product_name'] . "</h2>";
        echo "<p>Price: $" . $row['product_price'] . "</p>";
        // Output additional product details as needed
        echo "</div>";
    }

    // Close statement and database connection
    $stmt->close();
    $conn->close();
} else {
    // If parameters are missing, send an error response
    echo "Missing parameters";
}
?>