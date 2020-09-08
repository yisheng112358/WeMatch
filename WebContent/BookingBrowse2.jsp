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
	
	<script>
	function myfunction() {
		var x = document.getElementById("image1").getAttribute("src");

		if (x == "images/star.gif") {
			document.getElementById("image1").src = "images/chngstar.gif";
		} else {
			document.getElementById("image1").src = "images/star.gif";
		}
	}

	function myfunction2() {
		var x = document.getElementById("image2").getAttribute("src");

		if (x == "images/star.gif") {
			document.getElementById("image2").src = "images/chngstar.gif";
		} else {
			document.getElementById("image2").src = "images/star.gif";
		}
	}

	function myfunction3() {
		var x = document.getElementById("image3").getAttribute("src");

		if (x == "images/star.gif") {
			document.getElementById("image3").src = "images/chngstar.gif";
		} else {
			document.getElementById("image3").src = "images/star.gif";
		}
	}

	function myfunction4() {
		var x = document.getElementById("image4").getAttribute("src");

		if (x == "images/star.gif") {
			document.getElementById("image4").src = "images/chngstar.gif";
		} else {
			document.getElementById("image4").src = "images/star.gif";
		}
	}


	
		
</script>

<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>


</head>
<body>

<%-- ${D1} --%>
<%-- ${D2} --%>
<%-- ${D3}          測試丟過來的值 --%>
<%-- ${D4} --%>

<br><br>



<%-- <c:forEach var="result2" items="${D1}"> --%>

<%--     <c:out value="${result2}"/><br/>           測試跑出來的東西 --%>
    
<%-- </c:forEach> --%>

<%-- <c:forEach var="result2" items="${D2}"> --%>

<%--     <c:out value="${result2}"/><br/> --%>
    
<%-- </c:forEach> --%>


	<form action="TestbookingWeb" method="post" id="form1" name="form1">
	
	    <input type="hidden" name="date" value="${date}" >${date}<br />
	    	    
	    <br/><br/>
	    
	   <div id="checkboxGroup">
        
        <label class="timefont"><input name="time" type="hidden" class="checkbox" value="${time}"/>${time}點鐘</label>
<!--                       draggable="false" 不被拖動 -->
       </div>                            
	    <br/><br/>
	    <div id="loaction">
	    
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells1" id="Dumbbells1" value="Dumbbells1"><img id="image1"src="images/star.gif" onclick="myfunction()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells2" id="Dumbbells2" value="Dumbbells2"><img id="image2" src="images/star.gif" onclick="myfunction2()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells3" id="Dumbbells3" value="Dumbbells3"><img id="image3" src="images/star.gif" onclick="myfunction3()"></label></span>
		<span><label> <input style="display:none" type="checkbox" name="Dumbbells4" id="Dumbbells4" value="Dumbbells4"><img id="image4" src="images/star.gif" onclick="myfunction4()"></label></span>
		
		<input style="display:none" type="hidden" id="test1"  value="${D1}">
		X======${D1}
		<input style="display:none" type="hidden" id="test2"  value="${D2}">
        X======${D2}	
		<input style="display:none" type="hidden" id="test3"  value="${D3}">                                                                             
        X======${D3}                                                                           
        <input style="display:none" type="hidden" id="test4"  value="${D4}"> 
        X======${D4}                                                                   
                                                                                      
                                                                                      
		
		</div>
		
		<br/><br/>
		<input type="submit" name="button" id="button" value="go" >  <input type="reset" name="reset" id="reset" value="back" >
		
    </form>
    
    
    
    
    
<script>


$("#button").click(function(){
	var Dumbbells1=$("input[name='Dumbbells1']:checked").length;//判斷有多少個方框被勾選
	var Dumbbells2=$("input[name='Dumbbells2']:checked").length;
	var Dumbbells3=$("input[name='Dumbbells3']:checked").length;
	var Dumbbells4=$("input[name='Dumbbells4']:checked").length;
	if(Dumbbells1==0 && Dumbbells2==0 && Dumbbells3==0 && Dumbbells4==0){
		alert("您尚未選取器材位置");
		return false;//不要提交表單
	}else{
		
		return true;//提交表單
	}
})

// $("#reset").click(function(){                                 //click事件 之後 重製所有圖片
//             $("#image1").attr("src","images/star.gif");      
//             $("#image2").attr("src","images/star.gif");      
//             $("#image3").attr("src","images/star.gif");      
//             $("#image4").attr("src","images/star.gif");      
// });



$(document).ready(function() {
	var x=document.getElementById("test1")
	var y=x.value;
	
    var z=y.includes("Dumbbells1")   
                                                                // 當VALUE有值時候  設置不可預定
	if(z){                                           
        $("#image1").attr("src","images/cantorderstar.gif")
        $("#Dumbbells1").attr("disabled","disabled")
        $("#image1").attr('onclick','null').unbind('click');
		}
	});

$(document).ready(function() {
	var x=document.getElementById("test2")
	var y=x.value;
	
	var z=y.includes("Dumbbells2")  

	if(z){                                               
        $("#image2").attr("src","images/cantorderstar.gif")
        $("#Dumbbells2").attr("disabled","disabled")
        $("#image2").attr('onclick','null').unbind('click');
		}
	});


$(document).ready(function() {
	var x=document.getElementById("test3")
	var y=x.value;

	var z=y.includes("Dumbbells3") 
	
	if(z){                                               
        $("#image3").attr("src","images/cantorderstar.gif")
        $("#Dumbbells3").attr("disabled","disabled")
        $("#image3").attr('onclick','null').unbind('click');
		}
	});


$(document).ready(function() {
	var x=document.getElementById("test4")
	var y=x.value;

	var z=y.includes("Dumbbells4") 
	
	if(z){                                               
        $("#image4").attr("src","images/cantorderstar.gif")
        $("#Dumbbells4").attr("disabled","disabled")
        $("#image4").attr('onclick','null').unbind('click');
		}
	});






</script>
	

</body>
</html>