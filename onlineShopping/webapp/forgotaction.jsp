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
<title>forgot action</title>
</head>
<body>

	<% 	String email=request.getParameter("email");
		String mobno=request.getParameter("mobno");
		String qun=request.getParameter("qun");
		String answer=request.getParameter("answer");
		String npwd=request.getParameter("npwd");
		
		int check=0;
		try{
			Connection con =ConnectionProvider.getConnection();
			Statement st =con.createStatement();
			ResultSet rs=st.executeQuery("select * from online_login where email='"+email+"' and mob_number='"+mobno+"' and security_qn='"+qun+"' and answer='"+answer+"'");
			while(rs.next())
			{
					check=1;
					st.executeUpdate("update online_login set password='"+npwd+"' where email='"+email+"'");
					response.sendRedirect("loginpage.jsp?msg=saved");
			}
			if(check==0)
			{
				response.sendRedirect("loginpage.jsp?msg=invalid");
			}
		}catch (Exception e)
		{
			e.printStackTrace();
		}
	%>

</body>
</html>