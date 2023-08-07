<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up completed</title>
</head>
<body>
<%  String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mobno=request.getParameter("mobno");
	String qun=request.getParameter("qun");
	String answer=request.getParameter("answer");
	String pwd=request.getParameter("pwd");
	try
	{
		Connection con=ConnectionProvider.getConnection();
		PreparedStatement st=con.prepareStatement("insert into online_login(name,email,mob_number,security_qn,answer,password) values (?,?,?,?,?,?)");
		st.setString(1,name);
		st.setString(2,email);
		st.setString(3,mobno);
		st.setString(4,qun);
		st.setString(5,answer);
		st.setString(6,pwd);
		
		st.executeUpdate();
		response.sendRedirect("Signup.jsp?msg=valid");
		
	}catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("Signup.jsp?msg=invalid");
	}
	
%>

</body>
</html>