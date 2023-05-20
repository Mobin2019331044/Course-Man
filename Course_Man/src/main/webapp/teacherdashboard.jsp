<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<% if (session.getAttribute("username") == null) {
		response.sendRedirect("Login.jsp"); } 
	
	
%>

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
  	<title>Teacher Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				
	  		<div class="img bg-wrap text-center py-4" style="background-image: url(images/bg_1.jpg);">
	  			<div class="user-logo">
	  				<div class="img" style="background-image: url(images/logo.jpg);"></div>
	  				<h3>Teacher name/id</h3>
	  			</div>
	  		</div>
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="#" ><span class="fa fa-home mr-3" ></span> Home</a>
          </li>
          
          <li onclick="displayContent('content2')">
            <a href="#"><span class="fa fa-book mr-3"></span> Approve </a>
          </li>
          <li onclick="displayContent('content1')">
            <a href="#"><span class="fa fa-book mr-3"></span> Courses </a>
          </li>
          
          <li ><a href="logout_action.jsp""><span class="fa fa-sign-out mr-3"></span>
						Sign Out</a></li>
        </ul>

    	</nav>
    	

        <!-- Page Content  -->
     
		  <div id="content">
		  
		  
		  <!--  all the courses assigned to   -->
			<%@ include file="teacher_courses.jsp"%>
			
			
			
      <div class="content" id="content1" style="display: none;">
        <h2>Content 1</h2>
        <p>This is the content for item 1.</p>
      </div>
      <div class="content" id="content2" style="display: none;">
        
		 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>


<%--   <%@page import="Project.ConnectionProvider"%> --%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.*" %>

<!-- <div> -->
<%-- 		<% --%>
// 		 	String db_url = "jdbc:mysql://localhost:3306/servletProject";
// 		    String db_user = "admin";
// 		    String db_pass = "Password@123";
		    
// 	        try {
// 	            Class.forName("com.mysql.jdbc.Driver");
// 	            Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);
	
// // 				String t_uname = (String) session.getAttribute("username");
//                 String t_uname = "fahim" ;
				
// 	            // Execute SQL query to fetch names
// 	            String sql = "SELECT courseCode FROM courseInfo WHERE courseTeacher = '" + t_uname + "'";
// 	            PreparedStatement pstmt = conn.prepareStatement(sql);
				
// 	            ResultSet rs = pstmt.executeQuery();
		        
// 				out.println("<ul>");
// 	            while (rs.next()) {
// 	                String c_id = rs.getString("courseCode");
// 	                out.println("<li><a href='registered_students.jsp?courseCode=" + c_id + "'>" + c_id + "</a></li>");
// 	            }
// 	            out.println("</ul>");

// 	        } catch (Exception e) {
// 	            System.out.println("Error: " + e.getMessage());
// 	            response.sendRedirect("404.jsp");
// 	        }
<%-- 		%> --%>
	
<!-- </div> -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
  </div>
		
		</div>
      
      
      <div class="content" id="content3" style="display: none;">
        <h2>Content 3</h2>
        <p>This is the content for item 3.</p>
      </div>
    </div>
  </div>
		
	

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>