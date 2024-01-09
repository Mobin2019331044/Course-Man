<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>


<%
String db_url = "jdbc:mysql://localhost:3306/mobin";
String db_user = "root";
String db_pass = "";

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);

	String c_code = request.getParameter("course_code");
	String c_title = request.getParameter("course_title");
	String teacher = request.getParameter("teacher");
	String t_id = request.getParameter("teacher_id");
	String sess = request.getParameter("session");
	String credit = request.getParameter("credit");
	
	
	String sql = "insert into course values(?,?,?,?,?,?)";
	
	
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, c_code);
    pstmt.setString(2, c_title);
    pstmt.setString(3, teacher);
    pstmt.setString(4, t_id);
    pstmt.setString(5, sess);
    pstmt.setString(6, credit);
    
    int rowsInserted = pstmt.executeUpdate();
    
    if (rowsInserted > 0) {
    	response.sendRedirect("admindashboard.jsp");
    }else {
		response.sendRedirect("error.jsp");
	}
	
} catch (SQLException | ClassNotFoundException ex) {
    System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
    response.sendRedirect("teacherdashboard.jsp");
}
		%>