<?php 
//session_start();

?>

<div class="top-bar animate-dropdown" >
	<div class="container">
		<div class="header-top-inner">
			<div class="cnt-account">
				<ul class="list-unstyled">

<?php if(strlen($_SESSION['login']))
    {   ?>
				<li><a href="#"><i class="icon fa fa-user"></i> Hello -<?php echo htmlentities($_SESSION['username']);?></a></li>
				<?php } ?>

					<li><a href="my-account.php"><i class="icon fa fa-user"></i>My Profile</a></li>
					<li><a href="my-wishlist.php"><i class="icon fa fa-heart"></i>My Wishlist</a></li>
					<li><a href="my-cart.php"><i class="icon fa fa-shopping-cart"></i>My Cart</a></li>
					<?php if(strlen($_SESSION['login'])==0)
    {   ?>

  <li>
    <a href="login.php">
      <i class="icon fa fa-sign-in"></i>
      Login
    </a>
    <ul>
      <li>
        <a href="login.php">
          <i class="icon-tasks"></i>
          Login as User
        </a>
      </li>
      <li>
        <a href="admin/index.php">
          <i class="icon-tasks"></i>
          Login as Admin
        </a>
      </li>
    </ul>
  </li>


<?php }
else{ ?>
	
				<li><a href="logout.php"><i class="icon fa fa-sign-out"></i>Logout</a></li>
				<?php } ?>	
				</ul>
			</div><!-- /.cnt-account -->

<div class="cnt-block">
				<ul class="list-unstyled list-inline">
					<li class="dropdown dropdown-small">
						<a href="track-orders.php" class="dropdown-toggle" ><span class="key">Track Order</b></a>
						
					</li>

				
				</ul>
			</div>

			<div class="cnt-block">
				<ul class="list-unstyled list-inline">
					<li class="dropdown dropdown-small">
			
						<?php
						date_default_timezone_set('Asia/Kathmandu'); // Set the timezone to Asia/Kathmandu for Lalitpur, Nepal
	$currentTime = date('d-m-Y h:i:s A', time());
	
	echo $currentTime; // Output the current time
	
?>
						
					</li>

				
				</ul>
			</div>
			
			<div class="clearfix"></div>
		</div><!-- /.header-top-inner -->
	</div><!-- /.container -->
</div><!-- /.header-top -->

<style>
    .top-bar {
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 1000;
        background-color: white;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        padding: 10px; /* Adjust padding as needed */
    }
</style>


