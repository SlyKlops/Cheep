<?php
include"config.php";

$username = $_POST['username'];
$email = $_POST['email'];
$fname = $_POST['fname'];
$lname = $_POST['lname'];
$password = md$($_POST['password']);

$insert = 'INSERT into users(username, email, fname, lname, password) VALUES("'.$username.'","'.$email.'","'.$fname.'","'.$lname.'","'.$password.'")';

mysql_query($insert);

?>