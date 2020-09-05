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

.star { 
style="display:none"
}
</style>



</head>
<body>



	<form action="booking" method="post">
	
	    <input type="date" name="0" value="2020-09-05" min="2020-09-05"max="2020-09-10" step="1"> <br />
	    <div class="star">
		<label> <input style="display:none" type="checkbox" name="1"><img id="image1" src="images/star.gif" onclick="myfunction()"></label>
		<label> <input style="display:none" type="checkbox" name="2"><img id="image2" src="images/star.gif" onclick="myfunction2()"></label>
		<label> <input style="display:none" type="checkbox" name="3"><img id="image3" src="images/star.gif" onclick="myfunction3()"></label>
		<label> <input style="display:none" type="checkbox" name="4"><img id="image4" src="images/star.gif" onclick="myfunction4()"></label>
		</div>
		<br/><br/>
		<input type="submit" value="go">  <input type="reset" value="back" >
		
    </form>

<!-- 	<input id="datepicker2" type="text" /> -->
<!-- 	<script language="JavaScript"> -->
<!-- // 		$(document).ready(function() { -->

<!-- // 			$("#datepicker2").datepicker({ -->
<!-- // 				firstDay : 1 -->
<!-- // 			}); -->

<!-- // 		}); -->
	</script>


</body>
</html>