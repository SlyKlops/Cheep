<html>
	<head>
	<title>Retrieve data from database </title>
	</head>
	<body>

	<?php
	// Connect to database server
	mysql_connect($host, $user, $dbname) or die (mysql_error ());

	// Select database
	mysql_select_db("cheepdb") or die(mysql_error());

	// SQL query
	$strSQL = "SELECT * FROM Item";

	// Execute the query (the recordset $rs contains the result)
	$rs = mysql_query($strSQL);
	
	// Loop the recordset $rs
	// Each row will be made into an array ($row) using mysql_fetch_array
	while($row = mysql_fetch_array($rs)) {

	   // Write the value of the column FirstName (which is now in the array $row)
	  echo $row['Name'] . "<br />";

	  }

	// Close the database connection
	mysql_close();
	?>
	<form action="insert.php" method="post">
	<input type="text" name="Name" />
	<input type="submit" value="Save" />

	</form>
	</body>
	</html>