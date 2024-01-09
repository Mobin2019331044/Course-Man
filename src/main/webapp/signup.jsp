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
    	/* Custom CSS for card background and body */
		.card-4{
			background-image:
		url("https://i.pinimg.com/736x/5d/73/ea/5d73eaabb25e3805de1f8cdea7df4a42--tumblr-backgrounds-iphone-phone-wallpapers-iphone-wallaper-tumblr.jpg");
			
		}
		.card-body{
			color: #FFFFFF;
			background-size: cover;
			background-repeat: no-repeat;
			background: #5961f9ad;
			overflow: hidden;	
		}
		
		/* Custom CSS for page wrapper background */
		.page-wrapper{
			background-image: linear-gradient(135deg, #8304e5 10%, #1904E5 100%);
			color: #FFFFFF;
		}
	
    
    </style>
</head>

<body>
<!-- Page wrapper -->
    <div class="page-wrapper p-t-10 p-b-10 font-poppins">
        <div class="wrapper wrapper--w780">
        <!-- Card container -->
            <div class="card card-4">
                <div class="card-body">
                <!-- Form title -->
                    <h2 class="title" style="color:white;">Sign Up Form</h2>
                    <!-- Sign up form -->
                    <form action="signupservlet" method="POST">
                     <!-- Name and ID fields -->
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label" style="color:white;">Name</label>
                                    <input class="input--style-4" type="text" name="name" style="background: #c0e2ff;border: 2px solid #1200e2;" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label" style="color:white;">Student ID/Teacher ID</label>
                                    <input class="input--style-4" type="text" name="ID" style="background: #c0e2ff;border: 2px solid #1200e2;" required>
                                    <p id="message" class="error-message"></p>
                                </div>
                            </div>
                        </div>
                         <!-- Session and Gender fields -->
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label" style="color:white;">Session/Joining year</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="year" style="background: #c0e2ff;border: 2px solid #1200e2;" required>
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label" style="color:white;">Gender</label>
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
                        
                         <!-- Department fields -->
                         
                        <div class="row row-space">
                            <div >
                                <div class="input-group">
                                    <label class="label"style="color:white;">Department</label>
                                    <select id="dept" name="dept" class="input--style-4 select" style="background: #c0e2ff;border: 2px solid #1200e2;">
										<option value="CSE">CSE</option>
										<option value="SWE">SWE</option>
										<option value="EEE">EEE</option>
									</select>
					                                    
                                </div>
                            </div>
                          
                        </div>
                        
                         <!-- Email and Password fields -->
                         
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label"style="color:white;">Email</label>
                                    <input class="input--style-4" type="email" name="email" style="background: #c0e2ff;border: 2px solid #1200e2;" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label" style="color:white;">Phone Number</label>
                                    <input class="input--style-4" type="text" name="phone" style="background: #c0e2ff;border: 2px solid #1200e2;" required>
                                </div>
                            </div>
                        </div>
                        
                         <div class="row row-space">
                            <div >
                                <div class="input-group">
                                    <label class="label" style="color:white;">User Name</label>
                                    <input class="input--style-4" type="text" name="username" style="background: #c0e2ff;border: 2px solid #1200e2;" required>
                                </div>
                            </div>
                          
                        </div>
                        
                        <!-- Confirm Password field -->
                        
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label" style="color:white;">Password</label>
                                    <input class="input--style-4" type="password" name="password" style="background: #c0e2ff;border: 2px solid #1200e2;" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label" style="color:white;">confirm Password</label>
                                    <input class="input--style-4" type="password" name="con_pass" style="background: #c0e2ff;border: 2px solid #1200e2;" required>
                                </div>
                            </div>
                        </div>

						<div class="radio">
						
						<label class="label" style="color:white;">Sign up as:</label>
		
						<input class="radio__input" type="radio" value="admin" name="userType" id ="rad1" required>
						<label class="radio__label" for="rad1"> Admin </label>
						
						<input class="radio__input" type="radio" value="student" name="userType" id ="rad2" required>
						<label class="radio__label" for="rad2"> Student </label>
						
						<input class="radio__input" type="radio" value="teacher" name="userType" id ="rad3" required>
						<label class="radio__label" for="rad3"> Teacher </label>
						
						</div>
                        
                        <!-- Submit button -->
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