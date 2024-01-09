package servlet;

import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signupservlet")
public class signupservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public signupservlet() {
        super();
    }

    // Handles HTTP GET requests sent to the signupservlet servlet
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath()); // Write a string to the response output stream
    }

    // Handles HTTP POST requests sent to the signupservlet servlet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String db_url = "jdbc:mysql://localhost:3306/mobin"; // URL for the database
        String db_user = "root"; // Database username
        String db_pass = ""; // Database password

        try {
            Class.forName("com.mysql.jdbc.Driver"); // Load MySQL JDBC driver
            Connection conn = DriverManager.getConnection(db_url, db_user, db_pass); // Create a database connection object

            String uname = request.getParameter("username"); // Retrieve username from request parameter
            String pass = request.getParameter("password"); // Retrieve password from request parameter
            String cata = request.getParameter("userType"); // Retrieve user category from request parameter

            String Name = request.getParameter("name"); // Retrieve name from request parameter
            String ID = request.getParameter("ID"); // Retrieve ID from request parameter
            String year = request.getParameter("year"); // Retrieve year from request parameter
            String gender = request.getParameter("gender"); // Retrieve gender from request parameter
            String email = request.getParameter("email"); // Retrieve email from request parameter
            String phone = request.getParameter("phone"); // Retrieve phone number from request parameter
            String dept = request.getParameter("dept"); // Retrieve department from request parameter
            
            

            String sql,sql1;
            
            sql = "select * from registered where ID=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            
            pstm.setString(1, ID);
            
            ResultSet rs = pstm.executeQuery();
            
            sql1 = "select * from registered where username=?";
            PreparedStatement pstm1 = conn.prepareStatement(sql1);
            
            pstm1.setString(1, uname);
            
            ResultSet rs1 = pstm1.executeQuery();
            if(rs.next() || rs1.next())
            {
            	response.sendRedirect("error_signup.jsp");
            }
            else {
            
            sql = "insert into registered values(?,?,?,?,?,?,?,?,?,?)"; // SQL query to insert new user data into the registered table

            PreparedStatement pstmt = conn.prepareStatement(sql); // Create a prepared statement for the query

            // Set the parameters for the prepared statement to the values retrieved from the request parameters
            pstmt.setString(1, Name);
            pstmt.setString(2, ID);
            pstmt.setString(3, year);
            pstmt.setString(4, dept);
            pstmt.setString(5, gender);
            pstmt.setString(6, email);
            pstmt.setString(7, phone);
            pstmt.setString(8, uname);
            pstmt.setString(9, pass);
            pstmt.setString(10, cata);

            int rowsInserted = pstmt.executeUpdate(); // Execute the queryand get the number of rows that were affected

            if (rowsInserted > 0) {
                response.sendRedirect("Login.jsp"); // Redirect to the login page if the user was successfully added to the database
            } else {
                response.sendRedirect("error.jsp"); // Redirect to the error page if there was an issue adding the user to the database
            }
            }

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("An error occurred while inserting a new user: " + ex.getMessage()); // Print the error message to the console
            response.sendRedirect("error.jsp"); // Redirect to the error page if there was an issue adding the user to the database
        }
    }

}