<?php

require_once('../mysqli_connect.php');

$query= "SELECT logId,	timestampx,	temperature FROM `test`.`test_temp`"

$response=@mysqli_query($dbc, $query);

if ($response){

	echo '<table align="left"
	       cellspacig="5"
	       cellpadding="8">

	<tr><td align="left"><b>logId</b></td>	
	<tr><td align="left"><b>timestampx</b></td>		
	<tr><td align="left"><b>temperature</b></td>';	
	
	while ($row=mysqli_fetch_array(response)){
	echo '<tr><td align="left">'
	$row['logId'].' </td><td align="left">'.
	$row['timestampx'].' </td><td align="left">'.
	$row['temperature'].' </td><td align="left">';
	
	echo '</tr>';
	}
	echo '</table>';
} else{
echo "Could not issue database query";
echo mysqli_error($dbc);
}

mysqli_close($dbc);
?>