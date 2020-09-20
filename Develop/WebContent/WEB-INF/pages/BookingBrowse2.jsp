<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/aos.css">
<link rel="stylesheet" href="../css/ionicons.min.css">
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/icomoon.css">
<link rel="stylesheet" href="../css/style.css">
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
		style="background-image: url('../images/bg_3.jpg');"
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
				<span style="float:left;"><img width="500" height="500" style="float:left;" src="../images/about.jpg"></span>
					<span class="subheading">BookingNow</span>
				
					<h2 class="mb-4">BookingSystem</h2>
					<p>Enjoy Time For Yourself</p>
					<p>Have Fun Alone</p>
					<br><br>
				<table>
				<tr><td><span style="padding:25px 25px;"><img width="150" height="150"  src="../images/yet.jpg" ></span></td>
				<td><span style="padding:25px 25px;"><img width="150" height="150"  src="../images/select.jpg" ></span></td>
				<td><span style="padding:25px 25px;"><img width="150" height="150"  src="../images/ordered.jpg" ></span></td></tr>
				<br>
				<tr><td><span>可預約</span></td>
				<td><span>預約中</span></td>
				<td><span>已預約</span></td></tr>
				</table>
				</div>
			</div>

<hr/>
<div>
	<form style="text-align:center;" action="<c:url  value="/bookingcontroller/bookingCheck"/>" method="post" id="form1" name="form1">
	
	
	<input type="date" id="date" name="date" required value="2020-09-17" min="2020-09-17"max="2020-09-30" step="1"> <br />

	    <br/><br/>
	    
	  
        
<div id="checkboxGroup" name="checkboxGroup">
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="9"/>9:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="11"/>11:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="13"/>13:00</label>
        <label class="timefont"><input name="time" type="checkbox" class="checkbox" value="15"/>15:00</label>
</div>
<!--                       draggable="false" 不被拖動 -->
       </div>                            
	    <br/><br/>
	    
	    <div  id="loaction" style="text-align:center;" >
	    
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells1" id="Dumbbells1" value="Dumbbells1"><img width="150" height="150" id="image1" src="../images/yet.jpg" onclick="myfunction()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells2" id="Dumbbells2" value="Dumbbells2"><img width="150" height="150" id="image2" src="../images/yet.jpg" onclick="myfunction2()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells3" id="Dumbbells3" value="Dumbbells3"><img width="150" height="150" id="image3" src="../images/yet.jpg" onclick="myfunction3()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells4" id="Dumbbells4" value="Dumbbells4"><img width="150" height="150" id="image4" src="../images/yet.jpg" onclick="myfunction4()"></label></span>
		<br/><br/>
		
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells5" id="Dumbbells5" value="Dumbbells5"><img width="150" height="150" id="image5"src="../images/yet.jpg" onclick="myfunction5()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells6" id="Dumbbells6" value="Dumbbells6"><img width="150" height="150" id="image6"src="../images/yet.jpg" onclick="myfunction6()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells7" id="Dumbbells7" value="Dumbbells7"><img width="150" height="150" id="image7" src="../images/yet.jpg" onclick="myfunction7()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells8" id="Dumbbells8" value="Dumbbells8"><img width="150" height="150" id="image8" src="../images/yet.jpg" onclick="myfunction8()"></label></span>
		<br/><br/>
		
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells9" id="Dumbbells9" value="Dumbbells9"><img width="150" height="150" id="image9"src="../images/yet.jpg" onclick="myfunction9()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells10" id="Dumbbells10" value="Dumbbells10"><img width="150" height="150" id="image10" src="../images/yet.jpg" onclick="myfunction10()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells11" id="Dumbbells11" value="Dumbbells11"><img width="150" height="150" id="image11" src="../images/yet.jpg" onclick="myfunction11()"></label></span>
		<span style="padding:50px 50px;"><label> <input style="display:none" type="checkbox" name="Dumbbells12" id="Dumbbells12" value="Dumbbells12"><img width="150" height="150" id="image12" src="../images/yet.jpg" onclick="myfunction12()"></label></span>
		
		
		
		<input style="display:none" type="hidden" id="test1"  value="${D1}">

		<input style="display:none" type="hidden" id="test2"  value="${D2}">

		<input style="display:none" type="hidden" id="test3"  value="${D3}">                                                                             

        <input style="display:none" type="hidden" id="test4"  value="${D4}">
        
        <input style="display:none" type="hidden" id="test5"  value="${D5}">

		<input style="display:none" type="hidden" id="test6"  value="${D6}">

		<input style="display:none" type="hidden" id="test7"  value="${D7}">                                                                             

        <input style="display:none" type="hidden" id="test8"  value="${D8}">
         
        <input style="display:none" type="hidden" id="test9"  value="${D9}">

		<input style="display:none" type="hidden" id="test10"  value="${D10}">

		<input style="display:none" type="hidden" id="test11"  value="${D11}">                                                                             

        <input style="display:none" type="hidden" id="test12"  value="${D12}">

                                                                     
        <br/><br/>                                                                        
		<input type="submit" name="button" id="button" value="預約" >
		<input type="reset" name="button" id="reset" value="重製" >
		
		</div>
		
		<br/><br/>
		

    </form>
 </div>
 
 <%@ include file="BookingBrowse1.jsp"%>
 
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

	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/scrollax.min.js"></script>


	<script src="../js/main.js"></script>


    
    

<script src="../js/bookinglocationset.js"></script>
<script src="../js/bookingcheck.js"></script>
<script src="../js/bookingcheck2.js"></script>

<script src="../js/bookingcheck-web1.js"></script>
<script src="../js/bookingcheck3.js"></script>
</body>
</html>