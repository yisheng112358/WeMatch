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
		xhr.open("GET", "<c:url value='/coachData' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var content = "<table border='1' class='coachTable'>";
				content += "<tr><th width='150'>教練照片</th><th width='100'>姓名</th><th width='100'>暱稱</th><th width='100'>年齡</th><th width='120'>授課名稱</th><th width='120'>授課種類</th><th width='150'>相關證照</th></tr>";
				var coach = JSON.parse(xhr.responseText);
				for (var i = 0; i < coach.length; i++) {
					var base64String = btoa(String.fromCharCode.apply(null,
							new Uint8Array(coach[i].coachPic)));
					content += "<tr><td><img src='data:image/jpg;base64," + base64String + "' width='230px' height='230px'></td>"
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
							+ coach[i].license + "</td>" + "</tr>";
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
	border: 2px white solid;
	margin: auto;
	width: 1000px;
	length: 200px;
	font-family: 微軟正黑體;
	font-size: 20px;
}

tr{
	border: 20px white solid;
}

#return {
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

#return:hover {
	background-color: #FF7575
}

#return:active {
	background-color: #FF7575;
	box-shadow: 0 2px #666;
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
				<h2 class="coachTitle">教練介紹</h2>
				<div class="coachDiv" id="coachIntro"></div>
				<br />
			</div>
		</div>
	</section>
	<%
		if (memberStatus.equals("2")) {
		response.sendRedirect("/WeMatch_dev/coachAdminPage");
	}
	%>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>


</body>
</html>