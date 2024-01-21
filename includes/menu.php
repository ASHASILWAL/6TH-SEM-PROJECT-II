<?php
$email = '';
$show = '';
if(!empty($_SESSION['userId']) && $_SESSION['userId']) {
	$email =  $_SESSION['email'];		
} else {
	$show = 'hidden';
}
?>	
<br>
<span><a href="index1.php">Home</span>
<div id="loggedPanel" class="<?php echo $show; ?>">
	Logged in <span id="loggedUser" class="logged-user"><?php echo $email; ?></span>
	<a href="action.php?action=logout">Logout</a>
</div>
<br><br><br>