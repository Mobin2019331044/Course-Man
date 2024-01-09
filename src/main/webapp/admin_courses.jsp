<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  


<div class="content" id="content5" style="display: none;">
<%@ page import="java.sql.*"%>
<%

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobin", "root", "");

	
	String sql = "SELECT * FROM course";
	
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    ResultSet rs = pstmt.executeQuery();
	
    %>	

<!DOCTYPE html>
<html lang="en" title="Coding design">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <link rel="stylesheet" href="table_style.css">
</head>

<body>
    <main class="table">
        <section class="table__header">
            <h1>Teachers</h1>
            
        </section>
        <section class="table__body">
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
        </section>
    </main>
</body>

</html>

</div>