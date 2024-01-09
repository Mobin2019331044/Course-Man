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
if (!hcata.equals("teacher")) {
	response.sendRedirect("error.jsp"); 
	}
 
 %>

<script>
//Function to display the specified content by ID and hide others
	function displayContent(contentId) {
		var contents = document.getElementsByClassName("content");
		for (var i = 0; i < contents.length; i++) {
			contents[i].style.display = "none";
		}

		var content = document.getElementById(contentId);
		if (content) {
			content.style.display = "block";
		}
	}
</script>

<!doctype html>
<html lang="en">
<head>
<title>Teacher Home</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/style_dashboard.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">

<style>
/*  Setting the font family for body and h1 elements */
	body, h1 {
		font-family: "Raleway", sans-serif;
	}
/* Setting the height of body and html elements to 100% */
	body, html {
		height: 100%;
	}
/*  Styling for a section with a background image */
	.Section_top {
		width: 100%;
		height: 100%;
		overflow: hidden;
		position: relative;
		background-image: url(images/image.jpg);
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		text-align: center;
		justify-content: center;
		animation: change 50s infinite ease-in-out;
	}
/* change color of key frames */
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
	<!-- Sidebar section for navigation -->
		<nav id="sidebar">

			<div class="img bg-wrap text-center py-4"
				style="background-image: url(images/bg_1.jpg);">
				<div class="user-logo">
					<div class="img" style="background-image: url(images/logo.jpg);"></div>
					<h3>Name: <%=name%></h3>
					<h3>Reg: <%=ID%></h3>
					<h3><%=uname%>(teacher)
					</h3>
				</div>
			</div>
			<ul class="list-unstyled components mb-5">
				<li class="active"><a href="#"><span
						class="fa fa-home mr-3"></span> Home</a></li>
				
				<!-- Button to display "Approve courses" content -->
				<li onclick="displayContent('content2')"><a href="#"><span
						class="fa fa-book mr-3"></span> Approve </a></li>
						
						<!-- Button to display "Teachers courses" content -->
				<li onclick="displayContent('content1')"><a href="#"><span
						class="fa fa-book mr-3"></span> Courses </a></li>

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
			
			<!--  all the courses assigned to the teacher  -->
			<%@ include file="teacher_courses.jsp"%>
			
			<!-- Teacher approval section -->
			<%@ include file="teacher_approve.jsp"%>


		</div>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>