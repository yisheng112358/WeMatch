<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Gson gsonObj = new Gson();
Map<Object, Object> map = null;
List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

map = new HashMap<Object, Object>();
map.put("label", "飲料");
map.put("y", 150);
list.add(map);
map = new HashMap<Object, Object>();
map.put("label", "飯糰");
map.put("y", 232);
list.add(map);
map = new HashMap<Object, Object>();
map.put("label", "麵包");
map.put("y", 195);
list.add(map);

String dataPoints = gsonObj.toJson(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/diet/home.css">
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
</style>
<script type="text/javascript">
	window.onload = function() {

		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			theme : "light2",
			data : [ {
				type : "doughnut",
				yValueFormatString : "#,##0",
				indexLabel : "{label}: {y}cal",
				toolTipContent : "{y}cal",
				dataPoints :
<%out.print(dataPoints);%>
	} ]
		});
		chart.render();

	}
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<%@ include file="headerout.jsp"%>

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

		<div style="margin-left: 600px; font-size: 300%">查詢每日熱量</div>
		<br>
		<div style="margin-left: 610px; color: black; font-size: 120%">
			選擇日期 <input type="date" onchange="showTo()" id="time" value="請選擇">
		</div>
		<br>
		<div
			style="margin-left: 300px; width: 1000px; height: 450px; border: 1px solid black;">
			<div id="yesNo" style="display: none;">
				<div id="chartContainer"
					style="height: 430px; width: 460px; margin: 0 5px 5px 20px; position: absolute;"></div>
				<div
					style="height: 50px; width: 300px; margin: 20px 0 0 600px; position: absolute; color: black">
					總熱量 <span><a style="color: blue; font-size: 300%">577</a>大卡</span>
				</div>
				<div
					style="height: 200px; width: 300px; margin: 200px 0 0 600px; position: absolute;">
					<table style="color: black; font-size: 120%;">
						<tr>
							<th>食物類別</th>
							<th>食物名稱</th>
							<th>熱量(大卡)</th>
						</tr>
						<tr>
							<td>飲料</td>
							<td>豆漿</td>
							<td>150</td>
						</tr>
						<tr>
							<td>飯糰</td>
							<td>肉鬆</td>
							<td>232</td>
						</tr>
						<tr>
							<td>麵包</td>
							<td>巧克力</td>
							<td>195</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<script>
			function showTo() {
				document.getElementById('yesNo').style.display = 'block';
			}
			var date = new Date();
			var year = date.getFullYear();
			var month = ('0' + (date.getMonth() + 1)).slice(-2);
			var day = ('0' + date.getDate()).slice(-2);
			// var day = date.getDay();
			var time = year + '-' + month + '-' + day;
			console.log(time);
			document.getElementById('time').value = time;
			//限制不能選擇今天之後的日期
			document.getElementById('time').setAttribute('max', time);
		</script>
	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>