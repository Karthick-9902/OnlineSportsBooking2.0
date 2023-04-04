<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="favicon2.ico">
<title>BookMyGame</title>
<style>
		body {
			background-color: #f1f1f1;
			font-family: Arial, sans-serif;
		}
			h1 {
		color: #333333;
		font-size: 36px;
		margin: 50px 0 30px 0;
		text-align: center;
		text-shadow: 2px 2px #cccccc;
	}
	
	a {
		color: #ffffff;
		background-color: #4CAF50;
		border: none;
		border-radius: 5px;
		display: inline-block;
		font-size: 16px;
		padding: 10px 20px;
		text-decoration: none;
		margin: 20px auto;
	}
	
	a:hover {
		background-color: #3e8e41;
	}
	
	.container {
		margin: 0 auto;
		padding: 20px;
		max-width: 800px;
		background-color: #ffffff;
		box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
		border-radius: 10px;
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

<body>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if (session.getAttribute("mail") == null) {
	response.sendRedirect("http://localhost:9999/BookMyGameApp/login.html");
}
%>
<%
if(session.getAttribute("mail")!=null){
	if(session.getAttribute("type").equals("player"))
	   pageContext.setAttribute("nav", 1);
	else
	   pageContext.setAttribute("nav", 2 );
		
}

%>
<c:choose>
<c:when test="${nav eq 1 }">

 <header>
      <div class="logo">Online Sports Booking</div>
 <ul class="nav">
        <li><a href="../playerInterface.jsp">Home</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header>

</c:when>
<c:when test="${nav eq 2 }">

 <header>
      <div class="logo">Online Sports Booking</div>
 <ul class="nav">
        <li><a href="../adminInterface.jsp">Home</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header>

</c:when>
</c:choose>
<div class="container">
<c:set var="result" value='<%=pageContext.getAttribute("result",4)%>'/>
<c:choose>
<c:when test="${result eq 'success' }">
<h1 style="color: black">Registered......</h1>
<a href="../login.html" target="body">GETLOGINPAGE</a><br/>	<br>
</c:when>
<c:when test="${result eq 'error' }">
<h1 style="color: black">ERROR Try Again......</h1>
<a href="../register.html" target="body">GETREGISTERPAGE</a><br/>	<br>
</c:when>
<c:when test="${result eq 'derror' }">
<h1 style="color: black">ERROR Try Again......</h1>
</c:when>
<c:when test="${result eq 'dsuccess' }">
<h1 style="color: black">SuccessFully DELETED......</h1>
</c:when>
<c:when test="${result eq 'dfailed' }">
<h1 style="color: black">FAILED......</h1>
</c:when>
<c:when test="${result eq 'rerror' }">
<h1 style="color: black">ERROR While Register TRY AGAIN......</h1>
</c:when>
<c:when test="${result eq 'rsuccess' }">
<h1 style="color: black">SuccessFully REGISTERED......</h1>
</c:when>
<c:when test="${result eq 'facerror' }">
<h1 style="color: black">Error ..... MAY BE Already Register!!</h1>
</c:when>
<c:when test="${result eq 'rfailed' }">
<h1 style="color: black">FAILED TO REGISTER TRY AGAIN......</h1>
</c:when>
<c:when test="${result eq 'uerror' }">
<h1 style="color: black">ERROR While UPDATING TRY AGAIN......</h1>
</c:when>
<c:when test="${result eq 'usuccess' }">
<h1 style="color: black">SuccessFully UPDATED......</h1>
</c:when>
<c:when test="${result  eq 'ufailed' }">
<h1 style="color: black">FAILED TO UPDATE TRY AGAIN......</h1>
</c:when>
<c:when test="${result eq 'berror' }">
<h1 style="color: black">ERROR While BOOKING TRY AGAIN......</h1>
</c:when>
<c:when test="${result eq 'bierror' }">
<h1 style="color: black">ALREADY BOOKED BY SOMEONE......</h1>
</c:when>
<c:when test="${result eq 'bsuccess' }">
<h1 style="color: black">SuccessFully BOOKED......</h1>
</c:when>
<c:when test="${result  eq 'bfailed' }">
<h1 style="color: black">FAILED TO BOOK TRY AGAIN......</h1>
</c:when>
<c:when test="${result eq 'cerror' }">
<h1 style="color: black">ERROR While CANCELLING TRY AGAIN......</h1>
</c:when>
<c:when test="${result eq 'csuccess' }">
<h1 style="color: black">SuccessFully CANCELLED......</h1>
</c:when>
<c:when test="${result  eq 'cfailed' }">
<h1 style="color: black">FAILED TO CANCEL TRY AGAIN......</h1>
</c:when>
<c:when test="${result  eq 'isuccess' }">
<h1 style="color: black">CANCELLED AND MAIL SENT......</h1>
</c:when>
<c:when test="${result eq 'reqerror' }">
<h1 style="color: black">ERROR While REQUESTING TRY AGAIN......</h1>
</c:when>
<c:when test="${result eq 'reqsuccess' }">
<h1 style="color: black">SuccessFully REQUESTED......</h1>
</c:when>
<c:when test="${result  eq 'reqfailed' }">
<h1 style="color: black">FAILED TO REQUEST TRY AGAIN......</h1>
</c:when>
<c:when test="${result  eq 'reqalready' }">
<h1 style="color: black">ALREADY REQUESTED......</h1>
</c:when>
<c:when test="${result eq 'raerror' }">
<h1 style="color: black">ERROR......</h1>
</c:when>
<c:when test="${result eq 'rasuccess' }">
<h1 style="color: black">ACCEPTED AND MAIL SENT......</h1>
</c:when>
<c:when test="${result eq 'radsuccess' }">
<h1 style="color: black">DECLINED AND MAIL SENT......</h1>
</c:when>
<c:when test="${result  eq 'rafailed' }">
<h1 style="color: black">FAILED  TRY AGAIN......</h1>
</c:when>

</c:choose>
</div>
</body>
</html>