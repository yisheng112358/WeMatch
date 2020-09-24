<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增</title>
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

		<div style="margin-left: 600px; font-size: 300%">新增飲食</div>

		<div
			style="margin: 20px 0 0 350px; width: 750px; padding: 15px; height: 120px; border: 1px solid black;">
			<form:form id="addfood" action="addFood" method="post"
				modelAttribute="Food">
				<table>

					<tr>
						<td>日期</td>
						<td>食物類別</td>
						<td>食物名稱</td>
						<td>熱量(大卡)</td>
						<td></td>
					</tr>
					<tr>
						<td><form:input type="date" path="addDate" id="time" /></td>
						<td><form:select type="text" path="listType">
								<form:option value="NONE" label="請選擇..." />
								<form:options items="${typeList}" />
							</form:select></td>
						<td><form:input type="text" path="listName" /></td>
						<td><form:input type="text" path="calories" /></td>
						<td><input type="submit" onclick="add()" value="新增" /></td>
					</tr>

				</table>
			</form:form>
		</div>
		<script>
			var date = new Date();
			var year = date.getFullYear();
			var month = ('0' + (date.getMonth() + 1)).slice(-2);
			var day = ('0' + date.getDate()).slice(-2);
			// var day = date.getDay();
			var time = year + '-' + month + '-' + day;
			console.log(time);
			document.getElementById('time').value = time;
			//限制不能选择bai今天之后的日期（加du上属性max）
			document.getElementById('time').setAttribute('max', time);
		</script>

	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>