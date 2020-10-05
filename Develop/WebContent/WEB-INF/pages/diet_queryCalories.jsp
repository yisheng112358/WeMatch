<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢熱量</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/diet/home.css">
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<%@ include file="CSSsettingout.jsp"%>
<style>
.notice {
	color: #ff0000;
	font-size: small;
}

#memo {
	position: absolute;
	right: 0;
	color: #ff0000;
	font-size: small;
	text-align: right;
}

th, td {
	border: 1px solid black
}

div.title {
	margin-left: 600px;
	font-size: 300%;
}

div.choose-oneday {
	margin-left: 610px;
	color: black;
	font-size: 120%
}

button {
	border: 1px solid black;
	outline: none;
	box-shadow: none;
	background-color: #FFA488;
}

button:hover {
	background-color: black;
	color: white;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/WeMatch_dev/homepage">Fitness</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<li class="nav-item"><a
						href="<c:url value='/product/browse' />" class="nav-link"><span>Products</span></a></li>
					<li class="nav-item"><a href="<c:url value='/addCourses' />"
						class="nav-link"><span>Courses</span></a></li>
					<li class="nav-item"><a
						href="<c:url value='/bookingcontroller/booking' />"
						class="nav-link"><span>Schedule</span></a></li>
					<li class="nav-item"><a href="<c:url value='/diet' />"
						class="nav-link"><span>Diet</span></a></li>
					<li class="nav-item"><a href="/WeMatch_dev/video"
						class="nav-link"><span>Videoflix</span></a></li>
					<li class="nav-item"><a href="<c:url value='/coachPage' />"
						class="nav-link"><span>Coach Intro.</span></a></li>
					<li class="nav-item"><a
						href="<c:url value='/shoppingCart/cart' />" class="nav-link"><span>Shopping
								Cart</span></a></li>
					<li class="nav-item"><a href="<c:url value='/MemberPage' />"
						class='nav-link'><span>Membership</span></a></li>
					<%
						String memberStatus = "" + (Integer) session.getAttribute("Status");
					if (memberStatus.equals("1") || memberStatus.equals("2")) {
						out.write("<li class='nav-item'><a href='/WeMatch_dev/index.jsp' class='nav-link'><span>Logout</span></a></li>");
					} else {
						out.write("<li class='nav-item'><a href='/WeMatch_dev/index.jsp' class='nav-link'><span>Login</span></a></li>");
					}
					%>
				</ul>
			</div>
		</div>
	</nav>


	<section class="ftco-section ftco-services-2" id="services-section">

		<div class="home">
			<a href="diet">飲食首頁</a>
		</div>
		<div class="base">
			<a href="diet_basicSetting">基本設定</a>
		</div>
		<div class="food">
			<a href="diet_newDiet">新增飲食</a>
		</div>
		<div class="count">
			<a href="diet_queryCalories">查詢熱量</a>
		</div>

		<div class="title">查詢每日熱量</div>
		<button style="margin: 30px 0 0 1185px; position: absolute;"
			onclick="block_capture()">點我下載圖片</button>
		<br>
		<div class="choose-oneday">
			選擇日期 <input type="date" class="dateclas" id="oneday"
				onchange="handler(event)" />
		</div>

		<br>
		<div id="img-this"
			style="margin-left: 300px; width: 1000px; height: 450px; border: 1px solid black; ">
			<div>
				<div id="chartContainer"
					style="height: 430px; width: 460px; margin: 0 5px 5px 20px; position: absolute;"></div>
				<div id="showThis"
					style="height: 50px; width: 300px; margin: 20px 0 0 600px; position: absolute; color: black; display: none;">
					總熱量 <span><a id="cal" style="color: blue; font-size: 300%"></a>大卡</span>
				</div>
				<div id="thatDay" style="margin-left: 900px; position: absolute">
				</div>
				<div
					style="height: 200px; width: 300px; margin: 200px 0 0 600px; position: absolute;">
					<div id="foodarea"></div>
				</div>
			</div>
		</div>

		<script>
			//限制不能選擇今天之後的日期
			var date = new Date();
			var year = date.getFullYear();
			var month = ('0' + (date.getMonth() + 1)).slice(-2);
			var day = ('0' + date.getDate()).slice(-2);
			var oneday = year + '-' + month + '-' + day;
			document.getElementById('oneday').value = oneday;
			document.getElementById('oneday').setAttribute('max', oneday);

			//根據選擇的日期，呈現當日數據
			function handler(e) {
				document.getElementById('showThis').style.display = 'block';
				
				var onedays = document.getElementById('oneday').value;

				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/foodList' />" + "?oneday="
						+ onedays, true);
				xhr.send();

				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var content = "<table style='color: black; font-size: 120%;'>"
						content += "<tr><th>食物類別</th><th>食物名稱</th><th>熱量(大卡)</th></tr>";
						var foods = JSON.parse(xhr.responseText);

						var sumcal = 0;
						for (var i = 0; i < foods.length; i++) {
							var cal = Number(foods[i].calories);
							sumcal = sumcal + cal;

							content += "<tr><td>" + foods[i].listType
									+ "</td><td>" + foods[i].listName
									+ "</td><td>" + foods[i].calories
									+ "</td></tr>";

							var thatDay = foods[i].addDate;
						}
						content += "</table>";
						document.getElementById("foodarea").innerHTML = content;

						document.getElementById("cal").innerHTML = sumcal;

						document.getElementById("thatDay").innerHTML = thatDay;

						var chart = new CanvasJS.Chart("chartContainer", {
							animationEnabled : true,
							theme : "light2",
							data : [ {
								type : "doughnut",
								yValueFormatString : "#,##0",
								indexLabel : "{label}: {y}大卡",
								toolTipContent : "{y}大卡",
								dataPoints : dps
							} ]
						});
						var dps = [];
						function parseDataPoints() {
							for (var j = 0; j < foods.length; j++)
								dps.push({
									label : foods[j].listType,
									y : foods[j].calories
								});
						}
						;
						parseDataPoints();
						chart.options.data[0].dataPoints = dps;
						chart.render();
					}
				}
			}

			//點我下載圖片事件
			function block_capture() {
				html2canvas(document.querySelector("#img-this"))
						.then(
								function(canvas2) {
									a = document.createElement('a');
									a.href = canvas2.toDataURL("image/jpeg",
											0.92).replace("image/jpeg",
											"image/octet-stream");
									a.download = 'image.jpg';
									a.click();
								});
			}
		</script>

	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>