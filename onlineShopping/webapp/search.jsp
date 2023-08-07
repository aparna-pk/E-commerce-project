<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionProvider"%>
<%@ include file="headerUser.jsp" %>
<%@ include file="footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Searching</title>
<style type="text/css"><%@include file="/WEB-INF/CSS/table.css"%></style>
</head>
<body>

<table style="margin-top: 200px;">
	<thead><tr>
	<th>Product Name</th>
	<th>Product Category</th>
	<th>Price</th>
	<th>Active status</th>
	<th>Edit</th>
	</tr></thead>
<%
int z=0;
try{
String sh=request.getParameter("search");
Connection con=ConnectionProvider.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from product_table where p_name like '%"+sh+"%' or p_ctgy like '%"+sh+"%'");
while(rs.next())
{
	z=1;
%>
<tr>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><a href="addcart.jsp?id=<%=rs.getString(1)%>">add to cart</a></td>
</tr>
<%
}
}catch(Exception e)
{
	e.printStackTrace();
}
%>
</table>
<%
if(z==0)
{
	%>
	<h1 style="text-align: center;color: #FFBF00">Nothing to show</h1>
	<%
}
%>

</body>
</html>