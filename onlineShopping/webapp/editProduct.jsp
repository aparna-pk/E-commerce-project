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
<title>Edit product</title>
<style type="text/css"><%@include file="/WEB-INF/CSS/addItem.css"%></style>
</head>
<body style="background-image: url('Wavy_Bus-30_Single-08.jpg');padding-bottom: 100px;">
<% 
String id=request.getParameter("id");
try{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from product_table where id='"+id+"'");
		while(rs.next())
		{
	%>
<div class="form">
<form action="editproductAction.jsp">
			<div>
			<h3><u> Edit product details</u></h3>
			<h3> Product ID :<%= id %> </h3>
			</div>
			<input type="hidden" name="id" value="<% out.println(id); %>">
		<div class="item">
			<h3> Product Name: </h3><input type="text" name="pname" value="<%= rs.getString(2)%>">
			
			<h3> Product Category: </h3>
			<input type="text" name="pctgy" value="<%= rs.getString(3)%>">
		</div>
		<br><br>
		<div class="item">
			<h3> Product Price: </h3>
			<input type="text" name="price" value="<%= rs.getString(4)%>">
			<h3> Product Active: </h3>
			<select name="active" >
				<option><%= rs.getString(5)%></option>
				<option value="yes">Yes</option>
				<option value="no">No</option>
			</select>
		</div>
		<br><br>
		<div>
		<button type="submit">Save</button>
		</div>
	</form>
	</div>	
	<%
		}
}catch(Exception e)
{
	e.printStackTrace();
}
	%>

</body>
</html>