<?php
  require_once('Database_Connection.php');
  
  if(isset($_POST['add'])){
	$location = $_POST['Location'];
	$item = $_POST['ItName'];
	$price = $_POST['Price'];
	$zip = '36081';
	$blank = '';
  
  
  $query = "SELECT Name FROM item WHERE Name = '$item'";
	$response = mysqli_query($dbc, $query);
		if (mysqli_num_rows($response) != 0)
		{
			echo "If is running!";
			}
		else{ 
			echo "Else is running!";
			$Item = "CALL New_Item('$item', '$blank', '$blank')";
		
		if ($dbc->query($Item) === TRUE) {
				echo "New record created successful.";
			} else {
				echo "Error: " . $Item . "<br>" . $dbc->error;
			}
		}
		
		
  
  $query2 = "SELECT Name FROM location WHERE Name = '$location'";
	$response2 = mysqli_query($dbc, $query2);
		if (mysqli_num_rows($response2) != 0)
		{
			echo "If is running!";
		}
		else
		{ 
			echo "Else is running!";
			$Location = "CALL New_Location('$location', '$zip')";
		
		
			if ($dbc->query($Location) === TRUE) {
				echo "New record created successful.";
			} else {
				echo "Error: " . $Location . "<br>" . $dbc->error;
			}
		}
		
	echo "It Worked!";
	
	$ILP = "CALL New_ILP('$item', '$location', '$zip', '$price')";
	if ($dbc->query($ILP) === TRUE) {
		echo "New record created successful.";
	} else {
		echo "Error: " . $ILP . "<br>" . $dbc->error;
	}
	
	header('Location:LocationSearch.php');
	$dbc->close();
  }
?>