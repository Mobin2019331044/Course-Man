<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

//Start a JSP scriptlet to execute Java code on the server-side
//Invalidate the current session, removing all associated attributes
session.invalidate();
//Redirect the user to the "Login.jsp" page
response.sendRedirect("Login.jsp");


%>