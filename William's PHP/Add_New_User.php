<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel ="stylesheet" type="text/css" href="style.css">
<title>Registration</title>
</head>

<body>
<form action = "http://localhost/User_Added.php" method = "post" onsubmit="validateForm()">
<div class="container">
  <div class="content">
    <center><h1>CHEEP</h1></center>
    <hr  /><br />
    <center>
    <form>
    <input type="text" name="Username" placeholder="Username" size="30" value="" />
    <br />
    <br />
    <input type="password" name="Password" placeholder="Password" size="30" value="" />
    <input type="password" name="Confirm Password" placeholder="Confirm Password" />
    <br />
    <br />
    <input type="text" name="Email" placeholder="Email" size="30" value="" />
    <input type="text" name="Confirm Email" placeholder="Confirm Email" />
    <br />
    <br />
    <input type="text" name="Zip" placeholder="Zip" size="30" maxlength="5" value="" />
    </form>
    <br />
    <input type="submit" name="submit" value="submit">
	</form>
    <br />
	<p><a style="text-decoration: none" href="index.html">&#162 </a></p>
    </center>
  
  </div>
</div>
</form>
</body>
</html>