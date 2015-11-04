<?php
$localhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "Cheep";

$connect = mysql_connect($localhost, $dbuser, $dbpass);
mysql_select_db("$dbname", $connect);
?>