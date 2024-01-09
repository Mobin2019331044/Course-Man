<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import=" java.sql.*"%>

<%-- <%@ page import=" java.io.IOException" %> --%>
<%@ page import=" java.util.Map"%>
<%-- <%@ page import=" javax.servlet.ServletException" %> --%>
<%-- <%@ page import=" javax.servlet.http.HttpServlet" %> --%>
<%-- <%@ page import=" javax.servlet.http.HttpServletRequest" %> --%>
<%-- <%@ page import=" javax.servlet.http.HttpServletResponse" %> --%>



<%
try {
    // Retrieve the parameter map from the request object
    Map<String, String[]> parameterMap = request.getParameterMap();
    
    // Load the MySQL JDBC driver and create a connection to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobin", "root", "");
    
    String sql;
    
    // Iterate through the parameter map and process each parameter
    for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
        String paramName = entry.getKey();
        String[] paramValues = entry.getValue();

        // Do something with the parameter name and values
        for (String paramValue : paramValues) {
            try {
                // Retrieve the "id" and "username" attributes from the session object
                String tem_id = (String) session.getAttribute("id");
                String tem_uname = (String) session.getAttribute("username");

                // Print out the parameter name, username, and id for debugging purposes
                System.out.print(paramName);
                System.out.println(tem_uname);
                System.out.println(tem_id);

                // Select the row with the matching ID from the "registered" table
                sql = "select * from registered where ID = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, paramName);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    // If a matching row is found, retrieve the username, password, and category from the "registered" table
                    String u_name = rs.getString("username");
                    String pass = rs.getString("password");
                    String cata = rs.getString("catagory");

                    // Insert the username, password, and category into the "login" table
                    sql = "insert into login values(?,?,?)";
                    PreparedStatement ptmt = conn.prepareStatement(sql);

                    ptmt.setString(1, u_name);
                    ptmt.setString(2, pass);
                    ptmt.setString(3, cata);

                    int rowsInserted = ptmt.executeUpdate();
                    if (rowsInserted > 0) {
                        response.sendRedirect("admindashboard.jsp"); // Redirect to the admin dashboard page if the insertion is successful
                    } else {
                        response.sendRedirect("error.jsp"); // Redirect to the error page if there is an issue inserting the data into the "login" table
                    }
                } else {
                    response.sendRedirect("error.jsp"); // Redirect to the error page if there is no row with the matching ID in the "registered" table
                }
            } catch (Exception ex) {
                System.out.println("An error occurred while inserting a new user: " + ex.getMessage()); // Print the error message to the console
                response.sendRedirect("error.jsp"); // Redirect to the error page if there is an issue inserting the data into the "login" table
            }
        }
    }
} catch (Exception e) {
    out.print(e); // Print the exception to the output stream for debugging purposes
}
%>
