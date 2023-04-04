<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>BookedFacilities</title>
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
		}

		h1 {
			text-align: center;
			font-size: 3rem;
			margin-top: 2rem;
			color: #002F6C;
			text-shadow: 2px 2px #B7BCC1;
		}

		form {
			margin: 2rem auto;
			width: 60%;
			background-color: #F2F2F2;
			border: 1px solid #D9D9D9;
			border-radius: 5px;
			padding: 2rem;
			box-shadow: 2px 2px 5px #B7BCC1;
			transition: all 0.3s ease-in-out;
		}

		form:hover {
			transform: scale(1.02);
			box-shadow: 3px 3px 7px #B7BCC1;
		}

		table {
			margin-top: 1rem;
			border-collapse: collapse;
			width: 100%;
			font-size: 1.2rem;
		}

		th, td {
			text-align: left;
			padding: 0.5rem;
			border-bottom: 1px solid #D9D9D9;
		}

		tr:hover {
			background-color: #E2E2E2;
		}

		input[type="submit"] {
			background-color: #002F6C;
			color: #FFFFFF;
			border: none;
			padding: 0.5rem;
			border-radius: 5px;
			cursor: pointer;
			transition: all 0.3s ease-in-out;
		}

		input[type="submit"]:hover {
			background-color: #B7BCC1;
			color: #002F6C;
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
        <li><a href="#">Contact</a></li>
      </ul>
    </header><br>
	<h1>BOOKINGS</h1>
	<c:forEach items="${booked}" var="booked">
		<form action="./getcancelpage">
			<table>
				<tr>
					<th><span style="font-weight: bold;color: #2827CC"> FACILITY:</span>${booked.bookKey.fname} <br> <span style="font-weight: bold;color: #2827CC;"> DATE:</span>${booked.bookKey.bookDate} <br>  <span style="font-weight: bold;color: #2827CC;">TYPE:</span>${booked.bookType}   <br> <span style="font-weight: bold;color: #2827CC;">BOOKED BY:</span>${booked.userMail}</th>
					<td><input type="hidden" name="fname" value="${booked.bookKey.fname}" /></td>
					<td><input type="hidden" name="bdate"
						value="${booked.bookKey.bookDate}" /></td>
					<td><input type="hidden" name="userMail"
						value="${booked.userMail}" /></td>
					<td><input type="submit" value="Cancel Booking"></td>
				</tr>

			</table>

		</form>

	</c:forEach>

</body>
</html>