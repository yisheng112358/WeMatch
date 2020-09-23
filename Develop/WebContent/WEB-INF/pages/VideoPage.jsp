<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.addHeader("x-frame-options", "ALLOW-FROM https://www.youtube.com/");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Video</title>
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

.videoTable {
	color: #000000;
}

.filmtopic {
	color: #0000E3;
	font-weight: bold;
	font-size: 18px;
}

.uptopic {
	color: #A23400;
	font-weight: bold;
	font-size: 25px;
	font-style: italic;
	text-decoration: underline;
}

#intro {
  color:rgb(255, 255, 255);
  font-weight: bolder;
  text-shadow: 3px 3px 3px rgb(0, 0, 0);
}
</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	​​​​​​​
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/WeMatch_dev/index.jsp">Fitness</a>
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
					<li class="nav-item"><a href="/WeMatch_dev/video"
						class="nav-link"><span>Videoflix</span></a></li>
					<li class="nav-item"><a href="<c:url value='/coachPage' />"
						class="nav-link"><span>Coach Intro.</span></a></li>
					<li class="nav-item"><a href="index.html#blog-section"
						class="nav-link"><span>Shopping Cart</span></a></li>
					<li class="nav-item"><a href="<c:url value='/MemberPage' />"
						class='nav-link'><span>Membership</span></a></li>
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
					<!-- 					<p class="breadcrumbs"> -->
					<!-- 						<span class="mr-2"><a href="index.html">Home <i -->
					<!-- 								class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a -->
					<!-- 							href="VideoPage.jsp">Videoflix <i -->
					<!-- 								class="ion-ios-arrow-forward"></i></a></span> -->
					<!-- 					</p> -->
				</div>
			</div>
		</div>
	</section>
	
		<section class="ftco-section ftco-schedule" id="schedule-section" style="padding-bottom: 60px">
<!-- 		<div class="container"> -->

				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Videoflix</span>
					<h2 class="mb-4">Training Video</h2>
					<p>No pain, no gain.</p>
				</div>

<!-- 		</div> -->
		</section>
		
		<section class="ftco-section bg-light" id="blog-section" style="padding-top:50px; padding-bottom: 10px;">
      <div class="container">

        <div class="row d-flex">
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <img src="images/v001.jpg" class="block-20" style="height: 45%;">
              <div class="text float-right d-block" style="border: grey solid 2px; border-bottom-right-radius:60px;">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one mr-2" >
              			<span class="day" id="intro">背部</span>
              		</div>
              		<div class="two">
              			<span class="yr">&nbsp;</span>
              			<span class="mos" style="font-weight: bolder;">肌群</span>
              		</div>
              	</div>
                <h3 class="heading" style="font-weight: bolder; color:orange">背部肌群組成與重要性</h3>
                <p style="color: rgb(95, 92, 92);">核心肌群之一的背部，由多裂肌、豎脊肌、腰方肌等多項肌群組成，當我們站立、起身、前彎時這些肌群就會啟動進行動作，扮演著穩定軀幹的角色。強壯的背部核心肌群不僅能改善一些症狀外同時也能增進在運動上的表現。</p>
                <div class="d-flex align-items-center mt-4 meta" >
	                <p class="mb-0">
                    <a href="#contentupdate" class="btn btn-primary">Go <span class="ion-ios-arrow-round-forward"></span></a>
                  </p>
	                <p class="ml-auto mb-0">
	                </p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <img src="images/v002.jpg" class="block-20" style="height: 45%;">
              <div class="text float-right d-block" style="border: grey solid 2px; border-bottom-right-radius:60px;">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one mr-2">
              			<span class="day" id="intro">胸部</span>
              		</div>
              		<div class="two">
              			<span class="yr">&nbsp;</span>
              			<span class="mos" style="font-weight: bolder;">肌群</span>
              		</div>
              	</div>
                <h3 class="heading" style="font-weight: bolder; color:orange">胸部肌群訓練方式</h3>
                <p style="color: rgb(95, 92, 92);">胸部肌肉可分為胸大肌、胸小肌和前鋸肌。相對其他部位的肌群而言，胸部肌群要簡單很多，其重點在於對於胸大肌的訓練，常用徒手方法為伏地挺身以及各種變式，負重訓練可採用飛鳥和臥推的方式刺激。</p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#contentupdate" class="btn btn-primary">Go <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                </p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry">
              <img src="images/v003.jpg" class="block-20" style="height: 45%;">
              <div class="text float-right d-block" style="border: grey solid 2px; border-bottom-right-radius:60px;">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one mr-2">
              			<span class="day" id="intro">腿部</span>
              		</div>
              		<div class="two">
              			<span class="yr">&nbsp;</span>
              			<span class="mos" style="font-weight: bolder;">肌群</span>
              		</div>
              	</div>
                <h3 class="heading" style="font-weight: bolder; color:orange">強化腿部肌群好處</h3>
                <p style="color: rgb(95, 92, 92);">大腿主要分為前外側、後側和內側三個肌群。勤練腿部肌群好處相當的多，主要能強化腿部肌群、增強核心肌力、消耗更多的熱量、促進生長激素與睪固酮的濃度、提高新陳代謝等等，因此，腿部肌肉沒練好，幾乎是等於健身無效。</p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#contentupdate" class="btn btn-primary">Go <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

	<section class="ftco-section ftco-schedule" id="schedule-section" style="padding-top: 60px">
		<div class="container">
<!-- 			<div class="row justify-content-center pb-5"> -->
<!-- 				<div class="col-md-12 heading-section text-center ftco-animate"> -->
<!-- 					<span class="subheading">Videoflix</span> -->
<!-- 					<h2 class="mb-4">Training Video</h2> -->
<!-- 					<p>No pain, no gain.</p> -->
<!-- 				</div> -->
<!-- 			</div> -->

			<div>
				<!-- 				<div class="coach-wrap ftco-animate d-sm-flex" -->
				<!-- 					style="padding-top: 10px"> -->
				<!-- 					<div>Last Update</div><br> -->

				<!-- 					<div class="tab-pane fade show active" id="v-pills-6" -->
				<!-- 						role="tabpanel" aria-labelledby="day-6-tab"> -->

				<div class="coach-wrap ftco-animate d-sm-flex"
					style="border-radius: 50px">

					<table id=contentupdate class="updateTable"
						style="margin-left: 35px"></table>
				</div>
				<!-- 					</div> -->
				<!-- 				</div> -->

				<!-- 				<div> -->
				<!-- 					<div class="coach-wrap ftco-animate d-sm-flex" -->
				<!-- 						style="padding-top: 10px"> -->
				<!-- 						<h4>Most View</h4> -->

				<!-- 						<div class="tab-pane fade show active" id="v-pills-7" -->
				<!-- 							role="tabpanel" aria-labelledby="day-7-tab"> -->
				<!-- 							<div class="coach-wrap ftco-animate d-sm-flex"> -->
				<!-- 								Show video most view -->
				<!-- 								<table id=contentview class="viewTable"></table> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>

			<div id="down"></div>
			<div class="ftco-schedule">
				<div class="row">
					<div class="col-md-4 nav-link-wrap">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link ftco-animate active" id="v-pills-8-tab"
								data-toggle="pill" href="#v-pills-8" role="tab"
								aria-controls="v-pills-8" aria-selected="true">BodyBack <span>BodyBack,
									Go go!!</span></a> <a class="nav-link ftco-animate" id="v-pills-9-tab"
								data-toggle="pill" href="#v-pills-9" role="tab"
								aria-controls="v-pills-9" aria-selected="false">BodyChest <span>Chest,
									GJ Ha Ha...</span>
							</a> <a class="nav-link ftco-animate" id="v-pills-10-tab"
								data-toggle="pill" href="#v-pills-10" role="tab"
								aria-controls="v-pills-10" aria-selected="false">BodyLeg <span>Leg,
									you're leg ker ker...</span>
							</a>

						</div>

						<br>
						<!-- 						<input type="button" value="Delete" -->
						<!-- 							class="btn py-3 px-4 btn-primary" -->
						<!-- 							onclick="location.href='/WeMatch_dev/VideoDeletePage.jsp'" -->
						<!-- 							style="float: right; margin-right: 10px;"> <input -->
						<!-- 							type="button" value="Add" class="btn py-3 px-4 btn-primary" -->
						<!-- 							onclick="location.href='/WeMatch_dev/VideoListPage.jsp'" -->
						<!-- 							style="float: right; margin-right: 5px;"> -->

						<!-- 						<input type="button" value="Admin" -->
						<!-- 							class="btn py-3 px-4 btn-primary" -->
						<!-- 							onclick="location.href='/WeMatch_dev/VideoDeletePage.jsp'" -->
						<!-- 							style="float: right; margin-right: 5px;"> -->


						<%-- 						<form action="/WeMatch_dev/video/admindelete" method="post"> --%>
						<!-- 							<input type="submit" value="Admin" -->
						<!-- 								class="btn py-3 px-4 btn-primary" style="float: right"> -->
						<%-- 						</form> --%>

						<%
							if (memberStatus.equals("2")) {
							out.print("<form action='/WeMatch_dev/video/admindelete' method='post'>");
							out.print("<input type='submit' value='Admin' class='btn py-3 px-4 btn-primary' style='float: right'>");
							out.print("</form>");
						}
						%>

					</div>
					<div class="col-md-8 tab-wrap">

						<div class="tab-content" id="v-pills-tabContent">

							<div class="tab-pane fade show active" id="v-pills-8"
								role="tabpanel" aria-labelledby="day-8-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id=contentbodyback class="videoTable"></table>
								</div>
								<div id="pageback" class="text-center"></div>
							</div>

							<div class="tab-pane fade" id="v-pills-9" role="tabpanel"
								aria-labelledby="v-pills-day-9-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentbodychest" class="videoTable"></table>
								</div>
								<div id="pagechest" class="text-center"></div>
							</div>

							<div class="tab-pane fade" id="v-pills-10" role="tabpanel"
								aria-labelledby="v-pills-day-10-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentbodyleg" class="videoTable"></table>
								</div>
								<div id="pageleg" class="text-center"></div>
							</div>

						</div>
					</div>
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

	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

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
	<script src="js/main.js"></script>

	<script src="js/VideoUpdate.js" type="text/javascript"></script>
	<script src="js/VideoPage.js" type="text/javascript"></script>

</body>

</html>