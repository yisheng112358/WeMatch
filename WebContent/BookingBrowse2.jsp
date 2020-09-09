<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


</head>
<body style="background-color:lightblue">

<div>
	<form action="TestbookingWeb" method="post" id="form1" name="form1">
	
	    <input type="hidden" name="date" value="${date}" >${date}<br />
	    	    
	    <br/><br/>
	    
	   <div id="checkboxGroup">
        
        <label class="timefont"><input name="time" type="hidden" class="checkbox" value="${time}"/>${time}點鐘</label>
<!--                       draggable="false" 不被拖動 -->
       </div>                            
	    <br/><br/>
	    <div id="loaction">
	    
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells1" id="Dumbbells1" value="Dumbbells1"><img id="image1"src="images/yet.jpg" onclick="myfunction()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells2" id="Dumbbells2" value="Dumbbells2"><img id="image2" src="images/yet.jpg" onclick="myfunction2()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells3" id="Dumbbells3" value="Dumbbells3"><img id="image3" src="images/yet.jpg" onclick="myfunction3()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells4" id="Dumbbells4" value="Dumbbells4"><img id="image4" src="images/yet.jpg" onclick="myfunction4()"></label></span>
		<br/><br/>
		
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells5" id="Dumbbells5" value="Dumbbells5"><img id="image5"src="images/yet.jpg" onclick="myfunction5()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells6" id="Dumbbells6" value="Dumbbells6"><img id="image6" src="images/yet.jpg" onclick="myfunction6()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells7" id="Dumbbells7" value="Dumbbells7"><img id="image7" src="images/yet.jpg" onclick="myfunction7()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells8" id="Dumbbells8" value="Dumbbells8"><img id="image8" src="images/yet.jpg" onclick="myfunction8()"></label></span>
		<br/><br/>
		
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells9" id="Dumbbells9" value="Dumbbells9"><img id="image9"src="images/yet.jpg" onclick="myfunction9()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells10" id="Dumbbells10" value="Dumbbells10"><img id="image10" src="images/yet.jpg" onclick="myfunction10()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells11" id="Dumbbells11" value="Dumbbells11"><img id="image11" src="images/yet.jpg" onclick="myfunction11()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells12" id="Dumbbells12" value="Dumbbells12"><img id="image12" src="images/yet.jpg" onclick="myfunction12()"></label></span>
		
		
		
		<input style="display:none" type="hidden" id="test1"  value="${D1}">

		<input style="display:none" type="hidden" id="test2"  value="${D2}">

		<input style="display:none" type="hidden" id="test3"  value="${D3}">                                                                             

        <input style="display:none" type="hidden" id="test4"  value="${D4}">
        
        <input style="display:none" type="hidden" id="test5"  value="${D5}">

		<input style="display:none" type="hidden" id="test6"  value="${D6}">

		<input style="display:none" type="hidden" id="test7"  value="${D7}">                                                                             

        <input style="display:none" type="hidden" id="test8"  value="${D8}">
         
        <input style="display:none" type="hidden" id="test9"  value="${D9}">

		<input style="display:none" type="hidden" id="test10"  value="${D10}">

		<input style="display:none" type="hidden" id="test11"  value="${D11}">                                                                             

        <input style="display:none" type="hidden" id="test12"  value="${D12}">

                                                                                      
                                                                                      
		
		</div>
		
		<br/><br/>
		<input type="submit" name="button" id="button" value="go" >  <input type="reset" name="reset" id="reset" value="back" >
		
    </form>
 </div>
    
 
    
    


<script src="js/bookingcheck.js"></script>
<script src="js/bookinglocationset.js"></script>

</body>
</html>