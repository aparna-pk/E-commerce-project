<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin home</title>
<style type="text/css">
.head
{
	position:fixed;
	top:0px;
	left:0px;
	margin-top:10px;
	width: 100%;
	height: 150px;
	text-align: center;
	background-color:  #04908f;
	color: #FFBF00;
}
.head i
{
	width: 30px;
	height: 30px;
}

.head h2
{
	padding: 10px;
}

.head a
{
	padding: 5px;
}

</style>
<script src="https://kit.fontawesome.com/5f1faa468c.js" crossorigin="anonymous"></script>
</head>
<body>
     <div class="head">
     <h2>ONLINE SHOPPING</h2>
     <a href="adminhome.jsp">Home</a>
     <a href="addNewProduct.jsp">Add new Product  <i class="fa-solid fa-user-plus"></i> </a>
     <a href="Allproducteditproduct.jsp">All product and Edit product <i class="fa-regular fa-pen-to-square"></i> </a>
     <a href="msgview.jsp">Message Received <i class="fa-solid fa-message fa-sm"></i> </a>
     <a href="ordersreceived.jsp">Orders Received <i class="fa-solid fa-file-pen"></i> </a>
     <a href="deliverd.jsp">Delivered Orders <i class="fa-solid fa-truck"></i> </a>
     <a href="logout.jsp">Logout <i class="fa-solid fa-right-from-bracket"></i> </a>
     </div>
</body>
</html>