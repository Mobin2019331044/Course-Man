package servlet;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class get_session
 */
@WebServlet("/get_all")
public class get_all extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
     // Constructor for the servlet
    public get_all() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    // Handles GET requests sent to this servlet
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    // Handles POST requests sent to this servlet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set up the MySQL database connection parameters
        String db_url = "jdbc:mysql://localhost:3306/mobin";
        String db_user = "root";
        String db_pass = "";

        try {
            // Load the MySQL JDBC driver and establish a connection to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);
            
            // Get the user's username and category from the session
            HttpSession session  = request.getSession();
            String uname = (String)session.getAttribute("username");
            String cata = (String)session.getAttribute("catagory");
            
            // Initialize a PrintWriter to output text to the response
            PrintWriter out = response.getWriter();
            
            // Output the user's username and category for debugging purposes
            out.println(cata + " " + uname);
            
            // Build the SQL SELECT query to retrieve the user's information from the database
            String sql = "SELECT * FROM registered WHERE ";
            sql += "username=? AND catagory=?";
            
            // Create a PreparedStatement object and set its parameters
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uname);
            pstmt.setString(2, cata);
            
            // Execute the SELECT query and retrieve the results
            ResultSet rs = pstmt.executeQuery();
            
            // If the user is found in the database, set their name and ID in the session and redirect them to their dashboard page
            if (rs.next()) {
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("id", rs.getString("ID"));
                
                if(cata.equalsIgnoreCase("admin")) response.sendRedirect("admindashboard.jsp");                  
                else if(cata.equalsIgnoreCase("student")) response.sendRedirect("studentdashboard.jsp");
                else if(cata.equalsIgnoreCase("teacher")) response.sendRedirect("teacherdashboard.jsp");
                
            // If the user is not found in the database, redirect them to the signup page
            } else {
                response.sendRedirect("signup.jsp");
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            // If an error occurs, output an error message to the console and redirect the user to the login page
            System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
            response.sendRedirect("Login.jsp");
        }
                
    }

}