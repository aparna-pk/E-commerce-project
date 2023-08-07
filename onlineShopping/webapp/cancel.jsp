<%@page import="java.sql.Statement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cancel</title>
</head>
<body>

<%
	String id=request.getParameter("id");
	out.println(id);
	try{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		st.executeUpdate("delete from cart where cart_id='"+id+"'");
		response.sendRedirect("mycart.jsp?msg=done");
		
	}catch(Exception e)
	{
		response.sendRedirect("mycart.jsp?msg=undone");
		e.printStackTrace();
	}
%>

</body>
</html>