<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TransportInformation</title>
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

.flex {
	display: flex;
	align-items: center;
	justify-content: center;
	widows: 600px;;
	height: 300px;
	background-color: #eee;
}

table{
margin-left:auto; 
margin-right:auto;
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
					<li class="nav-item"><a href="index.html#home-section"
						class="nav-link"><span>Home</span></a></li>
					<li class="nav-item"><a href="index.html#programs-section"
						class="nav-link"><span>Products</span></a></li>
					<li class="nav-item"><a href="index.html#services-section"
						class="nav-link"><span>Courses</span></a></li>
					<li class="nav-item"><a href="index.html#schedule-section"
						class="nav-link"><span>Schedule</span></a></li>
					<li class="nav-item"><a href="index.html#about-section"
						class="nav-link"><span>Diet</span></a></li>
					<li class="nav-item"><a href="index.html#coaches-section"
						class="nav-link"><span>Discussion</span></a></li>
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
							href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog
							Single <i class="ion-ios-arrow-forward"></i>
						</span>
					</p>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Cart</span>
					<h2 class="mb-4">寄送資訊</h2>
					<p>請填寫收件人資訊</p>
				</div>
			</div>
		</div>

		<!-- ***************** 購物車程頁面OrderTransportPage式碼 開始 ***************** -->
	<div style="text-align:center;">

			<form:form action="addTransportInformation" method="POST" modelAttribute="TransportInformation">
		<table>
			<tr>
				<td><form:label path="receiverName">姓名：</form:label></td>
				<td><form:input path="receiverName" /></td>
			</tr>
			<tr>
				<td><form:label path="receiverPhone">電話：</form:label></td>
				<td><form:input path="receiverPhone" /></td>
			</tr>
			<tr>
				<td><form:label path="receiverAddress">地址：</form:label></td>
				<td><form:input path="receiverAddress" /></td>
			</tr>
			<tr>
				<td><form:label path="receiverEmail">信箱：</form:label></td>
				<td><form:input path="receiverEmail" /></td>
			</tr>
			<tr>
				<td><form:label path="receiverNote">備註：</form:label></td>
				<td><form:input path="receiverNote" /></td>
			</tr>
			<tr>
				<td colspan="2"><form:button value="Send">確認送出訂單</form:button></td>
			</tr>
		</table>
	</form:form>
	
	</div>
		<!-- ***************** 購物車頁面OrderTransportPage程式碼 結束 ***************** -->

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
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>Home</a></li>
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>About</a></li>
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>Services</a></li>
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>Cocahes</a></li>
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>Schedule</a></li>
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md">
						<div class="ftco-footer-widget mb-4">
							<h2 class="ftco-heading-2">Services</h2>
							<ul class="list-unstyled">
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>Gym Fitness</a></li>
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>Crossfit</a></li>
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>Yoa</a></li>
								<li><a href="#"><span
										class="icon-long-arrow-right mr-2"></span>Aerobics</a></li>
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

		<script src="js/ProductBrowserPage.js" type="text/javascript"></script>
</body>
</html>