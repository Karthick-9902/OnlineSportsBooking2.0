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
   h1 {
    color: #3498db;
    font-size: 32px;
    margin-bottom: 20px;
    text-align: center;
  }
table {
  border-collapse: collapse;
  border: none;
  margin: 20px auto;
}

  th {
    background-color: #ecf0f1;
    color: #3498db;
    font-size: 18px;
    font-weight: bold;
    padding: 10px;
    text-align: center;
    text-transform: uppercase;
  }
  td {
    border: 1px solid #ccc;
    font-size: 16px;
    padding: 10px;
    text-align: center;
  }
  td.facility,
  td.date,
  td.type {
    font-weight: bold;
    color: #3498db;
  }
  input[type="submit"] {
    background-color: #e74c3c;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
    font-size: 16px;
    padding: 10px;
    transition: all 0.3s ease;
  }
  input[type="submit"]:hover {
    background-color: #c0392b;
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
        <li><a href="../playerInterface.jsp">Home</a></li>
        <li><a href="./checkfacilities">Book Now</a></li>
        <li><a href="./inbox">Inbox</a></li>
        <li><a href="./hosting">Hostings</a></li>
        <li><a href="./logout">Log Out</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header>
    <main>
      
  <h1>Your Bookings</h1>
<c:forEach items="${bookings}" var="bookings">
  <form action="./cancelbooking">
    <table>
      <tr>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <th>Facility</th>
        <td class="facility"><c:out value="${bookings.bookKey.fname}" /></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <th>Date</th>
        <td></td>
        <td class="date"><c:out value="${bookings.bookKey.bookDate}" /></td>
        <td></td>
      </tr>
      <tr>
        <th>Type</th>
        <td></td>
        <td></td>
        <td class="type"><c:out value="${bookings.bookType}" /></td>
      </tr>
      <tr>
        <td colspan="4" style="text-align: center;">
          <input type="hidden" name="fname" value="${bookings.bookKey.fname}" />
          <input type="hidden" name="bdate" value="${bookings.bookKey.bookDate}" />
          <input type="submit" value="Cancel Booking" />
        </td>
      </tr>
    </table>
  </form>
</c:forEach>
</main>
</body>
</html>