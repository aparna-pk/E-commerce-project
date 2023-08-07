<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message action</title>
</head>
<body>
<%
 	String message=request.getParameter("mg");
	String email=session.getAttribute("email").toString();
	int id=0;
	
		try{
			Connection con=ConnectionProvider.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select max(m_id) from  message");
			while(rs.next())
			{
				id=rs.getInt(1);
				id=id+1;
			}
			PreparedStatement pst=con.prepareStatement("insert into message values(?,?,?)");
			pst.setInt(1, id);
			pst.setString(2, message);
			pst.setString(3, email);
			pst.executeUpdate();
			response.sendRedirect("messageus.jsp?msg=done");
		}catch(Exception e)
		{
			response.sendRedirect("messageus.jsp?msg=undone");
			e.printStackTrace();
		}
%>

</body>
</html>