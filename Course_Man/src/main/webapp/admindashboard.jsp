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

// 		function changeColor() {
// 			var sidebar = document.querySelector('.sidebar');
// 			sidebar.classList.toggle('clicked');
// 		}
	}
</script>

<!doctype html>
<html lang="en">
<head>
<title>Admin Home</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/style_dashboard.css">
<link rel="stylesheet" href="table_style.css">

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

	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<!-- 			<div class="custom-menu"> -->
			<!-- 				<button type="button" id="sidebarCollapse" class="btn btn-primary"> -->
			<!-- 				</button> -->
			<!-- 			</div> -->
			<div class="img bg-wrap text-center py-4 "
				style="background-image: url(images/bg_1.jpg);">
				<div class="user-logo">
					<div class="img" style="background-image: url(images/stu.jpg);"></div>
					<h3>Name</h3>
				</div>
			</div>
			<ul class="list-unstyled components sidebar mb-5">
				
				<li class="active"><a href="#" ><span
						class="fa fa-home mr-3"></span> Home</a></li>

				<li onclick="displayContent('content2')"><a href="#"
				><span class="fa fa-book mr-3"></span> New
						Course </a></li>
				
				<li onclick="displayContent('content3')"><a href="#"><span
						class="fa fa-book mr-3"></span> Students </a></li>
				
				<li onclick="displayContent('content1')"><a href="#"><span
						class="fa fa-book mr-3"></span> Teachers </a></li>

				<li ><a href="logout_action.jsp""><span class="fa fa-sign-out mr-3"></span>
						Sign Out</a></li>
			</ul>

		</nav>


		<!-- Page Content  -->

		<div id="content">

			<!--  Adding new course file  -->
			<%@ include file="admin_teachers.jsp"%>

			<!--  Adding new course file  -->
			<%@ include file="admin_newcourse.jsp"%>


			<!--  showing all students  -->
			<%@ include file="admin_students.jsp"%>
			
			

		</div>



		<script src="js/jquery.min.js"></script>
		<script src="js/popper.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/main.js"></script>
</body>
</html>