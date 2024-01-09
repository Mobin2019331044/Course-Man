<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  


<div class="content" id="content2" style="display: none;">
<%@ page import="java.sql.*"%>
<%
String durl = "jdbc:mysql://localhost:3306/mobin";
String duser = "root";
String dpass = "";

try {
	// Load MySQL JDBC driver and establish connection
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(durl, duser, dpass);
	
	String us_id = (String)session.getAttribute("id");

	 // Prepare SQL statement for selecting courses that the user has not taken
	   	
	String sql = "SELECT * FROM course WHERE teacher_id = ? and course_code NOT IN (SELECT course_tcode FROM teaches WHERE t_uname= ?)";
	
    PreparedStatement pstmt = conn.prepareStatement(sql);
    // Set parameter for SQL statement
    
    pstmt.setString(1, (String)session.getAttribute("id"));
    pstmt.setString(2, (String)session.getAttribute("username"));
    
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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/style_dashboard.css">
		
	
    <link rel="stylesheet" href="table_style.css">
    
  <style>
    
    
    .but_on_t{
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
            <h1>Approve course</h1>
            
        </section>
        <section class="table__body">
          <form action="teacher_approve_action.jsp" method = "post">
            <table>
                <thead>
                    <tr>
                        <th>Course Code </th>
                        <th>Course Title</th>
                        <th>Teacher Name</th>
                        <th>Teacher ID</th>
                        <th>Session</th>
                        <th>credit</th>
                        <th>Take Course</th>
                    </tr>
                </thead>
                <tbody>
                 <!--  Placeholder for table body content -->
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
				         
				         System.out.println(c_id);
				         %>
				         <tr>
				            <td><%= c_id %></td>
				            <td><%= title %></td>
				            <td><%= t_name %></td>
				            <td><%= t_id %></td>
				            <td><%= sess %></td>
				            <td><%= credit %></td>
							<td> 
							<input type="checkbox" name="<%=c_id %>" style="margin-left:-70px;">
								
							</td>
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
            	<button class="but_on_t"> Approve </button> 
            </form>
        </section>
    </main>
</body>

</html>

</div>