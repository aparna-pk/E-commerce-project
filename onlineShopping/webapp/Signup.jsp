<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Shopping</title>
<style type="text/css"><%@include file="/WEB-INF/CSS/signup.css"%></style>
</head>
<body>
<div class="main">
<div class="left">
	<form action="signupaction.jsp" method="post">
		<div><input type="text" name="name" placeholder="Enter Name"></div>
		<div><input type="email" name="email" placeholder="Enter Email"></div>
		<div><input type="number" name="mobno" placeholder="Enter Mobile number"></div>
	<div><select name="qun">
	    <option selected="selected" disabled="disabled">Choose your question</option>
		<option value="What is your favorite color?">What is your favorite color?</option>
		<option value="Are you a cat or dog person?">Are you a cat or dog person?</option>
		<option value="If you were a superhero,what powers would you want to have?">If you were a superhero,what powers would you want to have?</option>
		<option value="What is your dream job?">What is your dream job?</option>
	</select></div>
	<div><input type="text" name="answer" placeholder="Enter Answer"></div>
	<div><input type="password" name="pwd" placeholder="Enter Password"></div>
	<button type="submit">Sign Up</button>
	</form>
	
	<a href="loginpage.jsp">Login</a>
</div>
<div class="right" >

		<% String msg=request.getParameter("msg");
			if("valid".equals(msg))
			{
		%>
		<h2>*** Successfully Registerd ***</h2>
		<%}
			if("invalid".equals(msg))
			{
		%>
		<h2>something went wrong...!</h2>
		<%} %>
	<p>The Online shopping System is the application that allows 
	the user to shop online without going  shop to buy products...!</p>
</div>
</div>
</body>
</html>