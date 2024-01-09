package action;

import java.util.*;
import java.sql.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class student_reg
 */
@WebServlet("/student_reg")
public class student_reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public student_reg() {
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
		 try{
			    Map<String, String[]> parameterMap = request.getParameterMap();
			    Class.forName("com.mysql.jdbc.Driver");
			 	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobin", "root", "");
			 	String sql;
			    
			    for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
			        String paramName = entry.getKey();
			        String[] paramValues = entry.getValue();
			        
			        
			        for (String paramValue : paramValues) {
			        	 try {
			        		 HttpSession session=request.getSession();
			        		 String tem_id = (String)session.getAttribute("id");
			        		 String tem_uname = (String)session.getAttribute("username");
			     	    	
//			         		 out.println(paramName);out.println(tem_uname);out.println(tem_id);

			        		 sql = "insert into takes values(?,?,?)";
			     			
			     			
			     	        PreparedStatement pstmt = conn.prepareStatement(sql);
			     	        
			     	        pstmt.setString(1,tem_uname);
			     	        pstmt.setString(2,tem_id);
			     	        pstmt.setString(3,paramName);
			     	        
			     	        
			     	       int rowsInserted = pstmt.executeUpdate();
			     			
			     			if (rowsInserted>0) {
			     				response.sendRedirect("studentdashboard.jsp");
			     			} else {
			     				response.sendRedirect("error.jsp");
			     			}
			     			
			     	    } catch (Exception ex) {
			     	        System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
			     	        response.sendRedirect("error.jsp");
			     	    }
			        }
			    }
			    }
			    catch(Exception e)
			    {
			    	System.out.print(e);
			    }
	}

}
