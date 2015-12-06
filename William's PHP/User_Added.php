
<?php

require_once('Database_Connection.php');

if(isset($_POST['submit'])){
	
	$username = $_POST['Username'];
	$password = $_POST['Password'];
	$email = $_POST['Email'];
	$zip = $_POST['Zip'];
	
	$input = "CALL New_User('$username', '$password', '$email', '36081')";

	if ($dbc->query($input) === TRUE) {
		echo "New record created successful.";
	} else {
		echo "Error: " . $input . "<br>" . $dbc->error;
	}

$dbc->close();

header('Location:Login.html');
}
?>
