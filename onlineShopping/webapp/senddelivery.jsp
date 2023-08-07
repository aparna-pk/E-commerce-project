<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sended</title>
</head>
<body>

<%
String id= request.getParameter("id");
int d_id=0;
try{
	Connection con=ConnectionProvider.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from deliverd_table");
	
	while(rs.next())
	{
		d_id=rs.getInt(1);
		d_id=d_id+1;
	}
	ResultSet rs1=st.executeQuery("select * from cart where cart_id='"+id+"'");
	while( rs1.next())
	{
		PreparedStatement pst=con.prepareStatement("insert into deliverd_table values(?,?,?,?,?,?)");
		pst.setInt( 1, d_id);
		pst.setString(2, rs1.getString(2));
		pst.setString(3, rs1.getString(3));
		pst.setString(4, rs1.getString(4));
		pst.setString(5, rs1.getString(5));
		pst.setString(6, rs1.getString(6));
		pst.executeUpdate();
	}
	
	st.executeUpdate("delete from cart where cart_id='"+id+"'");
	response.sendRedirect("ordersreceived.jsp?msg=done");
}catch (Exception e)
{
	response.sendRedirect("ordersreceived.jsp?msg=undone");
	e.printStackTrace();
}
%>

</body>
</html>