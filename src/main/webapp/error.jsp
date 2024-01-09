<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<!-- Error handling page -->
<html lang="en" dir="ltr">
   <head>
    <!-- Set the character encoding and page title -->
      <meta charset="utf-8">
      <title>404 Error Page | CodingNepal</title>
      <!-- Link to the CSS stylesheet for the page -->
      <link rel="stylesheet" href="assets/css/error_style.css">
   </head>
   
   <body>
    <!-- Create a container for the error page content -->
      <div id="error-page">
         <div class="content">
         <!-- Display the error code -->
            <h2 class="header" data-text="404">
               404
            </h2>
              <!-- Display the error message -->
            <h4 data-text="Opps! Page not found">
               Opps! Page not found
            </h4>
            <!-- Display a message explaining the error -->
            <p>
               Sorry, the page you're looking for doesn't exist. If you think something is broken, report a problem.
            </p>
            <!-- Create buttons to return to the home page or report a problem -->
            <div class="btns">
            <!-- Button to return to the home page -->
               <!-- Button to return to the home page -->
               <a href="Login.jsp">return home</a>
               <!-- Button to report a problem (no link provided) -->
               
               <!-- Button to report a problem -->
               <a href="">report problem</a>
            </div>
         </div>
      </div>
   </body>
</html>
