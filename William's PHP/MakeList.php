<?php 
require_once('Database_Connection.php');
  
if(isset($_POST['create'])){
	$listname = $_POST['List'];
	$username = 'Gibby';

	$input = "CALL New_List('$listname', '$username')";
	
	if ($dbc->query($input) === TRUE) {
		echo "New record created successful.";
	} else {
		echo "Error: " . $input . "<br>" . $dbc->error;
	}
header('Location:Lists.html');
$dbc->close();
}
?>