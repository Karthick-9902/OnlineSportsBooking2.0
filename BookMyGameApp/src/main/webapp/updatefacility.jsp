<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
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
        padding: 30px;
      }
      form {
			width: 50%;
			margin: 0 auto;
			background-color: #ffffff;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.5);
		}
		form label {
			display: block;
			margin-top: 20px;
			font-size: 18px;
			color: #555555;
		}
		form input[type=text], form input[type=password], form select {
			width: 100%;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
			font-size: 18px;
			color: #555555;
			margin-top: 5px;
			margin-bottom: 20px;
			box-sizing: border-box;
		}
		form a {
			margin-left: 19%;
			font-size: 13.5px;
			color: #0077b3;
			text-decoration: none;
		}
		form input[type=submit] {
			background-color: #008080;
			color: #ffffff;
			border: none;
			border-radius: 5px;
			font-size: 18px;
			padding: 10px 20px;
			cursor: pointer;
			margin-bottom: 20px;
		}
		form input[type=submit]:hover {
			background-color: #c90052;
		}
		p {
			margin-top: 20px;
			text-align: center;
			font-size: 18px;
			color: #555555;
		}
		p a {
			color: #0077b3;
			text-decoration: none;
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
        <li><a href="../adminInterface.jsp">Home</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header><br>
    <main>


		<form action="./updatefacility">
		<input type="hidden" value="${facilityname}" name="facilityname"> <br> 
		<span style="font-weight: bold;color: #008080;">Facility Name: ${facility.fname} </span><br>
		<label for="fowner">Facility Owner Name: </label> <input type="text"
			id="fowner" name="fowner" value="${facility.fowner}"
			placeholder="Enter your Facility Owner Name" required><br>
			 <label for="fphone">Facility Phone Number: </label> <input
			type="text" id="fphone" name="fphone" value="${facility.fphone}"
			placeholder="Enter your Facility Phone Number" required><br>

		 <label for="fsport">Facility's Sport: </label> <input
			type="text" id="fsport" name="fsport" value="${facility.fsport}"
			placeholder="Enter your Facility's Sport" required><br>
		 <label for="floc">Facility's Location: </label> <input
			type="text" id="floc" name="floc" value="${facility.floc}"
			placeholder="Enter your Facility's Location" required><br>
		 <label for="fmail">Facility's Contact Mail: </label> <input
			type="text" id="fmail" name="fmail" value="${facility.fmail}"
			placeholder="Enter your Facility Mail" required><br> <input
			type="submit" value="update">

	</form>
</main>
	
		</body>
		</html>