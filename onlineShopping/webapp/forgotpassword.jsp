<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Forgot password </title>
<style type="text/css"><%@include file="/WEB-INF/CSS/signup.css"%></style>
</head>
<body>
<div class="main">
<div class="left">
<div><h1 style="color:#04908f;"> Change Password </h1></div>
	<form action="forgotaction.jsp" method="post">
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
	<div><input type="password" name="npwd" placeholder="Enter new Password"></div>
	<button type="submit">Save</button>
	</form>
	
	<a href="loginpage.jsp">Login</a>
</div>
<div class="right" >

		
	<p>The Online shopping System is the application that allows 
	the user to shop online without going  shop to buy products...!</p>
</div>
</div>
</body>
</html>