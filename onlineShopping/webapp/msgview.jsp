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
<title>Message</title>
<style type="text/css"><%@include file="/WEB-INF/CSS/table.css"%></style>
</head>
<body style="background-image: url('Wavy_Bus-30_Single-08.jpg');padding-top: 180px;padding-bottom: 100px;">

	<table>
	<thead><tr>
	<th>Message ID</th>
	<th>Message</th>
	<th>Customer ID</th>
	
	</tr></thead>
	<%
	try{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from message");
		while(rs.next())
		{
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
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