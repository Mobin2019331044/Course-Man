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
	            String sql = "select course_code from course,registered where username=? and course.teacher_id=ID";
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1,username);
				
	            ResultSet rs = pstmt.executeQuery();
		        
				while(rs.next())
				{
					String course_c = rs.getString(1);
					System.out.println(course_c);
					%>
					<button class = "but_on" onclick="openStudentsPage('<%= course_c %>')"><%= course_c %></button>
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
          
          var url = "teacher_stlist.jsp?course_code=" + encodedCourseName;

          var newWindow = window.open(url, "_blank", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);


    	  // Construct the URL for the new page, passing the course name as a parameter
    	  

    	  // Open the new page in a new tab or window
    	  //window.open(url, "_blank");
     }
     
     
     

   
//     function openPopup() {
//       document.getElementById('popup').style.display = 'block';
//       // Make an AJAX request to fetch the student list data from the server
//       var xhr = new XMLHttpRequest();
//       xhr.onreadystatechange = function() {
//         if (this.readyState == 4 && this.status == 200) {
//           var studentList = JSON.parse(this.responseText);

//           var ul = document.getElementById('student-list');
//           studentList.forEach(function(student) {
//             var li = document.createElement('li');
//             li.appendChild(document.createTextNode(student.name));
//             ul.appendChild(li);
//           });
//         }
//       };
//       xhr.open("GET", "teacher_stlist.jsp", true);
//       xhr.send();
//     }

//     function closePopup() {
// //      document.getElementById('popup').style.display = 'none';
//     }
  </script>
</body>

</html>
</div>