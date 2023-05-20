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

/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginservlet() {
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
		
		PrintWriter out= response.getWriter();
		out.println("works works");
		
		try 
		   {
			String uname = request.getParameter("username");
			String passw = request.getParameter("password");
			String cata = request.getParameter("userType");
			// System.out.println("Alhamdulilah");
			   Class.forName("com.mysql.jdbc.Driver");
			  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobin","root","");  
			  //Connection con = ConnectionProvider.getCon(); 
			  Statement st = con.createStatement();
			   //ResultSet rs = st.executeQuery("select *from loginTable where userName=? and passWord=?");
			   String sql = "select * from login where username=? and password=?";
			   PreparedStatement pstmt = con.prepareStatement(sql);
			   
			   pstmt.setString(1, uname);
			   pstmt.setString(2, passw);
			   
			   ResultSet rs = pstmt.executeQuery();
			   
			   System.out.println(uname);
			   
			   if(rs.next())
			   {
				   
				   System.out.println(passw);
				   System.out.println(cata);
				   if(cata.equalsIgnoreCase("admin")) response.sendRedirect("admindashboard.jsp");
				   else if(cata.equalsIgnoreCase("student")) response.sendRedirect("studentdashboard.jsp");
				   else if(cata.equalsIgnoreCase("teacher")) response.sendRedirect("teacherdashboard.jsp");
			   }
			   else response.sendRedirect("adminLogin.jsp");
		   		}catch(Exception ex) {
		   			response.sendRedirect("adminLogin.jsp");
		   		}
//		
	}

}
