<?php 
require_once('Database_Connection.php');
  
if(isset($_POST['submit'])){
	$location = $_POST['Name'];
	$zip = $_POST['Zip'];

	$input = "CALL New_Location('$location', '$zip')";
	
	if ($dbc->query($input) === TRUE) {
		echo "New record created successful.";
	} else {
		echo "Error: " . $input . "<br>" . $dbc->error;
	}
header('Location:LocationSearch.php');
$dbc->close();
}
?>