<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>
<style>
body {
	        background-color: #f2f2f2;
	font-family: Arial, sans-serif;
}

.container {
	max-width: 500px;
	margin: 0 auto;
	padding: 50px 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

h1 {
	font-size: 36px;
	margin-top: 0;
	text-align: center;
	color:  #008080;;
}

form {
	margin-top: 30px;
}

label {
	display: inline-block;
	margin-right: 10px;
	font-weight: bold;
}

input[type="date"], input[type="radio"] {
	margin-bottom: 10px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #3e8e41;
}

a {
	color: #008080;
	text-decoration: none;
	transition: all 0.2s ease-in-out;
}

a:hover {
	color: #006666;
}

header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.logo {
	font-size: 24px;
	font-weight: bold;
	color: #008080;
}

.nav {
	display: flex;
	align-items: center;
}

.nav li {
	list-style: none;
	margin-left: 20px;
}

.nav a {
	font-size: 18px;
	font-weight: bold;
}
</style>
</head>
<% 
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if (session.getAttribute("mail") == null) {
	response.sendRedirect("http://localhost:9999/BookMyGameApp/login.html");
}
%> 
<%
LocalDate date = LocalDate.now().plusDays(1);
pageContext.setAttribute("date", date.toString());
%>

<body>
	<header>
		<div class="logo">Online Sports Booking</div>
		<ul class="nav">
			<li><a href="../playerInterface.jsp">Home</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</header>
	<br>
	<h1>Book Facility: ${fname}</h1>
	<div class="container">
		<form action="./bookfacility">
			<input type="hidden" name="fname" value="${fname}"> <label
				for="bdate">Select your Booking Date:</label> <input type="date"
				id="bdate" name="bdate"
				value="<%=pageContext.getAttribute("date", 1)%>"
				min="<%=pageContext.getAttribute("date", 1)%>" required><br>
			<label for="host">Booking Type:</label> <input type="radio" id="host"
				name="btype" value="host" required> <label for="host">Host</label>
			<input type="radio" id="play" name="btype" value="play" required>
			<label for="play">Play</label><br> <input type="submit"
				value="Book">
		</form>

	</div>
</body>
</html>
