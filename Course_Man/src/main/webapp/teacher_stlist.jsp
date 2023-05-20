<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- <div id="student-list" > -->
<%@ page import="java.sql.*"%>
<%
String durl = "jdbc:mysql://localhost:3306/mobin";
String duser = "root";
String dpass = "";

String code = request.getParameter("course_code");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(durl, duser, dpass);

	
	String sql = "select * from teaches,takes,registered where course_code = course_ccode and course_code=? and s_uname=username and t_uname = ? and catagory = 'student'";
	
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,code);
    pstmt.setString(2,(String)session.getAttribute("username"));
    
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

<style>

body {
	background: url(images/html_table.jpg) center/cover;
}

</style>

<body>
    <main class="table">
        <section class="table__header">
            <h1><%= code %></h1>
            
        </section>
        <section class="table__body">
            <table>
                <thead>
                    <tr>
                        <th>Reg. No. </th>
                        <th>Name </th>
                        <th>Session</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                
				      <%
				      // Process the result set
				      while (rs.next()) {
				         // Retrieve data from the result set
				         String id = rs.getString("ID");
				         String name = rs.getString("name");
				         String ses = rs.getString("year");
				         String gender = rs.getString("gender");
				         String email = rs.getString("email");
				         String phone = rs.getString("phone");
				         // ...
				         
				         // Generate table row
				         %>
				         <tr>
				            <td><%= id %></td>
				            <td><%= name %></td>
				            <td><%= ses %></td>
				            <td><%= gender %></td>
				            <td><%= email %></td>
				            <td><%= phone %></td>
				            <!-- Add more table cells for additional columns -->
				         </tr>
				         <%
				      }
					}catch (Exception e) {
				        System.out.println("Error: " + e.getMessage());
				        response.sendRedirect("popup1.jsp");
				    }
				   %>
                   
                    
                </tbody>
            </table>
        </section>
    </main>
</body>

</html>
