<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  





<!DOCTYPE html>
<html lang="en" title="Coding design">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <link rel="stylesheet" href="table_style.css">
    
    <style>
    
    input {
  outline: none;
  margin: 0;
  border: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  width: 100%;
  font-size: 14px;
  font-family: inherit;
}

.input--style-4 {
  line-height: 50px;
  background: #fafafa;
  -webkit-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  -moz-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  padding: 0 20px;
  font-size: 16px;
  color: #666;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.input--style-4::-webkit-input-placeholder {
  /* WebKit, Blink, Edge */
  color: #666;
}

.input--style-4:-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  color: #666;
  opacity: 1;
}

.input--style-4::-moz-placeholder {
  /* Mozilla Firefox 19+ */
  color: #666;
  opacity: 1;
}

.input--style-4:-ms-input-placeholder {
  /* Internet Explorer 10-11 */
  color: #666;
}

.input--style-4:-ms-input-placeholder {
  /* Microsoft Edge */
  color: #666;
}

.but_on{
	float: center;
	color: #fff;
	font-size: 16px;
	padding: 12px 35px;
	border-radius: 50px;
	display: inline-block;
	border: 0;
	outline: 0;
	box-shadow: 0px 4px 20px 0px #49c628a6;
	background-image: linear-gradient(135deg, #70F570 10%, #49C628 100%);
}
    
    </style>
</head>

<body>
    <main class="table">
        <section class="table__header">
            <h1>Add New Course</h1>
            <div class="input-group">
                <input type="search" placeholder="Search Data...">
                <img src="images/search.png" alt="">
            </div>
            <div class="export__file">
                <label for="export-file" class="export__file-btn" title="Export File"></label>
                <input type="checkbox" id="export-file">
                <div class="export__file-options">
                    <label>Export As &nbsp; &#10140;</label>
                    <label for="export-file" id="toPDF">PDF <img src="images/pdf.png" alt=""></label>
                    <label for="export-file" id="toJSON">JSON <img src="images/json.png" alt=""></label>
                    <label for="export-file" id="toCSV">CSV <img src="images/csv.png" alt=""></label>
                    <label for="export-file" id="toEXCEL">EXCEL <img src="images/excel.png" alt=""></label>
                </div>
            </div>
        </section>
        <section class="table__body">
        	<form action="" method="post">
            	<table>
            		
            		
            		<tr>
			        	<td></td>
			          <td><label for="course_code" ><strong>Course Code</strong></label></td>
			          <td><input class="input--style-4" type="text" id="course_code" name="course_code" placeholder="Enter Course Code" required></td>
        			</tr>
        			
        			<tr>
			        	<td></td>
			          <td><label for="course_title"><strong>course_title</strong></label></td>
			          <td><input class="input--style-4" type="text" id="course_title" name="course_title" placeholder="Enter course title" required></td>
        			</tr>
        			
        			<tr>
			        	<td></td>
			          <td><label for="teacher"><strong>Teacher Name</strong></label></td>
			          <td><input class="input--style-4" type="text" id="teacher" name="teacher" placeholder="Enter Teacher Name" required></td>
        			</tr>
        			
        			<tr>
			        	<td></td>
			          <td><label for="teacher_id"><strong>Teacher ID</strong></label></td>
			          <td><input class="input--style-4" type="text" id="teacher_id" name="teacher_id" placeholder="Enter Teacher ID" required></td>
        			</tr>
        			
        			<tr>
			        	<td></td>
			          <td><label for="session"><strong>Session</strong></label></td>
			          <td><input class="input--style-4" type="text" id="session" name="session" placeholder="Enter Session" required></td>
        			</tr>
        			
        			<tr>
			        	<td></td>
			          <td><label for="credit"><strong>Credit</strong></label></td>
			          <td><input class="input--style-4" type="number" id="credit" name="credit" placeholder="Enter Credit" required></td>
        			</tr>
        			
        			<tr><td></td></tr>
        			<tr><td></td></tr>
        			<tr><td></td></tr>
        			
        			<tr>
        				<td></td><td></td>
        				<td> <button class="but_on">Create Course</button> </td>
        			</tr>
        
            	</table>
            </form>
        </section>
    </main>
</body>

</html>
