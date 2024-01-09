package servlet;

import java.sql.*;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginaction
 */
/**
 * Servlet implementation for handling user login.
 */
@WebServlet("/loginaction")
public class loginaction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginaction() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * Handles GET requests.
     * This method is not used in the login process and can be left empty.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // No implementation needed for GET requests
    }

 // Handles POST requests sent to this servlet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// Set up the MySQL database connection parameters
    	String db_url = "jdbc:mysql://localhost:3306/mobin";
        String db_user = "root";
        String db_pass = "";

        try {
            // Establish a database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);

            // Extract login credentials from request parameters
            String uname = request.getParameter("username");
            String pass = request.getParameter("password");
            String cata = request.getParameter("userType");

            // Prepare the SQL statement
            String sql = "SELECT * FROM login WHERE uname=? AND password=? and catagory=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uname);
            pstmt.setString(2, pass);
            pstmt.setString(3, cata);

            // Execute the query and check the result
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                // User authentication successful
                HttpSession session = request.getSession();
                session.setAttribute("username", uname);
                session.setAttribute("catagory", cata);
                
                //getting all session values
                response.sendRedirect("get_session.jsp");

                // Redirect the user to the appropriate dashboard based on their category
                // if (cata.equalsIgnoreCase("admin")) {
                //     response.sendRedirect("admindashboard.jsp");
                // } else if (cata.equalsIgnoreCase("student")) {
                //     response.sendRedirect("studentdashboard.jsp");
                // } else if (cata.equalsIgnoreCase("teacher")) {
                //     response.sendRedirect("teacherdashboard.jsp");
                // }
            } else {
                // User authentication failed, redirect to an appropriate page
                response.sendRedirect("error.jsp");
            }

        } catch (SQLException | ClassNotFoundException ex) {
        	 // If an error occurs, output an error message to the console and redirect the user to the error page
            System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
            response.sendRedirect("error.jsp");
        }
    }
}

