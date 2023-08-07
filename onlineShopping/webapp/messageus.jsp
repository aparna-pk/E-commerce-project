<%@ include file="headerUser.jsp" %>
<%@ include file="footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message Us</title>
<style type="text/css">
.main
{
color: #FFBF00;
font-size:40px;
margin-left: 200px; 
margin-top: 180px; 
width:100%;
height: 100%;
padding: 30px;

}
.f
{
justify-content:  space-around;
padding: 20px;
}
.f textarea
{
	border-style: 0;
	padding: 20px;
	line-height: 20px;
	
}

.f button
{
	background-color:rgba(4,144,143); ;
	color:   #FFBF00;
	width: 100px;;
	height:30px;
	border-radius:10px;
	border: 0;
}

</style>
</head>
<body style="background-image: url('W2.jpg');padding-bottom: 100px;">
<div class="main">
<form action="messageaction.jsp" class="f">
		<label  style="padding: 1opx;">Enter user massage </label>
		<br>
		<textarea rows="10" cols="50" name="mg"></textarea>
		<br>	
		<button type="submit">Send</button>
</form>
<div style="text-align: center;font-size: 20px;">
<% String msg=request.getParameter("msg");
     		if("done".equals(msg))
     		{
     	%>
     	<h2>*** Message sended ***</h2>
     	<%	}
     		if("undone".equals(msg))
     		{
     	%>
     	<h2>Something went wrong....!</h2>
     	<%	
     		}
     	%>
</div>
</div>
</body>
</html>