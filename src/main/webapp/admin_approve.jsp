<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  


<div class="content" id="content4" style="display: none;">
<%@ page import="java.sql.*"%>
<%

try {
    // Load the MySQL JDBC driver and create a connection to the database
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobin", "root", "");

	// Select all users from the "registered" table that are not in the "login" table
	String sql = "SELECT * FROM registered WHERE username NOT IN (SELECT uname FROM login)";
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
    
    <!-- Include CSS stylesheets -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/style_dashboard.css">
    <link rel="stylesheet" href="table_style.css">
    
    <!-- Define custom CSS styles -->
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
        }
    </style>
</head>

<body>
    <main class="table">
        <section class="table__header">
            <h1>Approve User</h1>
       <!-- Display the table header -->
        </section>
        <section class="table__body">
            <form action="admin_approve_action.jsp" method = "post">
                <table>
                    <thead>
                        <tr>
                            <th> ID </th>
                            <th>Name</th>
                            <th>Year</th>
                            <th>Dept</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>User Type</th>
                            <th>Approve</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% // Process the result set
                    while (rs.next()) {
                        // Retrieve data from the result set
                        String id = rs.getString("ID");
                        String name = rs.getString("name");
                        String year = rs.getString("year");
                        String dept = rs.getString("dept");
                        String gender = rs.getString("gender");
                        String email = rs.getString("email");
                        String phn = rs.getString("phone");
                        String type = rs.getString("catagory");
                        
                        System.out.println(id);
                        %>
                        <tr>
                            <!-- Display the user's data in the table -->
                            <td><%= id %></td>
                            <td><%= name %></td>
                            <td><%= year %></td>
                            <td><%= dept %></td>
                            <td><%= gender%></td>
                            <td><%= email %></td>
                            <td><%= phn %></td>
                            <td><%= type %></td>
                            <td> 
                                <input type="checkbox" name="<%=id %>" style="margin-left:-20px;">
                            </td>
                        </tr>
                        <%
                    }
                    } catch (Exception e) {
                        // If there's an error, redirect to the login page
                        System.out.println("Error: " + e.getMessage());
                        response.sendRedirect("Login.jsp");
                    }
                   %>
                </tbody>
            </table>
            <!-- Display the "Approve" button -->
            <button class="but_on_t"> Approve </button> 
            </form>
        </section>
    </main>
</body>

</html>

</div>