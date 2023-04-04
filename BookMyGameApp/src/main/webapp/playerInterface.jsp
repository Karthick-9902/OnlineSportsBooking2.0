<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
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
        <li><a href="./controller/playerprofile">Profile</a></li>
        <li><a href="./controller/mybookings">My Bookings</a></li>
        <li><a href="./controller/checkfacilities">Book Now</a></li>
        <li><a href="./controller/inbox">Inbox</a></li>
        <li><a href="./controller/hosting">Hostings</a></li>
        <li><a href="./controller/logout">Log Out</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header>
    <main>
      <h1 class="main-heading">Welcome <%=session.getAttribute("pname") %></h1>
      <p>Book and Enjoy your Game!!!</p>

</main>
</body>
</html>