<?php require_once("Database_Connection.php");?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel ="stylesheet" type="text/css" href="style.css">
<title>Location Search</title>
</head>

<body>

<div class="container">
  <div class="content">
    <center><h1>CHEEP</h1></center>
    <hr  /><br />
    <center>
    <form>
    <input type="search" name="Location Name" placeholder="Location Name" />
    <br />
    <br />
    </form>
	<?php 
	$sqli = "SELECT Name, Zip FROM location";
	$results = $dbc->query($sqli);


     echo "<table><tr><th>Name</th><th>Zip</th></tr>";
     // output data of each row
     while($row = $results->fetch_assoc()) {
         echo "<tr><td>" . $row["Name"]. "</td><td>" . $row["Zip"]. "</td></tr>";
	 }  echo "</table>";
?>

	<!--<input type="button" value="Generate Table"onclick="GenerateTable()" />
	<div id="myDynamicData">-->

	<hr />
	</div>
	<div>
	</div>
	<div id="responsecontainer" align="center"></div>
    <form style="padding:3px" action="LocationItem.html">
    <input type="submit" value="Edit Location">
    </form>
	<form style="padding:3px" action="CreateLocation.html">
    <input type="submit" value="Add New Location">
	</form>
    <br />
    <p><a style="text-decoration: none" href="index.html">&#162 </a></p>
    </center>
  
   </div>
  </div>
</body>
</html>