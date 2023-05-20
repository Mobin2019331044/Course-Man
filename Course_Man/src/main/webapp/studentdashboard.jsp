<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<% if (session.getAttribute("username") == null) {
		response.sendRedirect("Login.jsp"); } %>

<script>
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
<title>Student Home</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/style_dashboard.css">

<style>
.sidebar.clicked {
	background-color: red;
}

body {
	background: url(images/html_table.jpg) center/cover;
}
</style>

</head>
<body>

<% String name = (String)session.getAttribute("name");
String ID = (String)session.getAttribute("id");
String cata = (String)session.getAttribute("catagory");
String uname = (String)session.getAttribute("username");
%>

	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			
			<div class="img bg-wrap text-center py-4"
				style="background-image: url(images/bg_1.jpg);">
				<div class="user-logo">
					<div class="img" style="background-image: url(images/logo.jpg);"></div>
					<h3><%= name %></h3>
					<h3><%= ID %></h3>
					<h3><%= uname %>(student)</h3>
				</div>
			</div>
			<ul class="list-unstyled components mb-5">
				<li class="active"><a href="#" style="color: red"><span
						class="fa fa-home mr-3"></span> Home</a></li>
			
				<li onclick="displayContent('content2')"><a href="#"><span
						class="fa fa-gift mr-3"></span>Register course</a></li>
				
				<li onclick="displayContent('content3')"><a href="#"><span
						class="fa fa-book mr-3"></span> Your courses </a></li>
				
				<li ><a href="logout_action.jsp""><span class="fa fa-sign-out mr-3"></span>
						Sign Out</a></li>
			</ul>

		</nav>


		<!-- Page Content  -->

		<div id="content">
			<div class="content" id="content1" style="display: none;">
				<h2>Content 1</h2>
				<p>This is the content for item 1.</p>
			</div>
			
			
			<!--  Register into new course file  -->
			<%@ include file="student_reg_course.jsp"%>
			
			
			<%@ include file="student_courses.jsp" %>
			
			
		</div>
	</div>



	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>