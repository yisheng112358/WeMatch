<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coach Introduction</title>
<%@ include file="CSSsettingout.jsp"%>
<script>
	window.onload = function() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/admin/coachData' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var content = "<table border='1' class='coachTable'>";
				content += "<tr><th width='50'>序號</th><th width='150'>教練照片</th><th width='100'>姓名</th><th width='80'>暱稱</th><th width='80'>年齡</th><th width='100'>授課名稱</th><th width='100'>授課種類</th><th width='100'>相關證照</th><th>修改</th><th>刪除</th></tr>";
				var coach = JSON.parse(xhr.responseText);
				for (var i = 0; i < coach.length; i++) {
					var base64String = btoa(String.fromCharCode.apply(null,
							new Uint8Array(coach[i].coachPic)));
					content += "<tr><td align='center'>"
							+ (i + 1)
							+ "</td>"
							+ "<td><img src='data:image/jpg;base64," + base64String + "' width='80' height='80'></td>"
							+ "<td align='center'>"
							+ coach[i].coachName
							+ "</td>"
							+ "<td align='center'>"
							+ coach[i].coachNickname
							+ "</td>"
							+ "<td align='center'>"
							+ coach[i].coachAge
							+ "</td>"
							+ "<td align='center'>"
							+ coach[i].courseName
							+ "</td>"
							+ "<td align='center'>"
							+ coach[i].courseType
							+ "</td>"
							+ "<td align='center'>"
							+ coach[i].license
							+ "</td>"
							+ "<td><a href='coachEdit/" + coach[i].coachId + "'>"
							+ "<input type='button' id='changeCoach' value='修改'></a></td>"
							+ "<td><a href='coachDelete/" + coach[i].coachId + "'>"
							+ "<input type='button' id='deleteCoach' value='刪除'></a></td>"
							+ "</tr>";
				}
				content += "</table>";
				var divs = document.getElementById("coachIntro");
				divs.innerHTML = content;
			}
		}
	}
</script>
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
	padding-right: 50px;
}

h3 {
	display: inline;
}

h3:hover {
	cursor: pointer;
	background: rgba(255, 255, 255, .4);
}

h3:active {
	background: rgba(255, 255, 255, .8);
}

.coachTitle {
	text-align: center;
}

.coachTable {
	text-align: center;
	background: white;
	border: 2px black solid;
	margin: auto;
	width: 1000px;
	length: 200px;
	font-family: 微軟正黑體;
}

tr, th, td {
	border: 2px black solid;
	font-family: 微軟正黑體;
}

#createCoach {
	display: inline-block;
	padding: 8px 15px;
	font-size: 24px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #46A3FF;
	border: none;
	border-radius: 15px;
	box-shadow: 0 5px #999;
	font-family: 微軟正黑體;
}

#createCoach:hover {
	background-color: #FF7575
}

#createCoach:active {
	background-color: #FF7575;
	box-shadow: 0 2px #666;
	transform: translateY(4px);
}

#changeCoach, #deleteCoach {
	display: inline-block;
	padding: 3px 8px;
	font-size: 16px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #46A3FF;
	border: none;
	border-radius: 15px;
	font-family: 微軟正黑體;
}

#changeCoach:hover {
	background-color: #FF7575
}

#changeCoach:active {
	background-color: #FF7575;
	transform: translateY(4px);
}

#deleteCoach:hover {
	background-color: #FF7575
}

#deleteCoach:active {
	background-color: #FF7575;
	transform: translateY(4px);
}

</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="headerout.jsp" %>

	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Coach</span>
					<h2 class="mb-4">Coach Introduction</h2>
					<p>Choose us, we help you go further.</p>
				</div>
			</div>
			<div class="coachDiv">
				<h2 class="coachTitle">教練管理系統</h2>
				<div>
					<label style="margin-left: 800px">Search:</label> <input
						type="text">
				</div>
				<div class="coachDiv" id="coachIntro"></div>
				<br />
				<div>
					<input type="button" id="createCoach" value="新增"
						onclick="location.href='admin/newCoach'"
						style="margin-left: 100px"> 
				</div>
			</div>
		</div>
	</section>


	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>
	

</body>
</html>