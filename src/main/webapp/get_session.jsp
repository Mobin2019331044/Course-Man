<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>


<%
// Database Configuration
String db_url = "jdbc:mysql://localhost:3306/mobin"; // Database URL
String db_user = "root"; // Database username
String db_pass = ""; // Database password

try {
    // Register JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");

    // Establish Connection to the Database
    Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);

    // Get username and category from the session
    String uname = (String) session.getAttribute("username");
    String cata = (String) session.getAttribute("catagory");

    // Prepare SQL Query
    String sql = "SELECT * FROM registered WHERE ";

    System.out.println(uname + " " + cata);

    sql += "username=? AND catagory=?";

    // Create a PreparedStatement with the SQL query
    PreparedStatement pstmt = conn.prepareStatement(sql);

    // Set parameter values for the query
    pstmt.setString(1, uname);
    pstmt.setString(2, cata);

    // Execute the query and get the result set
    ResultSet rs = pstmt.executeQuery();

    // Check if the result set has any data
    if (rs.next()) {
        // Set session attributes for name and ID
        session.setAttribute("name", rs.getString("name"));
        session.setAttribute("id", rs.getString("ID"));

        // Redirect based on the category
        if (cata.equalsIgnoreCase("admin"))
            response.sendRedirect("admindashboard.jsp");
        else if (cata.equalsIgnoreCase("student"))
            response.sendRedirect("studentdashboard.jsp");
        else if (cata.equalsIgnoreCase("teacher"))
            response.sendRedirect("teacherdashboard.jsp");
    } else {
        // If no data found in the result set, redirect to the signup page
        response.sendRedirect("signup.jsp");
    }

} catch (SQLException | ClassNotFoundException ex) {
    // Handle any exceptions that occur during database connection or query execution
    System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
    response.sendRedirect("Login.jsp");
}
%>
