<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Login here</title>
<style type="text/css"><%@include file="/WEB-INF/CSS/signup.css"%></style>
</head>
<body>
<div class="main" style="height: 300px;">
  <div class="left">
	<form action="loginaction.jsp">
		<div><input type="email" name="email" placeholder="Enter Email"></div>
		<div><input type="password" name="pwd" placeholder="Enter Password"></div>
		
		<button type="submit">Login</button>
	</form>
	<a href="Signup.jsp">Sign up   </a><br><br>
	<a href="forgotpassword.jsp">Forgot password ?</a>
  </div>	
  <div class="right">
     	<% String msg=request.getParameter("msg");
     		if("notexist".equals(msg))
     		{
     	%>
     	<h2>Incorrect password and Username...!</h2>
     	<%	}
     		if("saved".equals(msg))
     		{
     	%>
     	<h2>*** Password changed successfully ***</h2>
     	<%	
     		}
     		if("invalid".equals(msg))
     		{
     	%>
     	<h2>Something went wrong....!</h2>
     	<%	
     		}
     	%>
     
		<p>The Online shopping System is the application that allows 
			the user to shop online without going  shop to buy products...!</p>
  </div>
</div>
</body>
</html>