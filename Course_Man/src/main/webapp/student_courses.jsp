<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<div class="content" id="content3" style="display: none;">
<%@ page import="java.sql.*"%>
<%
String d_url = "jdbc:mysql://localhost:3306/mobin";
String d_user = "root";
String d_pass = "";

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(d_url, d_user, d_pass);

	
	String sql = "select * from takes,course where takes.course_ccode = course.course_code and s_uname = ?";
	
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, (String)session.getAttribute("username"));
    
    ResultSet rs = pstmt.executeQuery();
	
    %>	

<!DOCTYPE html>
<html lang="en" title="Coding design">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    
    
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
    <link rel="stylesheet" href="table_style.css">
    
  <style>
    
    
    .but_on{
	float: right;
	color: #fff;
	font-size: 16px;
	padding: 12px 35px;
	border-radius: 50px;
	display: inline-block;
	border: 0;
	outline: 0;
	box-shadow: 0px 4px 20px 0px #49c628a6;
	background-image: linear-gradient(135deg, #70F570 10%, #49C628 100%);

  </style>
    
</head>

<body>
    <main class="table">
        <section class="table__header">
            <h1>Available Courses to Register</h1>
            
        </section>
        <section class="table__body">
          <form action="" method = "post">
            <table>
                <thead>
                    <tr>
                        <th>Course Code </th>
                        <th>Course Title</th>
                        <th>Teacher Name</th>
                        <th>Teacher ID</th>
                        <th>Session</th>
                        <th>credit</th>
                    </tr>
                </thead>
                <tbody>
                
				      <%
				      // Process the result set
				      while (rs.next()) {
				         // Retrieve data from the result set
				         String c_id = rs.getString("course_code");
				         String title = rs.getString("course_title");
				         String t_name = rs.getString("teacher_name");
				         String t_id = rs.getString("teacher_id");
				         String sess = rs.getString("session");
				         String credit = rs.getString("credit");
				         
				         %>
				         <tr>
				            <td><%= c_id %></td>
				            <td><%= title %></td>
				            <td><%= t_name %></td>
				            <td><%= t_id %></td>
				            <td><%= sess %></td>
				            <td><%= credit %></td>
							
				         </tr>
				         <%
				      }
					}catch (Exception e) {
				        System.out.println("Error: " + e.getMessage());
				        response.sendRedirect("Login.jsp");
				    }
				   %>
                   
                  
                    
                </tbody>
            </table>
            </form>
        </section>
    </main>
</body>

</html>

</div>