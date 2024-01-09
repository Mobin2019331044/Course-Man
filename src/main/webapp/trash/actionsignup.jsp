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

	String uname = request.getParameter("username");
	String pass = request.getParameter("password");
	String cata = request.getParameter("userType");
	
	
	String Name = request.getParameter("name");
	String ID = request.getParameter("ID");
	String year = request.getParameter("year");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String dept = request.getParameter("dept");
	
	
	String sql = "insert into registered values(?,?,?,?,?,?,?,?,?,?)";
	
	
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
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
    
    int rowsInserted = pstmt.executeUpdate();
    
    if (rowsInserted > 0) {
    	response.sendRedirect("Login.jsp");
    }else {
		response.sendRedirect("studentdashboard.jsp");
	}
	
} catch (SQLException | ClassNotFoundException ex) {
    System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
    response.sendRedirect("teacherdashboard.jsp");
}
		%>