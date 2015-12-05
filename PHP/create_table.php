<?php
mysql_connect("localhost", "root", "cheepdb") or die(mysql_error());
	mysql_select_db("Item") or die(mysql_error());

	mysql_query("CREATE TABLE MyTable (
	ID INT AUTO_INCREMENT,
  	Name VARCHAR(255),
  	Description VARCHAR(255),
  	Category VARCHAR(255),
   	PRIMARY KEY(ID)
	)") Or die(mysql_error());
	mysql_close ();
	?>