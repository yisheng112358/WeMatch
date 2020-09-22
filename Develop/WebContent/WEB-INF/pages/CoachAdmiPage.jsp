<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coach Introduction</title>
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

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Fitness</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<!-- 				<li class="nav-item"><a href="index.html#home-section" -->
					<!-- 					class="nav-link"><span>Home</span></a></li> -->
					<li class="nav-item"><a
						href="<c:url value='/product/browse' />" class="nav-link"><span>Products</span></a></li>
					<li class="nav-item"><a href="index.html#courses-section"
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
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">Our Stories</h1>
					<!-- 				<p class="breadcrumbs"> -->
					<!-- 					<span class="mr-2"><a href="index.html">Home <i -->
					<!-- 							class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a -->
					<!-- 						href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog -->
					<!-- 						Single <i class="ion-ios-arrow-forward"></i> -->
					<!-- 					</span> -->
					<!-- 				</p> -->
				</div>
			</div>
		</div>
	</section>

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
					<input type="button" id="return" value="Browse"
						onclick="location.href='coachPage'"
						style="margin-left: 50px">
				</div>
			</div>
		</div>
	</section>



	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">
							About <span><a href="index.html">Fitness Space.</a></span>
						</h2>
						<p>The gym will always provide the most important tool we need
							to get through life’s challenge – Perseverance.</p>
						<p>~From Dwayne Johnson</p>
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