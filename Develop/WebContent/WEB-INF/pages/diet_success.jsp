<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增飲食</title>
<%@ include file="CSSsettingout.jsp"%>
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

body {
	color: black;
}

div.add_cent {
	width: 600px;
	height: 200px;
	margin: 0 auto;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<%@ include file="headerout.jsp"%>

	<section class="ftco-section ftco-services-2" id="services-section">

		<script src="js/jquery-3.5.1.min.js"></script>
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

		<a style="font-size: 400%; margin-left: 600px;">新增成功~~</a> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>