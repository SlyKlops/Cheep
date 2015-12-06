<?php require_once("Database_Connection.php");?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel ="stylesheet" type="text/css" href="style.css">
<title>Item Search</title>
</head>

<body>

<div class="container">
	<div class="content">
	<center><h1>CHEEP</h1></center>
    <hr />
	   	<div class="fltrt">
        <font size="3"><a href="ItemEdit.php">Edit Mode</a></font>
        </div>
        <div class="clearfloat"></div>
        <br /><br />
        <center>
    	<form>
    	<input type="search" name="Item Search" placeholder="Item Search" />
   	 	<br />
    	<br />
        </form>
        <br />
		<div	id= "dvtable">
<?php 
	//$sqli = "SELECT * FROM item_location_price";
	$sqli = "CALL `Get_ILP_byZip`(36081)";
	$results = $dbc->query($sqli);


       echo"<table><tr><th>Item</th><th>Location</th><th>Price</th></tr>";
     // output data of each row
     while($row = $results->fetch_assoc()) {
         echo "<tr><td>" . $row["Name"]. "</td><td>" . $row["LName"]. "</td><td>".$row["Price"]."</td></tr>";
	 }
	 echo "</table>";
?>
    
		</div>
		<div id="responsecontainer" align="center"></div>
      	<form action="ListView.php">
	    <input type="submit" value="Add Item">
		</form>
        <br />
        <p><a style="text-decoration: none" href="index.html">&#162 </a></p>
        </center>
        
           
   </div>
  </div>
</body>
</html>
