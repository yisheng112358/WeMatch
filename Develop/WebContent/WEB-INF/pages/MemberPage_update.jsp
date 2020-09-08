<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
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
						class="nav-link"><span>Programs</span></a></li>
					<li class="nav-item"><a href="index.html#services-section"
						class="nav-link"><span>Services</span></a></li>
					<li class="nav-item"><a href="index.html#schedule-section"
						class="nav-link"><span>Schedule</span></a></li>
					<li class="nav-item"><a href="index.html#about-section"
						class="nav-link"><span>About</span></a></li>
					<li class="nav-item"><a href="index.html#coaches-section"
						class="nav-link"><span>Coaches</span></a></li>
					<li class="nav-item"><a href="index.html#blog-section"
						class="nav-link"><span>Blog</span></a></li>
					<li class="nav-item"><a href="index.html#contact-section"
						class="nav-link"><span>Contact</span></a></li>
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

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">會員資料</h3>
				<form:form servletRelativeAction="MemberPage_updatedata" method="post" 
				enctype="multipart/form-data" modelAttribute="Member">
				<%-- <form action="MemberPage_updatedata" method="post"
						enctype="multipart/form-data" class="p-5 bg-light"
					style="position: relative; border: 1px solid;"> --%>
					<div class="form-group">
						<label for="memberName">姓名：</label>
						<input type="text" id="memberName"
							class="form-control" name="memberName" maxlength="20"
							autocomplete="on">
					</div>
					<div class="form-group">
						<label for="uploadPics">Upload Your Beautiful Pictures：</label> <input
							type="file" name="uploadPics" multiple>
					</div>
					<div class="form-group">
						<label for="nickname">暱稱：</label><input type="text" id="nickname"
							class="form-control" name="nickname" maxlength="20"
							autocomplete="on">
					</div>
					<div class="form-group">
						<label for="gender">性別：</label>
						<select name="gender">
							<option value="M">男生</option>
							<option value="F">女生</option>
							<option value="O">其他</option>
						</select>
					</div>
					<div class="form-group">
						<label for="memberEmail">電子郵件：</label> <span id="mailsp"
							class="notice"></span><br /> <input type="email" id="mail1"
							class="form-control" name="memberEmail" onblur="checkMail()">
					</div>
					<div class="form-group">
						<label for="birthday">生日：</label> <input type="date"
							name="birthday">
					</div>
					<div class="form-group">
						<label for="starSign">星座：</label><br /> <select name="starSign">
							<option value="ARI">白羊座</option>
							<option value="TAU">金牛座</option>
							<option value="GEM">雙子座</option>
							<option value="CNC">巨蟹座</option>
							<option value="LEO">獅子座</option>
							<option value="VIR">處女座</option>
							<option value="LIB">天秤座</option>
							<option value="SCO">天蠍座</option>
							<option value="SGR">射手座</option>
							<option value="CAP">摩羯座</option>
							<option value="AGR">水瓶座</option>
							<option value="PSC">雙魚座</option>
						</select>
					</div>
					<div class="form-group">
						<label for="city">居住/生活城市：</label><br /> <select name="city"
							required="required">
							<option value="KLU">基隆市</option>
							<option value="TPH">新北市</option>
							<option value="TPE">臺北市</option>
							<option value="TYC">桃園市</option>
							<option value="HSH">新竹縣</option>
							<option value="HSC">新竹市</option>
							<option value="MAC">苗栗市</option>
							<option value="MAL">苗栗縣</option>
							<option value="TXG">臺中市</option>
							<option value="CWH">彰化縣</option>
							<option value="CWS">彰化市</option>
							<option value="NTC">南投市</option>
							<option value="NTO">南投縣</option>
							<option value="YLH">雲林縣</option>
							<option value="CHY">嘉義縣</option>
							<option value="CYI">嘉義市</option>
							<option value="TNN">臺南市</option>
							<option value="KHH">高雄市</option>
							<option value="IUH">屏東縣</option>
							<option value="PTS">屏東市</option>
							<option value="ILN">宜蘭縣</option>
							<option value="ILC">宜蘭市</option>
							<option value="HWA">花蓮縣</option>
							<option value="HWC">花蓮市</option>
							<option value="TTC">臺東市</option>
							<option value="TTT">臺東縣</option>
							<option value="PEH">澎湖縣</option>
							<option value="KMN">金門縣</option>
							<option value="LNN">連江縣</option>
						</select>
					</div>
					<div class="form-group">
						<label for="bloodType">血型：</label><br /> <select name="bloodType">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="AB">AB</option>
							<option value="O">O</option>
							<option value="Other" selected="selected">Other</option>
						</select>
					</div>
					<div class="form-group">
						<label for="hobbies">興趣喜好：</label><br /> <label for="movie">
							<input type="checkbox" name="hobbies" id="movie" value="movie">電影
						</label> <label for="sport"> <input type="checkbox" name="hobbies"
							id="sport" value="sport">運動
						</label> <label for="reading"> <input type="checkbox"
							name="hobbies" id="reading" value="reading">閱讀
						</label> <label for="shopping"> <input type="checkbox"
							name="hobbies" id="shopping" value="shopping">逛街
						</label> <label for="hiking"> <input type="checkbox"
							name="hobbies" id="hiking" value="hiking">踏青
						</label> <label for="travel"> <input type="checkbox"
							name="hobbies" id="travel" value="travel">旅遊
						</label>
					</div>
					<div class="form-group">
						<label for="selfIntro">關於我：</label>
						<textarea name="selfIntro" cols="30" rows="10"
							class="form-control"></textarea>
					</div>
					<div class="form-group">
						<input type="submit" value="更新" class="btn py-3 px-4 btn-primary">
					</div>
				</form:form>
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