<%@ include file="headerUser.jsp" %>
<%@ include file="footer.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<style type="text/css">

.hai
{
margin-top:180px;
width:100%;
background-color: rgba(4,144,143,.7);
color: white;
}

<%@include file="/WEB-INF/CSS/table.css"%>
</style>
</head>
<body style="background-image: url('W2.jpg'); padding-bottom: 100px;">
		
		<div class="hai">
		<% String name= request.getParameter("name");%>
		
		<div style="text-align: center;"><h3>Hai <% out.println(name); %> </h3></div>
		<div style="text-align: center;">
		<%
	String msg=request.getParameter("msg");
	if("added".equals(msg))
	{ %>
		
		<h2> *** Product Added to cart ***</h2>
 <%	
	}
	if("undone".equals(msg))
	{ %>
		<h2> Something Went Wrong ...!</h2>
	<%
	}
	if("exist".equals(msg))
	{ %>
		
		<h2> *** Product Added to cart ***</h2>
 <%	
	}
%>
		</div>
		</div>
		
	<table>
	<thead><tr>
	<th>Product Name</th>
	<th>Product Category</th>
	<th>Price</th>
	<th>Active status</th>
	<th>Add to cart</th>
	</tr></thead>
	<%try{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from product_table");
		while(rs.next())
		{
	%>
	<tr>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><a href="addcart.jsp?id=<%= rs.getString(1) %>">Add to cart</a></td>
	</tr>
	<%
		}
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	
	 %>
</table>
				
</body>
</html>