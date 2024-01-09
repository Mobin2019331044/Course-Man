<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" java.sql.*" %>
    
<%-- <%@ page import=" java.io.IOException" %> --%>
<%@ page import=" java.util.Map" %>
<%-- <%@ page import=" javax.servlet.ServletException" %> --%>
<%-- <%@ page import=" javax.servlet.http.HttpServlet" %> --%>
<%-- <%@ page import=" javax.servlet.http.HttpServletRequest" %> --%>
<%-- <%@ page import=" javax.servlet.http.HttpServletResponse" %> --%>

	
    
    <%
    try{
    	// Get parameter map from request
    Map<String, String[]> parameterMap = request.getParameterMap();
    
    // Load MySQL JDBC driver and establish connection
    Class.forName("com.mysql.jdbc.Driver");
 	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobin", "root", "");
 	String sql;
    
    for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
        String paramName = entry.getKey();
        String[] paramValues = entry.getValue();
        
        // Do something with the parameter name and values
        for (String paramValue : paramValues) {
        	 try {
        		 String tem_id = (String)session.getAttribute("id");
        		 String tem_uname = (String)session.getAttribute("username");
     	    	
//         		 out.println(paramName);out.println(tem_uname);out.println(tem_id);
				
				// Prepare SQL statement for inserting data into database
        		 sql = "insert into teaches values(?,?,?)";
     			
     			
     	        PreparedStatement pstmt = conn.prepareStatement(sql);
     	        
     	        pstmt.setString(1,tem_uname);
     	        pstmt.setString(2,tem_id);
     	        pstmt.setString(3,paramName);
     	        
     	    // Execute SQL statement and redirect to appropriate page based on result
     	        
     	       int rowsInserted = pstmt.executeUpdate();
     			
     			if (rowsInserted>0) {
     				response.sendRedirect("teacherdashboard.jsp");
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
    	out.print(e);
    }
%>
    