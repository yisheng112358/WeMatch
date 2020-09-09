<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<style>
article, aside, figure, figcaption, footer, header, hgroup, menu, nav,
	section {
	display: block;
}

body {
	font: 62.5% "Trebuchet MS", sans-serif;
	margin: 50px;
}

.timefont { font-size:20px; }

</style>



</head>
<body>


<div style="text-align:center;background-color:lightblue;">
	<form action="CheckBooking" method="post" id="form1" name="form1" >
	
	    <input type="date" name="date" required value="2020-09-05" min="2020-09-05"max="2020-09-10" step="1"> <br />
	    
	    <br/><br/>

	   <div id="checkboxGroup" name="checkboxGroup">
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="9"/>9:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="11"/>11:00</label>
       </div>
	    <br/><br/>
		<input type="submit" name="button" id="button" value="go" >  <input type="reset" name="reset" id="reset" value="back" >
		
    </form>
</div>


<script src="js/bookingcheck-web1.js"></script>

</body>
</html>