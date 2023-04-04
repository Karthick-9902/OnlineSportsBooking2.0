<%@page import="com.bmg.beans.Facility"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	 <link rel="icon" type="image/x-icon" href="favicon2.ico">
	<title>Facility</title>
	<style>
	    a {
        color: #008080;
        text-decoration: none;
        transition: all 0.2s ease-in-out;
      }
      a:hover {
        color: #006666;
      }
      /* Style the header */
      header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
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
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}
		
		h1 {
			text-align: center;
			color: #0066cc;
			margin-top: 50px;
		}
		
		table {
			border-collapse: collapse;
			margin: 50px auto;
			background-color: #fff;
			box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
			border-radius: 10px;
			overflow: hidden;
		}
		
		th {
			background-color: #008080;
			color: #fff;
			padding: 15px;
			font-size: 20px;
			text-align: left;
			border-bottom: 5px solid #008080;
		}
		
		td {
			padding: 15px;
			font-size: 16px;
			color: #333;
			border-bottom: 1px solid #008080;
			text-align: left;
		}
		
		td input[type="submit"] {
			background-color: #0066cc;
			color: #fff;
			padding: 10px 15px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			margin-right: 10px;
			transition: background-color 0.3s;
		}
		
		td input[type="submit"]:hover {
			background-color: #003366;
		}
		form {
  text-align: center;
  margin-top: 20px;
}
		
		form input[type="submit"] {
			background-color: #008080;
			color: #fff;
			padding: 10px 15px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			margin-top: 20px;
			transition: background-color 0.3s;
		}
		
		form input[type="submit"]:hover {
			background-color: #003366;
		}
	</style>
</head>
<% 
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if (session.getAttribute("mail") == null) {
	response.sendRedirect("http://localhost:9999/BookMyGameApp/login.html");
}
%> 
<body>
 <header>
      <div class="logo">Online Sports Booking</div>
      <ul class="nav">
        <li><a href="../adminInterface.jsp">Home</a></li>
        <li><a href="./checkbookings">Bookings</a></li>
        <li><a href="./logout">Log Out</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header>
	<c:forEach items='<%=session.getAttribute("facilities")%>' var="object">
		<form action="./modifyFacility" method="post">
			<table>
				<tr>
					<th><span style="font-weight: bold;color: black;">FACILITY: </span>${object.fname}<span style="font-weight: bold;color: black;"> SPORT:</span> ${object.fsport} <span style="font-weight: bold;color: black;"> LOCATION:</span> ${object.floc}<span style="font-weight: bold;color: black;"> MAIL:</span> ${object.fmail}</th>
					<td><input type="hidden" name="fname" value="${object.fname}" /></td>
				</tr>
				<tr>
					<td>
						<input type="submit" name="operation" value="Delete" />
						<input type="submit" name="operation" value="Update" />
					</td>
				</tr>
			</table>
</form> 
</c:forEach>
<form action="../facilityregister.jsp" style="margin-right: 10 px;">
<input type="submit" value="addFacility">

</form>
</body>
</html>