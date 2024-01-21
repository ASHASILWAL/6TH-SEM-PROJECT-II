<?php
class Rating
{
    private $host = 'localhost';
    private $user = 'root';
    private $password = "";
    private $database = "sixproject";
    private $itemUsersTable = 'users';
    private $itemTable = 'products';
    private $itemRatingTable = 'item_rating';
    private $dbConnect = false;

    public function __construct()
    {
        if (!$this->dbConnect) {
            $conn = new mysqli($this->host, $this->user, $this->password, $this->database);
            if ($conn->connect_error) {
                die("Error failed to connect to MySQL: " . $conn->connect_error);
            } else {
                $this->dbConnect = $conn;
            }
        }
    }

    private function getData($sqlQuery)
    {
        $result = mysqli_query($this->dbConnect, $sqlQuery);
        if (!$result) {
            die('Error in query: ' . mysqli_error($this->dbConnect));
        }
        $data = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    private function getNumRows($sqlQuery)
    {
        $result = mysqli_query($this->dbConnect, $sqlQuery);
        if (!$result) {
            die('Error in query: ' . mysqli_error());
        }
        $numRows = mysqli_num_rows($result);
        return $numRows;
    }

    public function userLogin($email, $password)
    {
        $sqlQuery = "
            SELECT id, name, email 
            FROM " . $this->itemUsersTable . " 
            WHERE email = '" . mysqli_real_escape_string($this->dbConnect, $username) . "' AND password = '" . mysqli_real_escape_string($this->dbConnect, $password) . "'";
            
        return $this->getData($sqlQuery);
    }

    public function getItemList()
    {
        $sqlQuery = "
            SELECT * FROM " . $this->itemTable;
        return  $this->getData($sqlQuery);
    }

    public function getItem($productId)
    {
        $sqlQuery = "
            SELECT * FROM " . $this->itemTable . "
            WHERE id='" . mysqli_real_escape_string($this->dbConnect, $productId) . "'";
        return  $this->getData($sqlQuery);
    }

    public function getItemRating($productId)
    {
        $sqlQuery = "
            SELECT *
            FROM " . $this->itemRatingTable . " as r
            LEFT JOIN " . $this->itemUsersTable . " as u ON (r.userId = u.id)
            WHERE r.productId = '" . mysqli_real_escape_string($this->dbConnect, $productId) . "'";
        return  $this->getData($sqlQuery);
    }

    public function getRatingAverage($productId)
    {
        $itemRating = $this->getItemRating($productId);
        $ratingNumber = 0;
        $count = 0;
        foreach ($itemRating as $itemRatingDetails) {
            $ratingNumber += $itemRatingDetails['ratingNumber'];
            $count += 1;
        }
        $average = 0;
        if ($ratingNumber && $count) {
            $average = $ratingNumber / $count;
        }
        return $average;
    }

    public function saveRating($POST, $userID)
    {
        $productId = mysqli_real_escape_string($this->dbConnect, $POST['productId']);
        $rating = mysqli_real_escape_string($this->dbConnect, $POST['rating']);
        $title = mysqli_real_escape_string($this->dbConnect, $POST['title']);
        $comment = mysqli_real_escape_string($this->dbConnect, $POST["comment"]);

        $insertRating = "
            INSERT INTO " . $this->itemRatingTable . " (productId, userId, ratingNumber, title, comments, created, modified)
            VALUES ('$productId', '$userID', '$rating', '$title', '$comment', '" . date("Y-m-d H:i:s") . "', '" . date("Y-m-d H:i:s") . "')";
        mysqli_query($this->dbConnect, $insertRating);

    
}
}

?>
