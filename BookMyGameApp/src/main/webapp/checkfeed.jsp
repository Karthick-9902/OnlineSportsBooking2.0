<%@page import="com.bmg.beans.Facility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
     <link rel="icon" type="image/x-icon" href="favicon2.ico">
    <title>Online Sports Booking</title>
    <style>
      /* Apply some global styles */
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        color: #333;
      }
      h1, h2, h3, h4, h5, h6 {
        font-family: 'Montserrat', sans-serif;
        font-weight: 700;
        color: #008080;
      }
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
      /* Style the main section */
      main {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        padding: 50px;
      }
      .main-heading {
        font-size: 48px;
        margin-bottom: 20px;
        text-align: center;
      }
      .cta-button {
        display: inline-block;
        padding: 20px 30px;
        font-size: 24px;
        font-weight: bold;
        background-color: #008080;
        color: #fff;
        border-radius: 5px;
        transition: all 0.2s ease-in-out;
      }
      .cta-button:hover {
        background-color: #006666;
        cursor: pointer;
      }
table {
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 20px;
}

th, td {
  text-align: left;
  padding: 8px;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #f5f5f5;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.facility-name,p {
  font-weight: bold;
  font-size: 24px;
  color: white;
}

.facility-info {
  font-size: 18px;
  color: #555;
  margin-left: 20px;
}
.facility-box {
  display: inline-block;
  background-color: #008080;
  color: white;
  padding: 8px;
  border-radius: 4px;
}
.th-label {
  font-weight: bold;
  margin-right: 5px;
  color: #008080;
}

.th-value {
  color: black;
}

      /* Style the footer */
      footer {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px -2px 5px rgba(0,0,0,0.1);
      }
      .footer-text {
        font-size: 18px;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <header>
      <div class="logo">Online Sports Booking</div>
      <ul class="nav">
        <li><a href="../login.html">Login</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header>
    <main>

	<c:forEach items="${facilities}" var="object">
		<form action="./book" method="post">
			<table>
				<tr>
					<th>
  <div class="facility-box">
    <span class="facility-name">${object.fname}</span>
  </div>
  <span class="facility-info">
    <span class="th-label">SPORT:</span>
    <span class="th-value">${object.fsport}</span>
    <span class="th-label">LOCATION:</span>
    <span class="th-value">${object.floc}</span>
    <span class="th-label">MAIL:</span>
    <span class="th-value">${object.fmail}</span>
  </span>
</th>
					<td><input type="hidden" name="fname" value="${object.fname}" /></td>
					<td><input type="submit" value="book" /></td>
				</tr>
			</table>
		</form>
	</c:forEach>



</main>
</body>
</html>