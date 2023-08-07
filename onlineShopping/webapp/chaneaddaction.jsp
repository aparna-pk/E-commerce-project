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
</head>
<body>

<%
	String email=session.getAttribute("email").toString();
	String name=request.getParameter("name");
	String address=request.getParameter("adds");
	String state=request.getParameter("stat");
	String country=request.getParameter("cotry");
	
	
		try{
			Connection con=ConnectionProvider.getConnection();
			Statement st=con.createStatement();
			st.executeUpdate("update online_login set name='"+name+"',address='"+address+"',state='"+state+"',country='"+country+"' where email='"+email+"'");
		
			response.sendRedirect("changeadd.jsp?msg=done");
		
			
		}catch(Exception e)
		{
			response.sendRedirect("changeadd.jsp?msg=undone");
			e.printStackTrace();
		}
			
%>

</body>
</html>