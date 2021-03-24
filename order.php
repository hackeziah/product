<?php 

	require_once("dbconnect.php");
	if($_POST) {
		$product = $_POST["product"];
		$price = $_POST["price"];
		$query = "INSERT into tblproductdetails(pname, price) values('".$product."', '".$price."');";
		if(!mysqli_query($conn, $query))
			die(mysql_error());
		else {
			$query = "select * from tblproductdetails;";
			$productList = mysqli_query($conn, $query);
			$query = "SELECT * from tblcustomer;";
			$customerList = mysqli_query($conn, $query);
		}
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Order</title>
	</head>
	<body>
		<form method="post" action="./ProcessOrder.php">
			Customer Name: <input type="text" name="customer"><br><br>
			Address: <input type="text" name="address"><br><br>
			<h3>Customer</h3>
			<table>
				<thead>
					<th>ID</th>
					<th>Customer Name</th>
					<th>Address</th>
				</thead>
				<tbody>
						<?php 
							$table1 = "";
							while($customer = mysqli_fetch_assoc($customerList)) {
								$table1 .= "<tr><td><input type='checkbox' value='".$customer["custid"]."' name='custid[]'></td><td>".$customer["custname"]."</td><td>".$customer["custaddress"]."</td></tr>";
							}
							echo $table1;
						?>
				</tbody>
			</table>
			
			<h3>Product</h3>
			<table>
				<thead>
					<th>ID</th>
					<th>Product</th>
					<th>Price</th>
				</thead>
				<tbody>
						<?php 
							$table = "";
							while($product = mysqli_fetch_assoc($productList)) {
								$table .= "<tr><td><input type='checkbox' value='".$product["pid"]."' name='prodid[]'></td><td>".$product["pname"]."</td><td>".$product["price"]."</td></tr>";
							}
							echo $table;
						?>
				</tbody>
			</table>
			<button type ="submit">Submit</button>
		</form>
	</body>
</html>