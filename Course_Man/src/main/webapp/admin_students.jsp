<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  


<div class="content" id="content3" style="display: none;">
<%@ page import="java.sql.*"%>
<%
String durl = "jdbc:mysql://localhost:3306/mobin";
String duser = "root";
String dpass = "";

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(durl, duser, dpass);

	
	String sql = "SELECT * FROM registered where catagory = 'student' ";
	
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
            <h1>Students</h1>
            
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
				        response.sendRedirect("Login.jsp");
				    }
				   %>
                   
<!--                     <tr> -->
<!--                         <td> 6</td> -->
<!--                         <td> Alex Gonley </td> -->
<!--                         <td> London </td> -->
<!--                         <td> 23 Apr, 2023 </td> -->
<!--                         <td> -->
<!--                             <p class="status cancelled">Cancelled</p> -->
<!--                         </td> -->
<!--                         <td> <strong>$399.99</strong> </td> -->
<!--                     </tr> -->
                    
                    
                </tbody>
            </table>
        </section>
    </main>
</body>

</html>

</div>