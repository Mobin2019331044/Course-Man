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

	String uname = (String)session.getAttribute("username");
	String cata = (String)session.getAttribute("catagory");
	
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
		%>