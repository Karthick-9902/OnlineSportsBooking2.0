<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="icon" type="image/x-icon" href="favicon2.ico">
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
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        form {
            margin: 0 auto;
            max-width: 500px;
            padding: 30px;
            border-radius: 5px;
            background-color: #FFFFFF;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333333;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="tel"], input[type="submit"], input[type="hidden"] {
            width: 100%;
            padding: 10px;
            border: 2px solid #CCCCCC;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 20px;
            color: #333333;
        }

        input[type="submit"] {
            background-color: #1ABC9C;
            color: #FFFFFF;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #16A085;
        }
    </style>
</head>
<body>
    <% 
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("mail") == null) {
            response.sendRedirect("http://localhost:9999/BookMyGameApp/login.html");
        }
    %>
    <header>
      <div class="logo">Online Sports Booking</div>
      <ul class="nav">
        <li><a href="./adminInterface.jsp">Home</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header><br>
    <form action="./controller/registerfacility">
        <label for="fname">Facility Name:</label>
        <input type="text" id="fname" name="fname" placeholder="Enter your Facility Name" required>
        <label for="fowner">Facility Owner Name:</label>
        <input type="text" id="fowner" name="fowner" placeholder="Enter your Facility Owner Name" required>
        <label for="fphone">Facility Phone Number:</label>
        <input type="tel" id="fphone" name="fphone" placeholder="Enter your Facility Phone Number" required>
        <label for="fsport">Facility's Sport:</label>
        <input type="text" id="fsport" name="fsport" placeholder="Enter your Facility's Sport" required>
        <label for="floc">Facility's Location:</label>
        <input type="text" id="floc" name="floc" placeholder="Enter your Facility's Location" required>
        <label for="fmail">Facility's Contact Mail:</label>
        <input type="email" id="fmail" name="fmail" placeholder="Enter your Facility Mail" required>
        <input type="hidden" name="fomail" value="<%=(String)session.getAttribute("mail") %>">
        <input type="submit" value="Register">
    </form>
</body>
</html>