<?php 

	require_once("dbconnect.php");
	if($_POST) {
		$product = $_POST["product"];
		$price = $_POST["price"];
		$query = "INSERT into tblproductdetails(pname, price) values('".$product."', '".$price."');";
		if(!mysqli_query($conn, $query))
			die(mysql_error());
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Customer</title>
	</head>
	<body>
		<form method="post" action="./order.php">
			Customer Name: <input type="text" name="customer"><br><br>
			Address: <input type="text" name="address"><br><br>
			<button type="submit">Save</button>
		</form>
	</body>
</html>