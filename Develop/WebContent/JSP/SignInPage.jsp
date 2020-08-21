<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帳號註冊</title>
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
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<section class="ftco-section"
		style='background-image: url("../images/bg_3.jpg"); background-position: 50% 0px;'>
		<div class="container">
			<div class="row">
				<div class="pt-5 mt-5">
					<div class="comment-form-wrap pt-5">
						<h3 class="mb-5">帳號註冊</h3>
						<form action="../SignInJdbcConnServlet.do" method="post"
							class="p-5 bg-light"
							style="position: relative; border: 1px solid;">
							<div id="memo">*為必填</div>
							<div class="form-group">
								<label for="memberAccount">帳號 *</label> <span id="accountsp"
									class="notice"></span><br /> <a href="SignUpPage.jsp">忘記密碼？</a>
								<input type="text" id="account1" class="form-control"
									name="memberAccount" required="required"
									placeholder="請輸入少8個字字母、數字混合字元以內且不可空白(至多20個)" maxlength="20"
									autocomplete="on" onblur="checkAccount()">
							</div>
							<div class="form-group">
								<label for="memberPwd">密碼 *</label> <span id="pwdsp"
									class="notice"></span><br /> <a href="SignUpPage.jsp">忘記帳號？</a>
								<input type="password" id="pwd1" class="form-control"
									name="memberPwd" required="required"
									placeholder="請輸入至少8個字且須包含字母、數字、特殊符號混合字元及不可空白(至多20個)"
									maxlength="20" onblur="checkPwd()">
							</div>

							<div class="form-group">
								<a href="SignUpPage.jsp">尚未註冊？</a><br /> <input type="submit"
									value="登入" class="btn py-3 px-4 btn-primary">
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="../js/SignUpPage.js" type="text/javascript"></script>
<!-- 	<script src="js/jquery.min.js"></script> -->
<!-- 	<script src="js/jquery-migrate-3.0.1.min.js"></script> -->
<!-- 	<script src="js/popper.min.js"></script> -->
<!-- 	<script src="js/bootstrap.min.js"></script> -->
<!-- 	<script src="js/jquery.easing.1.3.js"></script> -->
<!-- 	<script src="js/jquery.waypoints.min.js"></script> -->
<!-- 	<script src="js/jquery.stellar.min.js"></script> -->
<!-- 	<script src="js/owl.carousel.min.js"></script> -->
<!-- 	<script src="js/jquery.magnific-popup.min.js"></script> -->
<!-- 	<script src="js/aos.js"></script> -->
<!-- 	<script src="js/jquery.animateNumber.min.js"></script> -->
<!-- 	<script src="js/scrollax.min.js"></script> -->
<!-- 	<script -->
<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!-- 	<script src="js/google-map.js"></script> -->
<!-- 	<script src="js/main.js"></script> -->


</body>
</html>