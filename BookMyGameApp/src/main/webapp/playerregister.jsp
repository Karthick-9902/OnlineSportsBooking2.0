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
			margin-top: 3px;
			margin-bottom: 16px;
			box-sizing: border-box;
		}
		form a {
			margin-left: 19%;
			font-size: 13.5px;
			color: #0077b3;
			text-decoration: none;
		}
		form input[type=submit] {
			background-color: #ff0066;
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
    <script>
function validateForm() {
  var password = document.getElementById("password").value;
  var confirmPassword = document.getElementById("password_confirm").value;
  if (password != confirmPassword) {
    alert("Passwords do not match.");
    return false;
  }
}
</script>
  </head>
  <body>
    <header>
      <div class="logo">Online Sports Booking</div>
      <ul class="nav">
        <li><a href="../index.html">Home</a></li>
        <li><a href="./checkfeed">Book Now</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </header>
    <main>
   <h1 align='center'>Player Registration</h1><br>
<form action="./register"onsubmit="return validateForm()"  method="post">
<input type="hidden" name="signupType" value="${signupType}"> <label for="name">Player Name: </label> <input type="text"
			id="name" name="name" placeholder="Player name" value=" ${name}" required><br>

 <label for="phonenum">Enter Phone Number: </label> <input type="text"
			id="phonenum" name="phonenum" placeholder="Enter your Phone Number" required>
		 <label for="mail">Enter your Mail-ID:</label> <input
			type="text" id="mail-id" name="mail"
			placeholder="Enter your  mail-ID" required>
		<label for="password">Password:</label> <input
			type="password" id="password" name="password" required>
		 <label for="password_confirm">Confirm Password:</label> <input
			type="password" id="password_confirm" name="password_confirm"
			required><br>
			<input type="submit" value="register">



</form>
</main>
		</body>
		</html>