<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Sing Up Form</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    <link href="assets/css/signup_style.css" rel="stylesheet">
    
    <style >
    
		
    
    </style>
</head>

<body>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Sign Up Form</h2>
                    <form action="actionsignup.jsp" method="POST">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Name</label>
                                    <input class="input--style-4" type="text" name="name">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Student ID/Teacher ID</label>
                                    <input class="input--style-4" type="text" name="ID">
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Session/Joining year</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="year">
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Male
                                            <input type="radio" checked="checked" name="gender" value="male">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Female
                                            <input type="radio" name="gender" value="female">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div >
                                <div class="input-group">
                                    <label class="label">Department</label>
                                    <select id="dept" name="dept" class="input--style-4 select">
										<option value="CSE">CSE</option>
										<option value="SWE">SWE</option>
										<option value="EEE">EEE</option>
									</select>
					                                    
                                </div>
                            </div>
                          
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" name="email">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Phone Number</label>
                                    <input class="input--style-4" type="text" name="phone">
                                </div>
                            </div>
                        </div>
                        
                         <div class="row row-space">
                            <div >
                                <div class="input-group">
                                    <label class="label">User Name</label>
                                    <input class="input--style-4" type="text" name="username">
                                </div>
                            </div>
                          
                        </div>
                        
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <input class="input--style-4" type="password" name="password">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">confirm Password</label>
                                    <input class="input--style-4" type="password" name="con_pass">
                                </div>
                            </div>
                        </div>
                        
<!--                         <div class="input-group"> -->
<!--                             <label class="label">Subject</label> -->
<!--                             <div class="rs-select2 js-select-simple select--no-search"> -->
<!--                                 <select name="subject"> -->
<!--                                     <option disabled="disabled" selected="selected">Choose option</option> -->
<!--                                     <option>Subject 1</option> -->
<!--                                     <option>Subject 2</option> -->
<!--                                     <option>Subject 3</option> -->
<!--                                 </select> -->
<!--                                 <div class="select-dropdown"></div> -->
<!--                             </div> -->
<!--                         </div> -->

						<div class="radio">
						
						<label class="label">Sign up as:</label>
		
						<input class="radio__input" type="radio" value="admin" name="userType" id ="rad1">
						<label class="radio__label" for="rad1"> Admin </label>
						
						<input class="radio__input" type="radio" value="student" name="userType" id ="rad2">
						<label class="radio__label" for="rad2"> Student </label>
						
						<input class="radio__input" type="radio" value="teacher" name="userType" id ="rad3">
						<label class="radio__label" for="rad3"> Teacher </label>
						
						</div>
                        
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit" >Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->