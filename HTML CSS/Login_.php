<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel ="stylesheet" type="text/css" href="style.css">
<title>Login</title>
</head>

<body>

<div class="container">
  <div class="content">
    <center><h1>CHEEP</h1></center>
    <hr  /><br />
    <center>
    <form>
    <input style="padding:3px" type="text" name="Username" placeholder="Username" />
    <br />
    <input style="padding:3px" type="text" name="Password" placeholder="Password" />
    <br />
    <font size="3"><input type="checkbox" name="Remember" value="Remember" />Remember</font>
    <br />
	<?php echo "hello world"; ?>
    <br />
    </form>
    <form style="padding:3px" action="index.html">
    <input type="submit" value="Login">
    </form>
	<form style="padding:3px" action="Registration.html">
    <input type="submit" value="New User">
	</form>
  
    <br />
    <p><a style="text-decoration: none" href="index.html">&#162 </a></p>
    </center>
  
   </div>
  </div>
</body>
</html>
