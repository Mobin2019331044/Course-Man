<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<% if (session.getAttribute("username") == null) {
		response.sendRedirect("Login.jsp"); } %>
		
<% 


String hcata = (String) session.getAttribute("catagory");
System.out.println("catagroy testing : "+hcata);
if (!hcata.equals("admin")) {
	response.sendRedirect("error.jsp"); 
	}
 
 %>

<script>
	//Define a function to show/hide content based on its ID
	function displayContent(contentId) {
		// Get all elements with class name "content"
		var contents = document.getElementsByClassName("content");
		// Loop through all elements and hide them
		for (var i = 0; i < contents.length; i++) {
			contents[i].style.display = "none";
		}

		// Get the element with the specified ID and show it
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

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

<style>
.sidebar.clicked {
	background-color: red;
}

body {
/* 	background: url(images/html_table.jpg) center/cover; */
/* 	background: url(images/forestbridge.jpg) center/cover; */
	color:red;
}

body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
/* .bgimg { */
/*   background-image: url('/w3images/forestbridge.jpg'); */
/*   min-height: 100%; */
/*   background-position: center; */
/*   background-size: cover; */
/* } */

.Section_top{
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

@keyframes change{
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
	String hname = (String) session.getAttribute("name");
	String hID = (String) session.getAttribute("id");
	String huname = (String) session.getAttribute("username");
	
	
	
	%>

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
					<h3>Name: <%=hname%></h3>
					<h3>Reg: <%=hID%></h3>
					<h3><%=huname%>(Admin)
					</h3>
					
				</div>
			</div>
			<ul class="list-unstyled components sidebar mb-5">
				
				<li class="active"><a href="#" ><span
						class="fa fa-home mr-3"></span> Home</a></li>
				
				<!-- Button to display "New Course" content -->
				<li onclick="displayContent('content2')"><a href="#"
				><span class="fa fa-book mr-3"></span> New
						Course </a></li>
				
				<!-- Button to display "All Courses" content -->
				<li onclick="displayContent('content5')"><a href="#"><span
						class="fa fa-book mr-3"></span> All Courses </a></li>
				
				<!-- Button to display "Students" content -->
				<li onclick="displayContent('content3')"><a href="#"><span
						class="fa fa-book mr-3"></span> Students </a></li>
				
				<!-- Button to display "Teachers" content -->
				<li onclick="displayContent('content1')"><a href="#"><span
						class="fa fa-book mr-3"></span> Teachers </a></li>
				
				<!-- Button to display "Approve User" content -->	
				<li onclick="displayContent('content4')"><a href="#"><span
						class="fa fa-book mr-3"></span> Approve User </a></li>

				<li ><a href="logout_action.jsp"><span class="fa fa-sign-out mr-3"></span>
						Sign Out</a></li>
			</ul>

		</nav>


		<!-- Page Content  -->

		<div id="content" class="bgimg w3-display-container w3-animate-opacity w3-text-white Section_top">
		
		  <div class="w3-display-topleft w3-padding-large w3-xlarge">
   
  </div>
  <div class="w3-display-middle">
    <h1 class="w3-jumbo w3-animate-top" style="color:red">COURSE MAN</h1>
    <hr class="w3-border-grey" style="margin:auto;width:40%">
    <p class="w3-large w3-center"><%= (String)session.getAttribute("username")%></p>
  </div>
  <div class="w3-display-bottomleft w3-padding-large">
    Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">mobin.io</a>
  </div>

			<!--  Adding new course file  -->
			<%@ include file="admin_teachers.jsp"%>

			<!--  Adding new course file  -->
			<%@ include file="admin_newcourse.jsp"%>
			
			<!-- Including the "All Courses" content -->
			<%@ include file="admin_courses.jsp"%>


			<!--  showing all students  -->
			<%@ include file="admin_students.jsp"%>
			
			<!-- Including the "Approve User" content -->
			<%@ include file="admin_approve.jsp"%>
			
			

		</div>



		<script src="js/jquery.min.js"></script>
		<script src="js/popper.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/main.js"></script>
</body>
</html>