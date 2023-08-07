<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="headerUser.jsp" %>
<%@ include file="footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change cart</title>
</head>

<style type="text/css">

body
{
	padding-bottom: 100px;
}

.f1 
{
	font-size:20px;
	padding:10px;
	margin: 10px;
	color: #FFBF00;
}

.f1 input
{
  width: 400px;
  height: 30px;
  justify-content: space-around;
}

.f1 button
{
	background-color: #FFBF00;
	color:  #008080;
	width: 100%;
	height:30px;
	border-radius:10px;
	border: 0;
}

</style>

<body>
<div style="color: #FFBF00; text-align: center;margin-top: 200px;">
<% String msg=request.getParameter("msg");
     		if("done".equals(msg))
     		{
     	%>
     	<h2>*** Updated successfully ***</h2>
     	<%	}
     		if("undone".equals(msg))
     		{
     	%>
     	<h2>Something went wrong....!</h2>
     	<%	
     		}
     	%>
</div>
<% 
	String uemail=session.getAttribute("email").toString();
	try{	
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from online_login where email='"+uemail+"'");
		while(rs.next())
		{
	%>
<div style="margin-left:200px; background-color: rgba(4,144,143,.7);width: 800px;">
<form action="chaneaddaction.jsp" method="post" class="f1">
<h3 style="text-align: center;"><u>Address changed</u></h3>
<pre>
Name              :<input type="text" name="name" value="<%= rs.getString(1) %>">
		<br>
Address            :<input type="text" name="adds" value="<%= rs.getString(7) %>">
		<br>
State              :<input type="text" name="stat" value="<%= rs.getString(9) %>">
		<br>
Country            :<input type="text" name="cotry" value="<%= rs.getString(10) %>">
		<br>
<button type="submit">Save</button>
</pre>
</form>
	</div>	
<%
		}
}catch(Exception e)
{
	e.printStackTrace();
}
%>


</body>
</html>