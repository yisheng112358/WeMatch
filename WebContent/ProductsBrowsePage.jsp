<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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



	<form action="TestbookingWeb" method="post" id="form1" name="form1">
	
	    <input type="date" name="date" required value="2020-09-05" min="2020-09-05"max="2020-09-10" step="1"> <br />
	    
	    <br/><br/>

	   <div id="checkboxGroup" name="checkboxGroup">
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="9"/>9:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="11"/>11:00</label>
       </div>
	    <br/><br/>
	    <div name="loaction">
		<label> <input style="display:none" type="checkbox" name="Dumbbells1" value="Dumbbells1"><img id="image1" src="images/star.gif" onclick="myfunction()"></label>
		<label> <input style="display:none" type="checkbox" name="Dumbbells2" value="Dumbbells2"><img id="image2" src="images/star.gif" onclick="myfunction2()"></label>
		<label> <input style="display:none" type="checkbox" name="Dumbbells3" value="Dumbbells3"><img id="image3" src="images/star.gif" onclick="myfunction3()"></label>
		<label> <input style="display:none" type="checkbox" name="Dumbbells4" value="Dumbbells4"><img id="image4" src="images/star.gif" onclick="myfunction4()"></label>
		</div>
		
		<br/><br/>
		<input type="submit" name="button" id="button" value="go" >  <input type="reset" name="reset" id="reset" value="back" >
		
    </form>

<script>
$('#checkboxGroup input').click(function(){         //只能選取一個時間段
	 if($(this).prop('checked')){
	   $('#checkboxGroup input:checkbox').prop('checked',false);
	   $(this).prop('checked',true);
	   }
	  });

$("#button").click(function(){
	var check=$("input[name='time']:checked").length;//判斷有多少個方框被勾選
	if(check==0){
		alert("您尚未選取時間");
		return false;//不要提交表單
	}else{

		return true;//提交表單
	}
})

$("#button").click(function(){
	var Dumbbells1=$("input[name='Dumbbells1']:checked").length;//判斷有多少個方框被勾選
	var Dumbbells2=$("input[name='Dumbbells2']:checked").length;//判斷有多少個方框被勾選
	var Dumbbells3=$("input[name='Dumbbells3']:checked").length;//判斷有多少個方框被勾選
	var Dumbbells4=$("input[name='Dumbbells4']:checked").length;//判斷有多少個方框被勾選
	if(Dumbbells1==0 && Dumbbells2==0 && Dumbbells3==0 && Dumbbells4==0){
		alert("您尚未選取器材位置");
		return false;//不要提交表單
	}else{
		
		return true;//提交表單
	}
})

$("#reset").click(function(){                                 //click事件 之後 重製所有圖片
            $("#image1").attr("src","images/star.gif");      
            $("#image2").attr("src","images/star.gif");      
            $("#image3").attr("src","images/star.gif");      
            $("#image4").attr("src","images/star.gif");      
});




</script>


</body>
</html>