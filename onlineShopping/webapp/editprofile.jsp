<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionProvider"%>
<%@ include file="headerUser.jsp" %>
<%@ include file="footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>updation</title>
<style type="text/css">

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

.f1 div select
{
	width: 400px;
	height: 30px;
}

</style>
</head>


<body style="background-image: url('W2.jpg'); padding-bottom: 100px;">
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
<form action="editprofileaction.jsp" method="post" class="f1">
<h3 style="text-align: center;">Edit Details</h3>
<pre>
Name              :<input type="text" name="name" value="<%= rs.getString(1) %>">
		<br>
Email             :<input type="email" name="email" value="<%= rs.getString(2) %>" required="required">
		<br>
Mobile            :<input type="number" name="mobno" value="<%= rs.getString(3) %>">
		<br>
Security Question : <select name="qun" >
		<option>value="<%= rs.getString(4) %>"</option>
		<option value="What is your favorite color?">What is your favorite color?</option>
		<option value="Are you a cat or dog person?">Are you a cat or dog person?</option>
		<option value="If you were a superhero,what powers would you want to have?">If you were a superhero,what powers would you want to have?</option>
		<option value="What is your dream job?">What is your dream job?</option>
	    </select>
	    <br>
Answer             : <input type="text" name="answer" value="<%= rs.getString(5) %>">
		<br>
Password           :<input type="text" name="pwd" value="<%= rs.getString(6) %>">
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