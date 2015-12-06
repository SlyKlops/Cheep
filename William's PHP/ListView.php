<?php require_once("Database_Connection.php");?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel ="stylesheet" type="text/css" href="style.css">
<title>List View</title>
</head>

<body>

<div class="container">
	<div class="content">
	<center><h1>CHEEP</h1></center>
   	<hr />
    <center>
	<div	id= "dvtable">
<?php 
$input = "SELECT *FROM list";
$result = $dbc->query($input);

if ($result->num_rows > 0)
{
     echo "<table><tr><th>Name</th><th>Description</th></tr>";
     // output data of each row
     while($row = $result->fetch_assoc()) {
         echo "<tr><td>" . $row["Name"]. "</td><td>". $row["Description"]."</td></tr>";
     }
     echo "</table>";
} 
?>    
	</div>
	<div id="responsecontainer" align="center"></div>
    <form action="ItemSearch.php">
	<input type="submit" value="Add Item">
	</form>
    <br />
    <form action="Optimize.html">
	<input type="submit" value="Optimize">
	</form>
    <br />
    <p><a style="text-decoration: none" href="index.html">&#162 </a></p>
    </center>
        
           
   </div>
  </div>
</body>
</html>
