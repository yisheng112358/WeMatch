<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
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
<!--table-->
.table {
  width: 100%;
  max-width: 100%;
  margin-bottom: 20px;
}
.table > thead > tr > th,
.table > tbody > tr > th,
.table > tfoot > tr > th,
.table > thead > tr > td,
.table > tbody > tr > td,
.table > tfoot > tr > td {
  padding: 8px;  //設定單元格內邊距
  line-height: 1.42857143;
  vertical-align: top;
  border-top: 1px solid #ddd;  //每條記錄的頂部都有一條1畫素的細線
}
.table > thead > tr > th {
  vertical-align: bottom;
  border-bottom: 2px solid #ddd; //thead有1條2畫素寬的橫線
}
.table > tbody + tbody {
  border-top: 2px solid #ddd;  //如果表格有2個tbody，兩者指間會有1條2畫素寬的橫線
}

</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Slim</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<!--     <li class="nav-item"><a href="index.html#home-section" -->
					<!--      class="nav-link"><span>Home</span></a></li> -->
					<li class="nav-item"><a
						href="<c:url value='/product/browse' />" class="nav-link"><span>Products</span></a></li>
					<li class="nav-item"><a href="<c:url value='/addCourses' />"
						class="nav-link"><span>Courses</span></a></li>
					<li class="nav-item"><a
						href="<c:url value='/bookingcontroller/booking' />"
						class="nav-link"><span>Schedule</span></a></li>
					<li class="nav-item"><a href="index.html#about-section"
						class="nav-link"><span>Diet</span></a></li>
					<li class="nav-item"><a href="/WeMatch_dev/VideoPage.jsp"
						class="nav-link"><span>Videoflix</span></a></li>
					<li class="nav-item"><a href="<c:url value='/coachPage' />"
						class="nav-link"><span>Coach Intro.</span></a></li>
					<li class="nav-item"><a href="index.html#blog-section"
						class="nav-link"><span>Shopping Cart</span></a></li>
					<li class="nav-item"><a href="index.html#contact-section"
						class="nav-link"><span>Membership</span></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">Our Stories</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
							href="addCourses">addCourses <i class="ion-ios-arrow-forward"></i></a></span>
							<span class="mr-2"><a
							href="ListCourses">ListCourses<i class="ion-ios-arrow-forward"></i></a></span>
						</span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<!-- 重複加選的錯誤提示 -->
 	<div align="center">
		<%
		   String errorInfo = (String)request.getAttribute("errorMessage");
		   if(errorInfo != null) {
	   %>
	   <script type="text/javascript" language="javascript">
		   alert("<%=errorInfo%>");
	   window.location='addCourses' ;
   </script> 
   <%
   }
   %>

	   <h1>待選課程區</h1>
	   <table class="table table-striped">
			<tr align="center" color="brack">
			   <th>課程名稱</th>
			   <th>上課星期</th>
			   <th>課程節數</th>
			   <th>上課教室</th>
			   <th>可報人數</th>
			   <th>已報人數</th>
			   <th>剩餘可報人數</th>
			   <th>操作</th>
			</tr>   
		   <c:forEach var="courses" items="${listCurriculum}">
				<tr align="center">
				   <td align="center">${courses.coursesName}</td>
				   <td align="center">${courses.coursesWeek}</td>
				   <td align="center">${courses.sectionNumber}</td>
				   <td align="center">${courses.classRoom}</td>
				   <td align="center">${courses.numberPeople}</td>
				   <td align="center">${courses.regNumber}</td>
				   <td align="center">${courses.coursesBalance}</td>						
				   <td><a href="addCurriculumBtn?coursesId=${courses.coursesId}">
					   <input type="submit" value="➕"></a>
				   </td>	
			   </tr>	
		   </c:forEach>
	   </table>
	   
	   
	   <h2>課表已選所有課程<td></h2>
	   <table class="table table-striped">
			<tr align="center" color="brack">
			   <th>課表代號</th>
			   <th>會員代號</th>
			   <th>課程代號</th>
			   <th>課程名稱</th>
			   <th>上課星期</th>
			   <th>課程節數</th>
			   <th>上課教室</th>
			</tr>   
		   <c:forEach var="curriculum" items="${listCurriculum2}">
				<tr align="center">
				   <td align="center">${curriculum.curriculumId}</td>
				   <td align="center">${curriculum.memberId}</td>
				   <td align="center">${curriculum.coursesId}</td>
				   <td align="center">${curriculum.coursesName}</td>
				   <td align="center">${curriculum.coursesWeek}</td>
				   <td align="center">${curriculum.sectionNumber}</td>
				   <td align="center">${curriculum.classRoom}</td>
			   </tr>
		   </c:forEach>
	   </table>
  		 <div style="background-color: #ffffff">
				 <a href="ListCourses">
				 <input width="10px" padding="100px" 
				 class="btn py-3 px-4 btn-primary" type="submit" value="退選" /></a>
		</div>
	</div>
	</section>

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">
							About <span><a href="index.html">Slim.</a></span>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Links</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Home</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Services</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Cocahes</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Schedule</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Services</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Gym
									Fitness</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Crossfit</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Yoa</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Aerobics</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>

	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="js/SignUpPage.js" type="text/javascript"></script>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>