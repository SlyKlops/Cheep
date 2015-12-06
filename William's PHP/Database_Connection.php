<?php
// Opens a connection to the database
// Since it is a php file it won't open in a browser
// It should be saved outside of the main web documents folder
// and imported when needed

// Defined as constants so that they can't be changed
DEFINE ('DB_USER', 'root');
DEFINE ('DB_PASSWORD', 'root');
DEFINE ('DB_HOST', 'localhost');
DEFINE ('DB_NAME', 'cheep');

// $dbc will contain a resource link to the database
// @ keeps the error from showing in the browser
$dbc = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
if ($dbc->connect_error) {
    die("Connection failed: " . $dbc->connect_error);
} 

?>