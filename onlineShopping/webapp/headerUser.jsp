<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User home</title>
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
	margin-left: 30px;
}

.b1
{
	margin:20px;
	background-color: white;
	width:100%;
	height:  30px;
	border-radius: 10px;
	margin-left: 50px;
	margin-right: 10px;
	bottom: 30px;	
}

.b1 input
{
	
	border: 0px;
	height: 20px;
	width: 200px;
	margin-top:5px;
	outline: 0;
}
.items
{
	display: flex;
}

</style>
<script src="https://kit.fontawesome.com/5f1faa468c.js" crossorigin="anonymous"></script>
</head>
<body>
     <div class="head">
     <h2>ONLINE SHOPPING</h2>
     <% String email=session.getAttribute("email").toString();%>
     <div class="items"><p style="margin: 10px;"><%=email %></p>
     <a href="userhome.jsp">Home</a>
     <a href="mycart.jsp">My Cart <i class="fa-solid fa-file-pen"></i> </a>
     <a href="editprofile.jsp">Edit profile </a>
     <a href="messageus.jsp">Message Us <i class="fa-solid fa-message fa-sm"></i> </a>
     <a href="changeadd.jsp">Change address <i class="fa-solid fa-truck"></i> </a>
     <a href="logout.jsp">Logout <i class="fa-solid fa-right-from-bracket"></i> </a>
     <form action="search.jsp"><div class="b1"><input type="text" name="search" placeholder="Search" >
     <button style="width: 30px;height: 25px;border: 0;right: 10px;padding: 5px;"><i class="fa-solid fa-magnifying-glass"></i></button></div></form></div>
     </div>
</body>
</html>