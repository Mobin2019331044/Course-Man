package action;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class action_add_course
 */
// Sets the URL pattern for this servlet
@WebServlet("/action_add_course")
public class action_add_course extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
     // Constructor for the servlet
    public action_add_course() {
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
        // Database connection parameters
        String db_url = "jdbc:mysql://localhost:3306/mobin";
        String db_user = "root";
        String db_pass = "";

        try {
            // Load the MySQL JDBC driver and establish a connection to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);

            // Get the course information from the request parameters
            String c_code = request.getParameter("course_code");
            String c_title = request.getParameter("course_title");
            String teacher = request.getParameter("teacher");
            String t_id = request.getParameter("teacher_id");
            String sess = request.getParameter("session");
            String credit = request.getParameter("credit");
            
            // Define the SQL query to insert the course information into the "course" table
            String sql = "insert into course values(?,?,?,?,?,?)";
            
            // Create a PreparedStatement object and set its parameters
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, c_code);
            pstmt.setString(2, c_title);
            pstmt.setString(3, teacher);
            pstmt.setString(4, t_id);
            pstmt.setString(5, sess);
            pstmt.setString(6, credit);
            
            // Execute the SQL query and get the number of rows inserted
            int rowsInserted = pstmt.executeUpdate();
            
            // If the insertion was successful, redirect to the admin dashboard page
            if (rowsInserted > 0) {
                response.sendRedirect("admindashboard.jsp");
            } else {
                // If the insertion failed, redirect to the error page
                response.sendRedirect("error.jsp");
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            // If an error occurred while inserting the course information, redirect to the teacher dashboard page
            System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
            response.sendRedirect("teacherdashboard.jsp");
        }
    }
}
