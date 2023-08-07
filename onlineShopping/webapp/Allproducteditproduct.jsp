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
<title>Insert title here</title>
<style type="text/css"><%@include file="/WEB-INF/CSS/table.css"%></style>
</head>
<body style="background-image: url('Wavy_Bus-30_Single-08.jpg');padding-bottom: 100px;">

<div style="color: #FFBF00; text-align: center; margin-top: 200px;">
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg))
	{ %>
		
		<h2> *** Product Updated Successfull ***</h2>
 <%	
	}
	if("undone".equals(msg))
	{ %>
		<h2> Something Went Wrong ...!</h2>
	<%
	}
%></div>

<table>
	<thead><tr>
	<th>ID</th>
	<th>Product Name</th>
	<th>Product Category</th>
	<th>Price</th>
	<th>Active status</th>
	<th>Edit</th>
	</tr></thead>
	<%try{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from product_table");
		while(rs.next())
		{
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
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