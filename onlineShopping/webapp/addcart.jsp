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
<title>adding to cart</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String email=session.getAttribute("email").toString();
	int q=1;
	int price,total=0;
	int z=0;
	int cid=0;
		try{
			Connection con=ConnectionProvider.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select max(cart_id) from cart");
			while(rs.next())
			{
				cid=rs.getInt(1);
				cid=cid+1;
			}
			ResultSet rs1=st.executeQuery("select * from product_table where id='"+id+"'");
			while(rs1.next())
			{
				price=rs1.getInt(4);
				total=price;
				ResultSet rs2=st.executeQuery("select * from cart where id='"+id+"' and email='"+email+"'");
				while(rs2.next())
				{
					total=rs2.getInt(5);
					total=total+price;
					q=rs2.getInt(3);
					q=q+1;
					z=1;
				}
			
			if(z==1)
			{
				st.executeUpdate("update cart set email='"+email+"',id='"+id+"',quantity='"+q+"',price='"+price+"',total='"+total+"' where id='"+id+"' and email='"+email+"'");
				response.sendRedirect("userhome.jsp?msg=exist");
			}
			if(z==0)
			{
				
				PreparedStatement pst=con.prepareStatement("insert into cart values(?,?,?,?,?,?)");
				pst.setInt(1, cid);
				pst.setString(2,email);
				pst.setString(3,id);
				pst.setInt(4, q);
				pst.setInt(5,price);
				pst.setInt(6,total);
				pst.executeUpdate();
				response.sendRedirect("userhome.jsp?msg=added");
			}
		 }
		}
		catch(Exception e)
		{
			//response.sendRedirect("userhome.jsp?msg=undone");
			e.printStackTrace();
		}
%>
</body>
</html>