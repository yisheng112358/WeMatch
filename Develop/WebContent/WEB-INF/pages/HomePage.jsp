<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Fitness Space Homepage</title>
<%@ include file="CSSsettingout.jsp"%>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/WeMatch_dev/homepage">Fitness</a>
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
					<li class="nav-item"><a href="<c:url value='/addCourses' />"
						class="nav-link"><span>Courses</span></a></li>
					<li class="nav-item"><a
						href="<c:url value='/bookingcontroller/booking' />"
						class="nav-link"><span>Schedule</span></a></li>
					<li class="nav-item"><a href="<c:url value='/diet' />"
						class="nav-link"><span>Diet</span></a></li>
					<li class="nav-item"><a href="/WeMatch_dev/video"
						class="nav-link"><span>Videoflix</span></a></li>
					<li class="nav-item"><a href="<c:url value='/coachPage' />"
						class="nav-link"><span>Coach Intro.</span></a></li>
					<li class="nav-item"><a href="<c:url value='/shoppingCart/cart' />"
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


	<section id="home-section" class="hero">
		<div class="home-slider js-fullheight owl-carousel">
			<div class="slider-item js-fullheight">
				<div class="overlay"></div>
				<div class="container-fluid p-0">
					<div
						class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end"
						data-scrollax-parent="true">
						<div class="one-third order-md-last img js-fullheight"
							style="background-image: url(images/bg_1.jpg);">
							<h3 class="vr" style="background-image: url(images/divider.jpg);">Strength</h3>
						</div>
						<div
							class="one-forth d-flex js-fullheight align-items-center ftco-animate"
							data-scrollax=" properties: { translateY: '70%' }">
							<div class="text">
								<span class="subheading">Welcome to the Club</span>
								<h1 class="mb-4 mt-3">
									Get A <span>Perfect</span> Body <span>Figure</span>
								</h1>
								<p>A small river named Duden flows by their place and
									supplies it with the necessary regelialia. It is a
									paradisematic country.</p>

								<p>
									<a href="register" class="btn btn-primary px-5 py-3 mt-3">Join
										with us</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="slider-item js-fullheight">
				<div class="overlay"></div>
				<div class="container-fluid p-0">
					<div
						class="row d-flex no-gutters slider-text js-fullheight align-items-center justify-content-end"
						data-scrollax-parent="true">
						<div class="one-third order-md-last img js-fullheight"
							style="background-image: url(images/bg_2.jpg);">
							<h3 class="vr" style="background-image: url(images/divider.jpg);">Workout</h3>
						</div>
						<div
							class="one-forth d-flex js-fullheight align-items-center ftco-animate"
							data-scrollax=" properties: { translateY: '70%' }">
							<div class="text">
								<span class="subheading">Welcome to Club</span>
								<h1 class="mb-4 mt-3">
									Pain is <span>Temporary</span> But Glory is <span>Forever</span>
								</h1>
								<p>A small river named Duden flows by their place and
									supplies it with the necessary regelialia. It is a
									paradisematic country.</p>

								<p>
									<a href="register" class="btn btn-primary px-5 py-3 mt-3">Join
										with us</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section ftco-schedule">
		<div class="container-fluid px-4">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<h3 class="subheading">Gallery</h3>
					<h2 class="mb-1">Fitness Photo Show</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 ftco-animate">
					<a href="images/gallery-1.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-1.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-3 ftco-animate">
					<a href="images/gallery-2.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-2.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-3 ftco-animate">
					<a href="images/gallery-3.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-3.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
				<div class="col-md-3 ftco-animate">
					<a href="images/gallery-4.jpg"
						class="gallery image-popup img d-flex align-items-center"
						style="background-image: url(images/gallery-4.jpg);">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-instagram"></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section ftco-services-2" id="services-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Happy &amp; Healthy</span>
					<h2 class="mb-4">Main feature &amp; Site map</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md d-flex align-self-stretch ftco-animate" onclick="location.href='/WeMatch_dev/product/browse';" style="cursor :pointer;">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-abs"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Make Your Body Harmonic</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-scale"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Weight Loss Program</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-check-list"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Group Personal Trainings</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Optimal Diet Selection</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block">
						<div class="icon">
							<span class="flaticon-treadmill-machine-with-timer"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Individual Training Programs</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- loader -->
	<!--   <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> -->


	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>