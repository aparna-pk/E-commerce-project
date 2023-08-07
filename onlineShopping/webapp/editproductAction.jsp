<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionProvider"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
			Statement st=con.createStatement();
			st.executeUpdate("update product_table set p_name='"+pname+"', p_ctgy='"+pctgy+"', price='"+price+"' ,active='"+active+"' where id='"+id+"'");
		
		if(active.equals("no"))
		{
			st.executeUpdate("delete from product_table where id='"+id+"'");
		}
			response.sendRedirect("Allproducteditproduct.jsp?msg=done");
		
			
		}catch(Exception e)
		{
			response.sendRedirect("Allproducteditproduct.jsp?msg=undone");
			e.printStackTrace();
		}
			
%>

</body>
</html>