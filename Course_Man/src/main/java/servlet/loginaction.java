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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//PrintWriter out = response.getWriter();
//		
//		out.println("workds");
//		String uname = request.getParameter("username");
//		out.println(uname);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String db_url = "jdbc:mysql://localhost:3306/mobin";
		String db_user = "root";
		String db_pass = "";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);

			String uname = request.getParameter("username");
			String pass = request.getParameter("password");
			String cata = request.getParameter("userType");
			
			System.out.println(cata);
			
			String sql = "SELECT * FROM registered WHERE ";
			
			
			sql += "username=? AND password=? and catagory=?";
			
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setString(1, uname);
		    pstmt.setString(2, pass);
		    pstmt.setString(3, cata);
		    
		    ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				HttpSession session = request.getSession();
				
				session.setAttribute("username", uname);
				session.setAttribute("catagory", cata);
				
		 		response.sendRedirect("get_session.jsp");
				
//				if(cata.equalsIgnoreCase("admin")) response.sendRedirect("admindashboard.jsp");				   
//				else if(cata.equalsIgnoreCase("student")) response.sendRedirect("studentdashboard.jsp");
//				else if(cata.equalsIgnoreCase("teacher")) response.sendRedirect("teacherdashboard.jsp");
				
			} else {
				response.sendRedirect("teacherdashboard.jsp");
			}
			
		} catch (SQLException | ClassNotFoundException ex) {
		    System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
		    response.sendRedirect("error.jsp");
		}
			
	}

}
