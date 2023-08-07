<%@ include file="header.jsp" %>
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
<title>Delivered orders</title>
<style type="text/css"><%@include file="/WEB-INF/CSS/table.css"%></style>
</head>
<body style="padding-top: 180px;padding-bottom: 100px;background-image: url('Wavy_Bus-30_Single-08.jpg');">

	<table>
	<thead><tr>
	<th>Customer ID</th>
	<th>Product ID</th>
	<th>Quantity</th>
	<th>Price</th>
	<th>Total</th>
	</tr></thead>
	<%
	try{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from deliverd_table");
		while(rs.next())
		{
	%>
	<tr>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
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