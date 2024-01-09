package servlet;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public loginservlet() {
        super();
    }

    // Handles HTTP GET requests sent to the loginservlet servlet
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath()); // Write a string to the response output stream
    }

    // Handles HTTP POST requests sent to the loginservlet servlet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out= response.getWriter(); // Create a PrintWriter object to write the response output stream
        out.println("works works"); // Write a string to the response output stream

        try {
            String uname = request.getParameter("username"); // Retrieve username from request parameter
            String passw = request.getParameter("password"); // Retrieve password from request parameter
            String cata = request.getParameter("userType"); // Retrieve user category from request parameter

            Class.forName("com.mysql.jdbc.Driver"); // Load MySQL JDBCApologies for the incomplete response. Here's the remainder of the code documentation:

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobin","root",""); // Create a database connection object
            Statement st = con.createStatement(); // Create a statement object for executing SQL queries

            String sql = "select * from login where username=? and password=?"; // SQL query to retrieve user data
            PreparedStatement pstmt = con.prepareStatement(sql); // Create a prepared statement for the query
            pstmt.setString(1, uname); // Set parameter for username
            pstmt.setString(2, passw); // Set parameter for password
            ResultSet rs = pstmt.executeQuery(); // Execute the query and retrieve the result set

            System.out.println(uname); // Print the username to the console

            if (rs.next()) { // If the user is authenticated
                System.out.println(passw); // Print the password to the console
                System.out.println(cata); // Print the user category to the console

                // Redirect the user to the appropriate dashboard page based on their category
                if(cata.equalsIgnoreCase("admin")) response.sendRedirect("admindashboard.jsp");
                else if(cata.equalsIgnoreCase("student")) response.sendRedirect("studentdashboard.jsp");
                else if(cata.equalsIgnoreCase("teacher")) response.sendRedirect("teacherdashboard.jsp");
            }
                // If the user is not authenticated, redirect them to the admin login page
            else
                response.sendRedirect("adminLogin.jsp");
                   }
            catch(Exception ex) {
            response.sendRedirect("adminLogin.jsp"); // If an exception occurs during database connection or query execution, catch the exception and redirect the user to the admin login page
        }
    }
}