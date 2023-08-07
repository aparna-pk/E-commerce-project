<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="headerUser.jsp" %>
<%@ include file="footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My cart</title>
<style type="text/css"><%@include file="/WEB-INF/CSS/table.css"%></style>
</head>
<body style="padding-top: 180px;padding-bottom: 100px;">

<div style="color: #FFBF00; text-align: center;">
<% String msg=request.getParameter("msg");
     		if("done".equals(msg))
     		{
     	%>
     	<h2>*** Deleted successfully ***</h2>
     	<%	}
     		if("undone".equals(msg))
     		{
     	%>
     	<h2>Something went wrong....!</h2>
     	<%	
     		}
     	%>
</div>

	<table>
	<thead><tr>
	<th>Product id</th>
	<th>Price</th>
	<th>Quantity</th>
	<th>Total</th>
	<th>Cancel</th>
	</tr></thead>
	<%
	
	String myemail=session.getAttribute("email").toString();
	String total;
	try{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from cart where email='"+myemail+"'");
		
		while(rs.next())
		{
	%>
	<tr>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><a href="cancel.jsp?id=<%= rs.getString(1) %>">Cancel</a></td>
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