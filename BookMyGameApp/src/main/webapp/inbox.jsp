<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Inbox</title>
    <style>
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
       h2, h3, h4, h5, h6 {
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
        .message-box {
            border: 1px #008080;
            padding: 10px;
            margin-bottom: 10px;
        }
        .message-label {
            background-color: #008080;
            color: white;
            padding: 5px;
            margin-bottom: 5px;
        }
        .message-value {
            color: black;
        }
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
        <li><a href="../playerInterface.jsp">Home</a></li>
        <li><a href="./checkfacilities">Book Now</a></li>
        <li><a href="./mybookings">My Bookings</a></li>
        <li><a href="./hosting">Hostings</a></li>
        <li><a href="./logout">Log Out</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header>
    <c:forEach items="${messages}" var="message">
        <div class="message-box">
            <div class="message-label">MESSAGE</div>
            <div class="message-value">${message.message}</div>
        </div>
    </c:forEach>
</body>
</html>
