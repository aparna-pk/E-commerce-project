
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserting product</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String pname=request.getParameter("pname");
	String pctgy=request.getParameter("pctgy");
	String price=request.getParameter("price");
	String active=request.getParameter("active");
	
		try{
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement st=con.prepareStatement("insert into product_table values(?,?,?,?,?)");
			st.setString(1, id);
			st.setString(2, pname);
			st.setString(3, pctgy);
			st.setString(4, price);
			st.setString(5, active);
			st.executeUpdate();
			response.sendRedirect("addNewProduct.jsp?msg=done");
		}catch(Exception e)
		{
			response.sendRedirect("addNewProduct.jsp?msg=undone");
			e.printStackTrace();
		}
%>
</body>
</html>