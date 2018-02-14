<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Arithmetic Web Application</title>

<% 		   
	int a= Integer.parseInt(request.getParameter("value_a")); 
	int b= Integer.parseInt(request.getParameter("value_b"));
	
	%>
	
</head>
<body>
  <h1>Arithmetic Web Application</h1>
  
	<% if (request.getParameter("actionAdd") != null) {
    		int risSum= a+b;	%>
    		Result of Addition: <%= risSum %>
	<% } else if (request.getParameter("actionSub") != null) {
    		int risSub= a-b;	%>
    		Result of Subtraction: <%= risSub %>
	<% } else if (request.getParameter("actionMul") != null){
			int risMul = a*b; %>
			Result of Multiplication: <%= risMul %>
	<% } else if (request.getParameter("actionDiv") != null){	
			int risDiv= a/b;%>
			Result of Division: <%= risDiv %>
	<% } else if (request.getParameter("actionPow") != null){
			double risPow= Math.pow(a,b);%>
			Result of Elevation to power: <%= risPow %>
	<% } else if (request.getParameter("actionSQRT") != null){
			double risSQTR_A= Math.sqrt(a);
			double risSQTR_B= Math.sqrt(b);	%>
			<br>Result of Square Root about A: <%= risSQTR_A %>
			<br>Result of Square Root about B: <%= risSQTR_B %> 
	<% }	%>
	
	<br/><input type="button" value="Go Home Page" onclick="history.back()">
</body>
</html>