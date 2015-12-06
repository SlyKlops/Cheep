 <?php
  require_once('Database_Connection.php');
  
if(isset($_POST['Login'])){
	$username = $_POST['username'];
	$password = $_POST['password'];
    
	$query = "SELECT Username, Password FROM user WHERE Username = '$username' and Password = '$password'";
	$response = mysqli_query($dbc, $query);
		if (mysqli_num_rows($response) != 0)
		{
			header('Location:index.html');
		}

		else
		{ 
			header('Location:Login.html');
		}
		
  $dbc->close();
}
?>
  
  