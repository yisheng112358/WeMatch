<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Courses</title>
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
	padding-right: 50px;
}

.v_code {
	width: 600px;
	margin: 0 auto;
}

.v_code>input {
	width: 60px;
	height: 36px;
	margin-top: 10px;
}

.code_show {
	overflow: hidden;
}

.code_show span {
	display: block;
	float: left;
	margin-bottom: 10px;
}

.code_show a {
	display: block;
	float: left;
	margin-top: 10px;
	margin-left: 10px;
}

.code {
	font-style: italic;
	background-color: #f5f5f5;
	color: blue;
	font-size: 30px;
	letter-spacing: 3px;
	font-weight: bolder;
	float: left;
	cursor: pointer;
	padding: 0 5px;
	text-align: center;
}

#inputCode {
	width: 100px;
	height: 30px;
}
a{text-decoration:none;}
a:hover{text-decoration:underline;}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	
	<%@ include file="headerout.jsp"%>
	
	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">新增/編輯 課程💬 & <a href ="CoursesHome" style="color:black";>🔎查詢</a></h3>
				<form:form action="saveCourses" method="post" modelAttribute="courses"
					enctype="multipart/form-data" class="p-5 bg-light"
					style="position: relative; border: 1px solid;"
					onsubmit="return submitFunc()">
					<div id="memo">*為必填</div>
					<form:hidden path="coursesId"/>
					<div class="form-group">
						<label for="coursesName">課程名稱 *</label> <span id="coursesName"
							class="notice"></span><br />
						<form:input type="text" id="coursesWeek" class="form-control" path="coursesName"
							name="coursesWeek" required="required"
							maxlength="20" onblur="checkPwd()"></form:input>
					</div>
					<div class="form-group">
						<label for="coursesWeek">上課星期 *</label> <span id="coursesWeek"
							class="notice"></span><br />
						<form:input type="text" id="coursesWeek" class="form-control" path="coursesWeek"
							name="coursesWeek" required="required"
							maxlength="20" onblur="checkPwd()"></form:input>
					</div>
					<div class="form-group">
						<label for="sectionNumber">課程節數 *</label> <span id="sectionNumber"
							class="notice"></span><br />
						<form:input type="text" id="sectionNumber" class="form-control" path="sectionNumber"
							name="sectionNumber" required="required"
							maxlength="20" onblur="checkPwd()"></form:input>
					</div>
					<div class="form-group">
						<label for="classRoom">上課教室 *</label> <span id="classRoom"
							class="notice"></span><br />
						<form:input type="text" id="classRoom" class="form-control" path="classRoom"
							name="classRoom" required="required"
							maxlength="20" onblur="checkPwd()"></form:input>
					</div>
					<div class="form-group">
						<label for="numberPeople">可報人數 *</label> <span id="numberPeople"
							class="notice"></span><br />
						<form:input type="text" id="numberPeople" class="form-control" path="numberPeople"
							name="numberPeople" required="required"
							maxlength="20" onblur="checkPwd()"></form:input>
					</div>
					<div class="form-group">
						<label for="regNumber">已報人數 *</label> <span id="regNumber"
							class="notice"></span><br />
						<form:input type="text" id="regNumber" class="form-control" path="regNumber"
							name="regNumber" required="required"
							maxlength="20" onblur="checkPwd()"></form:input>
					</div>
					<div class="form-group">
						<label for="coursesBalance">剩餘可報人數 *</label> <span id="coursesBalance"
							class="notice"></span><br />
						<form:input type="text" id="coursesBalance" class="form-control" path="coursesBalance"
							name="coursesBalance" required="required"
							maxlength="20" onblur="checkPwd()"></form:input>
					</div>

					<div class="form-group">
						<input  id="Button1" type="submit" value="送出" class="btn py-3 px-4 btn-primary">
						<span></span>
					</div>

				</form:form>
			</div>
		</div>
	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>



</body>
</html>