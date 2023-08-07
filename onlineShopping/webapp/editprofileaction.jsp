<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionProvider"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>updation</title>
</head>
<body>

<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mob_num=request.getParameter("mobno");
	String qun=request.getParameter("qun");
	String answer=request.getParameter("answer");
	String pwd=request.getParameter("pwd");
	String address=request.getParameter("adds");
	String state=request.getParameter("stat");
	String country=request.getParameter("cotry");
	
	
		try{
			Connection con=ConnectionProvider.getConnection();
			Statement st=con.createStatement();
			st.executeUpdate("update online_login set name='"+name+"', email='"+email+"',mob_number='"+mob_num+"' ,security_qn='"+qun+"',answer='"+answer+"',password='"+pwd+"',address='"+address+"',state='"+state+"',country='"+country+"' where email='"+email+"'");
		
			response.sendRedirect("editprofile.jsp?msg=done");
		
			
		}catch(Exception e)
		{
			response.sendRedirect("editprofile.jsp?msg=undone");
			e.printStackTrace();
		}
			
%>

</body>
</html>