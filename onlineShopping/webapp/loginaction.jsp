
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
</head>
<body>
	<%	String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		
		if("admin@gmail.com".equals(email)&&"me123".equals(pwd))
		{
			session.setAttribute("email", email);
			response.sendRedirect("adminhome.jsp");
		}
		else
		{
			int z=0;
			try{
				Connection con=ConnectionProvider.getConnection();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from online_login where email='"+email+"' and password='"+pwd+"'");
				while(rs.next())
				{
					z=1;
					session.setAttribute("email", email);
					String name=rs.getString(1);
					response.sendRedirect("userhome.jsp?name="+name+"");
				}
				
				if(z==0)
				{
					response.sendRedirect("loginpage.jsp?msg=notexist");	
				}
				
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		
	%>
</body>
</html>