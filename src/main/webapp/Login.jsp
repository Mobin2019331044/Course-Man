<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
 <!-- Set the character encoding and page title -->
<meta charset="UTF-8">
<title>Login Page</title>

     <!-- Link to some external stylesheets and fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">


<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
	<link rel="stylesheet" href="./style.css">
	<link rel="stylesheet" href="assets/css/login_style.css">

<style>
 /* Custom styles can be added here */
</style>
</head>
<body>
	<!-- partial:index.partial.html -->
	<div class="box-form">
		<div class="left">
		<!-- A background image and overlay with some text on the left side of the form -->
        
			<div class="overlay">
				<h1>Welcome</h1>
				<h2>Course Man</h2>
				<span>
					<p>login with social media</p> <a href="#"><i
						class="fa fa-google" aria-hidden="true"></i> Google</a> <a href="#"><i
						class="fa fa-facebook" aria-hidden="true"></i>acebook</a> <a href="#"><i
						class="fa fa-twitter" aria-hidden="true"></i> Twitter</a>

				</span>
			</div>
		</div>
		
		<!-- The form with input fields for username, password, user type, and remember me checkbox -->

		<form action="loginaction" method="post">
			<div class="right">
				<h5>Sign in</h5>
				<!-- A link to the signup page -->
				<div class="btns">
				<p style="color: navy;">
					Don't have an account? 
				</p>
               <a href="signup.jsp">Create Account</a>
            </div>
             <!-- Input fields for username and password -->
				<div class="inputs">
					<input type="text" placeholder="user name" name="username">
					<br> <input type="password" placeholder="password"
						name="password">
				</div>

				<br>
				
				<!-- Radio buttons for user type -->
				
				<div class="radio">

					<input class="radio__input" type="radio" value="admin"
						name="userType" id="rad1"> <label class="radio__label"
						for="rad1"> Admin </label> <input class="radio__input"
						type="radio" value="student" name="userType" id="rad2"> <label
						class="radio__label" for="rad2"> Student </label> <input
						class="radio__input" type="radio" value="teacher" name="userType"
						id="rad3"> <label class="radio__label" for="rad3">
						Teacher </label>

				</div>



				<br>
				 <!-- Checkboxes for remember me and forget password -->

				<div class="remember-me--forget-password">

					<div class="custom-control custom-checkbox mb-3">
						<input type="checkbox" class="custom-control-input"
							id="customCheck" name="example1"> <label
							class="custom-control-label" for="customCheck"
							style="left: -50px">Remember me</label>
					</div>
					<p>forget password?</p>
				</div>

				<br>
				 <!-- A submit button for the form -->
				<button>Login</button>
			</div>


		</form>

	</div>
	<!-- The form ends here -->

</body>
</html>
