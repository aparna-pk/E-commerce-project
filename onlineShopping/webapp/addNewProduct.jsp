<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adding New Product</title>

<style type="text/css"><%@include file="/WEB-INF/CSS/addItem.css"%></style>

</head>
<body style="background-image: url('Wavy_Bus-30_Single-08.jpg');">

<%
	int id=1;
	
	try{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select max(id) from product_table");
		
		while(rs.next())
		{
			id=rs.getInt(1);
			id=id+1;
		}
		
	}catch (Exception e)
	{
		e.printStackTrace();
	}
%>

<div class="form">
		<div>
			<h3> Product ID :<%= id %> </h3>
		</div>
	<form action="addNewProductAction.jsp">
			<input type="hidden" name="id" value="<% out.println(id);%>">
		<div class="item">
			<h3> Product Name: </h3><input type="text" name="pname" placeholder="Enter Product Name" required="required">
			
			<h3> Product Category: </h3>
			<input type="text" name="pctgy" placeholder="Enter Product category" required="required">
		</div>
		<br><br>
		<div class="item">
			<h3> Product Price: </h3>
			<input type="text" name="price" placeholder="Enter Product Price" required="required">
			<h3> Product Active: </h3>
			<select name="active">
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

<div style="color: #FFBF00; text-align: center;">
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg))
	{ %>
		
		<h2> *** Product Added Successfull ***</h2>
 <%	
	}
	if("undone".equals(msg))
	{ %>
		<h2> Something Went Wrong ...!</h2>
	<%
	}
%>

</div>

</body>
</html>