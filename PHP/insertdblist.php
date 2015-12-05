<html>
	<head>
	<title>Insert data into database</title>
	</head>
	<body>
	<?php

	// Connect to database server
	nnect($host, $user, $dbname) or die (mysql_error ());

	// Select database
	mysql_select_db("cheepdb") or die(mysql_error());

	// The SQL statement is built

	$strSQL = "INSERT INTO Item(";

	$strSQL = $strSQL . "Name, ";
	$strSQL = $strSQL . "Description, ";

	$strSQL = $strSQL . "Category, ";
	

	$strSQL = $strSQL . "VALUES(";

	$strSQL = $strSQL . "'Bacon', ";

	$strSQL = $strSQL . "'Walmart', ";
	$strSQL = $strSQL . "'Food', ";

	$strSQL = $strSQL . "'1964-04-20')";

	// The SQL statement is executed 
	mysql_query($strSQL) or die (mysql_error());

	// Close the database connection
	mysql_close();
	?>

	<h1>The database is updated!</h1>
	</body>
	</html>
	