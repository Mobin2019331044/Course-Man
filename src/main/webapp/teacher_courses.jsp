<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ page import="java.sql.*" %>

<div class="content" id="content1" style="display: none;">


<!DOCTYPE html>
<html lang="en" title="Coding design">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <link rel="stylesheet" href="table_style.css">
    
    <style>
    
    input {
  outline: none;
  margin: 0;
  border: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  width: 100%;
  font-size: 14px;
  font-family: inherit;
}

.input--style-4 {
  line-height: 50px;
  background: #fafafa;
  -webkit-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  -moz-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  padding: 0 20px;
  font-size: 16px;
  color: #666;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.input--style-4::-webkit-input-placeholder {
  /* WebKit, Blink, Edge */
  color: #666;
}

.input--style-4:-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  color: #666;
  opacity: 1;
}

.input--style-4::-moz-placeholder {
  /* Mozilla Firefox 19+ */
  color: #666;
  opacity: 1;
}

.input--style-4:-ms-input-placeholder {
  /* Internet Explorer 10-11 */
  color: #666;
}

.input--style-4:-ms-input-placeholder {
  /* Microsoft Edge */
  color: #666;
}

.but_on{
	float: center;
	color: #fff;
	font-size: 16px;
	padding: 12px 35px;
	border-radius: 50px;
	display: inline-block;
	border: 0;
	outline: 0;
	box-shadow: 0px 4px 20px 0px #49c628a6;
	background-image: linear-gradient(135deg, #70F570 10%, #49C628 100%);
	
	margin:20px;
	height: 300px;
     width: 300px;
}

.but_on_sp {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 50px;
	padding: 15px 30px;
	font-size: 16px;
	cursor: pointer;
	position: relative;
	transition: all 0.5s;
	margin:20px;
	height: 300px;
     width: 300px;
}

.but_on_sp::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 0%;
	background-color: rgba(255, 255, 255, 0.2);
	transition: all 0.5s;
}

.but_on_sp:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.but_on_sp:hover::before {
	width: 100%;
}

.but_on_sp:active {
	transform: translateY(0px);
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

    
    </style>
</head>

<body>
    <main class="table">
        <section class="table__header">
            <h1>Courses</h1>
            
        </section>
        <section class="table__body">
        
        <%
		 	String db_url = "jdbc:mysql://localhost:3306/mobin";
		    String db_user = "root";
		    String db_pass = "";
		    String username = (String)session.getAttribute("username");
		    
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);
	
// 				String t_uname = (String) session.getAttribute("username");
				
	            // Execute SQL query to fetch names
	            String sql = "SELECT * FROM course WHERE course_code IN (SELECT course_tcode FROM teaches WHERE t_uname= ?)";
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1,username);
				
	            ResultSet rs = pstmt.executeQuery();
		        
				while(rs.next())
				{
					String course_c = rs.getString(1);
					String course_title = rs.getString(2);
					System.out.println(course_c);
					%>
					<button class = "but_on_sp" onclick="openStudentsPage('<%= course_c %>')"><%= course_c %><br><%=course_title %></button>
					<%
				}

	        } catch (Exception e) {
	            System.out.println("Error: " + e.getMessage());
	            response.sendRedirect("404.jsp");
	        }
		%>
            	
<%--             		<% String course = "22"; %> --%>
<!-- <!--             		<button class="but_on" id ="myButton" >click here </button> -->
<%--             		<button class = "but_on" onclick="openStudentsPage('<%= course %>')">Course A</button> --%>

<!--   <div id="popup" class="popup"> -->
<!--     <span class="close-btn" onclick="closePopup()">X</span> -->
<!--     <h2>Student List</h2> -->
<%--     <%@ include file="teacher_stlist.jsp"%> --%>
<!--   </div> -->
            	
        </section>
    </main>
    
     <script>
     
     
     document.getElementById("myButton").addEventListener("click", function() {
//        window.open("teacher_stlist.jsp", "_blank");
//        window.open("teacher_stlist.jsp", "_blank", "width=400, height=300");
       var width = window.screen.width-500; // Desired width of the window
       var height = window.screen.width -1020; // Desired height of the window

       // Calculate the left and top coordinates for centering the window
       var left = (window.screen.width / 2) - (width / 2);
       var top = (window.screen.height / 2) - (height / 2-100);

       var newWindow = window.open("teacher_stlist.jsp", "_blank", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);


     });
     
     function openStudentsPage(courseName) {
    	  // Encode the course name to be passed as a URL parameter
    	  var encodedCourseName = encodeURIComponent(courseName);
    	  
    	  var width = window.screen.width-500; // Desired width of the window
          var height = window.screen.width -1020; // Desired height of the window

          // Calculate the left and top coordinates for centering the window
          var left = (window.screen.width / 2) - (width / 2);
          var top = (window.screen.height / 2) - (height / 2-100);
          
       // Construct the URL for the new page, passing the course name as a parameter
          var url = "teacher_stlist.jsp?course_code=" + encodedCourseName;
			
       // Open the new page in a new tab or window
          var newWindow = window.open(url, "_blank", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);


    	  // Construct the URL for the new page, passing the course name as a parameter
    	  

    	  // Open the new page in a new tab or window
    	  //window.open(url, "_blank");
     }
      

  </script>
</body>

</html>
</div>