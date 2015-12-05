<?php
include("sqlConnectToServer.php");
mysql_select_db("CheepDB",$con);
$result=mysql_query("select * from item",$con);

echo "<table border='1' >
<tr>
<td align=center> <b>Item</b></td>
<td align=center><b>Price</b></td>
<td align=center><b>Location</b></td>
while($data = mysql_fetch_row($result))
{   
    echo "<tr>";
    echo "<td align=center>$data[0]</td>";
    echo "<td align=center>$data[1]</td>";
    echo "<td align=center>$data[2]</td>";
    echo "</tr>";
}
echo "</table>";
?>


