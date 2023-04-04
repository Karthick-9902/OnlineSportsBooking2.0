<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="icon" type="image/x-icon" href="favicon2.ico">
<title>HOSTINGS</title>
<style>
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
h1 {
			font-size: 36px;
			margin-top: 30px;
			margin-bottom: 25px;
			color: white;
		}
	.section {
  background-color: #008080;
  border: 1px solid #ccc;
  border-radius: 10px;
  padding: 20px;
  margin: 20px;
  box-shadow: 5px 5px 10px #888888;
}

.booking {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.facility {
  background-color: #444444;
  color: white;
  font-weight: bold;
  padding: 5px;
  border-radius: 5px;
  margin-right: 10px;
}

.date {
  background-color: #444444;
  color: white;
  font-weight: bold;
  padding: 5px;
  border-radius: 5px;
  margin-left: 10px;
}

.value {
  color: black;
  font-weight: bold;
  padding: 5px;
  border-radius: 5px;
  background-color: #cccccc;
}

	</style>
</head>
<% 
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if (session.getAttribute("mail") == null) {
	response.sendRedirect("http://localhost:9999/BookMyGameApp/login.html");
}
%> 
<body >
 <header>
      <div class="logo">Online Sports Booking</div>
      <ul class="nav">
        <li><a href="../playerInterface.jsp">Home</a></li>
        <li><a href="./checkfacilities">Book Now</a></li>
        <li><a href="./mybookings">My Bookings</a></li>
        <li><a href="./inbox">Inbox</a></li>
        <li><a href="./logout">Log Out</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header>
	<div class="section">
  <h1>Your Hostings</h1>
  <c:if test="${youhostings eq 'no' }">
    <h4>No host type bookings you booked.</h4>
  </c:if>
  <c:forEach items="${yourhostings}" var="host">
    <div class="booking">
      <div class="facility">
        Facility:
      </div>
      <div class="value">
        ${host.bookKey.fname} 
      </div>
      <div class="date">
        Booked Date:
      </div>
      <div class="value">
        ${host.bookKey.bookDate}
      </div>
    </div>
  </c:forEach>
</div>


	<div style=" background-color: #008080;border: 2px solid #ddd; padding: 20px; margin: 20px; border-radius: 10px;box-shadow: 5px 5px 10px #888888;'">

	<h1>Hostings</h1>

	<c:if test="${hosting eq 'no' }">
		<c:out value="NO HOST TOURNAMENTS"></c:out>
	</c:if>

	<c:forEach items="${hostings}" var="host">
		<form action="./joinhost" style="margin-left: 25%">
			<div style="background-color: #f5f5f5;border-radius: 5px; padding: 6px; margin-bottom: 10px;">
				<span style="font-weight: bold; color: #333;margin-left: 20px;">FACILITY:</span> ${host.bookKey.fname} 
				<span style="font-weight: bold; color: #333;margin-left: 20px;">TOURNAMENT DATE:</span> ${host.bookKey.bookDate} 
				<span style="font-weight: bold; color: #333;margin-left: 20px;">HOSTED BY:</span> ${host.userMail} 
			</div>
			<input type="hidden" name="fname" value="${host.bookKey.fname}">
			<input type="hidden" name="bdate" value="${host.bookKey.bookDate}">
			<input type="hidden" name="hostmail" value="${host.userMail}">
			<input type="submit" value="JOIN" style="background-color: #007bff; border: none; color: #fff; padding: 10px 20px; border-radius: 5px; cursor: pointer;"> 
		</form>
	</c:forEach>

</div>


	<div style=" background-color: #008080;border: 2px #ddd; border-radius: 10px; padding: 20px; margin: 20px; box-shadow: 5px 5px 5px grey;">
	<h1>JOIN REQUESTS</h1>
	
	<c:if test="${hostingreq eq 'no' }">
		<h4 align="center" style="font-weight: bold;color: white" >NO REQUESTS YET!!</h4>
	</c:if>
	
	<c:forEach items="${hostingrequests}" var="req">
			<form action="./requestaccept" style="margin-left: 25%">
				<div style="background-color: #f5f5f5;border-radius: 5px; padding: 6px; margin-bottom: 10px;margin-left: 10px;">
					<span style="font-weight: bold;">FACILITY:</span> ${req.hostKey.fname}
				<span style="margin-left: 10px;font-weight: bold;">USER:</span> ${req.hostKey.userMail}
				<span style="margin-left: 10px;font-weight: bold;">TOURNAMENT DATE:</span> ${req.hostKey.bdate}<br>
				</div>
					
				<input type="hidden" name="fname" value="${req.hostKey.fname}">
				<input type="hidden" name="bdate" value="${req.hostKey.bdate}">
				<input type="hidden" name="usermail" value="${req.hostKey.userMail}">
			
				<input type="submit" name="joinrequest" value="ACCEPT" > 
				<input type="submit" name="joinrequest" value="DECLINE" > 
			</form>
	</c:forEach>
</div>

</body>
</html>








