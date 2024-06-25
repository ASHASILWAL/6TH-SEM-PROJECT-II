
action.php



<?php
session_start();
include 'class/Rating.php';
$rating = new Rating();
// if(!empty($_POST['action']) && $_POST['action'] == 'userLogin') {
//  $user = $_POST['user'];
//  $pass = $_POST['pass'];
//  $loginDetails = $rating->userLogin($user, $pass);   
//  $loginStatus = 0;
//  $userName = "";
//  if (!empty($loginDetails)) {
//      $loginStatus = 1;
//      $_SESSION['user'] = $loginDetails[0]['user'];
//      // $_SESSION['username'] = $loginDetails[0]['username'];        
//      // $_SESSION['avatar'] = $loginDetails[0]['avatar'];
//      // $userName = $loginDetails[0]['username'];
//  }       
//  $data = array(
//      "user" => $userName,
//      "success"   => $loginStatus,    
//  );
//  echo json_encode($data);    
// }
if(!empty($_POST['action']) && $_POST['action'] == 'saveRat' 
    && !empty($_SESSION['id']) 
    && !empty($_POST['rating']) 
    && !empty($_POST['productId'])) {
        $userID = $_POST['id']; 
        $rating->saveRating($_POST, $userID);   
        $data = array(
            "success"   => 1,   
        );
        echo json_encode($data);     
         
}
// if(!empty($_GET['action']) && $_GET['action'] == 'logout') {
//  session_unset();
//  session_destroy();
//  header("Location:index.php");
// }
?>


