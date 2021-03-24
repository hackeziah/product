<?php 

	require_once("dbconnect.php");
	if($_POST) {
		$custId = 0;

			$orderList = "";
			if(isset($_POST["custid"])) {
				$custId = $_POST["custid"][0];
			} else {
				$customer = $_POST["customer"];
				$address = $_POST["address"];
				$query = "INSERT into tblcustomer(custname, custaddress) values('".$customer."', '".$address."');";
				mysqli_query($conn, $query);
				$custId = $conn->insert_id;
			}
			
			$query = "select * from tblproductdetails;";
			$productList = mysqli_query($conn, $query);
			$prodId = $_POST["prodid"][0];
			$query1 = "INSERT into tblorder(orderdate, pid, custid) values(now(), '".$prodId."', '".$custId."');";
			if(!mysqli_query($conn, $query1))
				echo $query1;
			else {	
				$orderList = mysqli_query($conn, "SELECT * FROM tblorder inner join tblcustomer on tblcustomer.custid = tblorder.custid inner join tblproductdetails on tblproductdetails.pid = tblorder.pid");
			}
		
		
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Order Successful</title>
	</head>
	<body>
		<table>
			<thead>
				<th>Order ID</th>
				<th>Date</th>
				<th>Product</th>
				<th>Customer</th>
			</thead>
			<tbody>
				<?php 
					$table = "";
					while($order = mysqli_fetch_assoc($orderList)) {
						$table .= "<tr> <td>".$order["orderid"]."</td> <td>".$order["orderdate"]."</td><td>".$order["pname"]."</td><td>".$order["custname"]."</td> </tr>";
					}
					echo $table;
				?>
			</tbody>
		</table>
		<a href="./index.php">Back to start</a>
	</body>
</html>