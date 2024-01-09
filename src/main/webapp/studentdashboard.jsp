<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
if (session.getAttribute("username") == null) {
	response.sendRedirect("Login.jsp");
}
%>

<% 


String hcata = (String) session.getAttribute("catagory");
System.out.println("catagroy testing : "+hcata);
if (!hcata.equals("student")) {
	response.sendRedirect("error.jsp"); 
	}
 
 %>

<!-- The script tag contains a function for displaying content -->

<script>
	function displayContent(contentId) {
		var contents = document.getElementsByClassName("content");
		for (var i = 0; i < contents.length; i++) {
			contents[i].style.display = "none";
		}
		
		// Show the selected content element
		var content = document.getElementById(contentId);
		if (content) {
			content.style.display = "block";
		}
	}
</script>
<!-- The HTML code for the student dashboard page -->

<!doctype html>
<html lang="en">
<head>
<title>Student Home</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Import Google Fonts and Font Awesome icons -->

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
	
 <!-- Import custom CSS stylesheet for the dashboard -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/style_dashboard.css">

 <!-- Import W3.CSS and Raleway font -->

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">

<style>
/* The style for the top section of the p */

.Section_top {
	width: 100%;
	height: 100%;
	overflow: hidden;
	position: relative;
	background-image: url(images/image.jpg);
	/* Set the background image to image.jpg */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	text-align: center;
	justify-content: center;
	animation: change 50s infinite ease-in-out;
	 /* Apply the "change" animation to the background image */
}
/* The keyframes for the "change" animation */

@keyframes change { 
  0%
    {
        background-image: url(images/forestbridge.jpg);
    }
    20%
    {
        background-image: url(images/back1.jpg);
    }
    40%
    {
        background-image: url(images/back3.jpg);
    }
    60%	
    {
        background-image: url(images/back4.jpeg);
    }
    80%
    {
        background-image: url(images/back5.jpg);
    }
    100%
    {
        background-image: url(images/back6.jpg);
    }
}
</style>

</head>
<body>

	<%
	String name = (String) session.getAttribute("name");
	String ID = (String) session.getAttribute("id");
	String cata = (String) session.getAttribute("catagory");
	String uname = (String) session.getAttribute("username");
	%>

	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">

			<div class="img bg-wrap text-center py-4"
				style="background-image: url(images/bg_1.jpg);">
				<div class="user-logo">
					<div class="img" style="background-image: url(images/logo.jpg);"></div>
					<h3>Name: <%=name%></h3>
					<h3>Reg: <%=ID%></h3>
					<h3><%=uname%>(student)
					</h3>
				</div>
			</div>
			<ul class="list-unstyled components mb-5">
				<li class="active"><a href="#" style="color: red"><span
						class="fa fa-home mr-3"></span> Home</a></li>

				<li onclick="displayContent('content2')"><a href="#"><span
						class="fa fa-gift mr-3"></span>Register course</a></li>

				<li onclick="displayContent('content3')"><a href="#"><span
						class="fa fa-book mr-3"></span> Your courses </a></li>

				<li><a href="logout_action.jsp""><span
						class="fa fa-sign-out mr-3"></span> Sign Out</a></li>
			</ul>

		</nav>


		<!-- Page Content  -->

		<div id="content"
			class="bgimg w3-display-container w3-animate-opacity w3-text-white Section_top">

			<div class="w3-display-topleft w3-padding-large w3-xlarge"></div>
			<div class="w3-display-middle">
				<h1 class="w3-jumbo w3-animate-top" style="color: red">COURSE
					MAN</h1>
				<hr class="w3-border-grey" style="margin: auto; width: 40%">
				<p class="w3-large w3-center"><%=(String) session.getAttribute("username")%></p>
			</div>
			<div class="w3-display-bottomleft w3-padding-large">
				Powered by <a href="https://www.w3schools.com/w3css/default.asp"
					target="_blank">mobin.io</a>
			</div>
			<div class="content" id="content1" style="display: none;">
				<h2>Content 1</h2>
				<p>This is the content for item 1.</p>
			</div>


			<!--  Register into new course file  -->
			<%@ include file="student_reg_course.jsp"%>

			<!--  student's registered course  -->
			<%@ include file="student_courses.jsp"%>


		</div>
	</div>



	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>