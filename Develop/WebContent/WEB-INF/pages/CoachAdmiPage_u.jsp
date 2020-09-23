<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coach Introduction</title>
<%@ include file="CSSsetting.jsp"%>
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

.whitecolor {
	width: 600px;
}

.inputDiv {
	margin-left: 250px;
}

.retrunDiv {
	margin-left: 400px;
}

#return,#return1 {
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

<%@ include file="header.jsp"%>

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
				<h2 class="coachTitle">修改教練資料</h2>
				<form action="<c:url value="/editCoach" />" method="POST" enctype="multipart/form-data">
					<div class="inputDiv">
						<label>照片:</label><br /> 
						<input type="file" name="coachPic" />
					</div><br />
					<div class="inputDiv">
						<label>教練姓名:</label><br /> 
						<input class="whitecolor" type="text" name="coachName" value="${coachName}" />
					</div><br />
					<div class="inputDiv">
						<label>教練暱稱:</label><br /> 
						<input class="whitecolor" type="text" name="coachNickname" value="${coachNickname}" />
					</div><br />
					<div class="inputDiv">
						<label>年齡:</label><br /> 
						<input class="whitecolor" type="text" name="coachAge" value="${coachAge}" />
					</div><br />
					<div class="inputDiv">
						<label>授課名稱:</label><br /> 
						<input class="whitecolor" type="text" name="courseName" value="${courseName}" />
					</div><br />
					<div class="inputDiv">
						<label>授課類別:</label><br /> 
						<input class="whitecolor" type="text" name="courseType" value="${courseType}" />
					</div><br />
					<div class="inputDiv">
						<label>相關證照:</label><br /> 
						<input class="whitecolor" type="text" name="license" value="${license}" />
					</div><br />
					<div class="inputDiv">
<!-- 						<label>ID:</label><br />  -->
						<input class="whitecolor" type="hidden" name="coachId" value="${coachId}" />
					</div><br />
					<div class="retrunDiv">
						<input type="submit" id="return" value="確認修改">
						<input type="button" id="return1" value="返回教練系統" onclick="location.href='/WeMatch_dev/coachAdminPage'">
					</div>
				</form>
			</div>
		</div>
	</section>

<%@ include file="footer.jsp"%>
<%@ include file="JSsetting.jsp"%>

</body>
</html>