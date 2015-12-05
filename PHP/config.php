<?php
$localhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "Present";

$connect = mysql_connect($localhost, $dbuser, $dbpass);
mysql_select_db("$dbname", $connect);
if($!connect)
{
	die('Could not connect: '.mysql_error());
}
?>