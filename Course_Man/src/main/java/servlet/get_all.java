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
    public get_all() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
			

			HttpSession session  = request.getSession();
			String uname = (String)session.getAttribute("username");
			String cata = (String)session.getAttribute("catagory");
			
			PrintWriter out = response.getWriter();
			
			out.println(cata + " " + uname);
			
			String sql = "SELECT * FROM registered WHERE ";
			
			System.out.println(uname +" "+cata);
			
			
			sql += "username=? AND catagory=?";
			
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setString(1, uname);
		    pstmt.setString(2, cata);
		    
		    ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				session.setAttribute("name", rs.getString("name"));
				session.setAttribute("id", rs.getString("ID"));
				
				if(cata.equalsIgnoreCase("admin")) response.sendRedirect("admindashboard.jsp");				   
				else if(cata.equalsIgnoreCase("student")) response.sendRedirect("studentdashboard.jsp");
				else if(cata.equalsIgnoreCase("teacher")) response.sendRedirect("teacherdashboard.jsp");
				
			} else {
				response.sendRedirect("signup.jsp");
			}
			
		} catch (SQLException | ClassNotFoundException ex) {
		    System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
		    response.sendRedirect("Login.jsp");
		}
				
	}

}
