<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員登入</title>
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
</style>
<script type="text/javascript">
	var code;
	function createCode() {
		code = "";
		var codeLength = 6; //驗證碼的長度
		var checkCode = document.getElementById("checkCode");
		var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		for (var index = 0; index < codeLength; index++) {
			var charNum = Math.floor(Math.random() * 52);
			code += codeChars[charNum];
		}
		if (checkCode) {
			checkCode.className = "code";
			checkCode.innerHTML = code;
		}
	}
	function validateCode() {
		var inputCode = document.getElementById("inputCode").value;
		var textShow = document.getElementById("text_show")
		if (inputCode.length <= 0) {
			textShow.innerHTML = "請輸入驗證碼";
			textShow.style.color = "red";
		} else if (inputCode.toUpperCase() != code.toUpperCase()) {
			textShow.innerHTML = "您輸入的驗證碼有誤";
			textShow.style.color = "red";
			createCode();
		} else {
			textShow.innerHTML = "驗證碼正確";
			textShow.style.color = "green";
		}
	}
	function checkCode() {
		var btn = document.getElementById("Button1");
		btn.onclick = function() {
			validateCode();
		}
	}
	window.onload = function() {
		checkCode();
		createCode();
		document.getElementById("checkCode").onclick = function() {
			createCode()
		}
		linkbt.onclick = function() {
			createCode()
		}
		inputCode.onclick = function() {
			validateCode();
		}
	}
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

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
					<li class="nav-item"><a href="/WeMatch_dev/VideoPage.jsp"
						class="nav-link"><span>Videoflix</span></a></li>
					<li class="nav-item"><a href="index.html#coaches-section"
						class="nav-link"><span>Discussion</span></a></li>
					<li class="nav-item"><a href="index.html#blog-section"
						class="nav-link"><span>Shopping Cart</span></a></li>
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

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">會員登入</h3>
				<form action="loginsystem.controller" method="post"
					enctype="multipart/form-data" class="p-5 bg-light"
					style="position: relative; border: 1px solid;"
					onsubmit="return submitFunc()">
					<div id="memo">*為必填</div>
					<div class="form-group">
						<label for="memberAccount">帳號 *</label> <span id="accountsp"
							class="notice"></span><br /> <input type="text" id="account1"
							class="form-control" name="memberAccount" required="required"
							placeholder="請輸入少8個字字母、數字混合字元以內且不可空白(至多20個)" maxlength="20"
							autocomplete="on" onblur="checkAccount()"> <span>${errors.name}</span>
					</div>
					<div class="form-group">
						<label for="memberPwd">密碼 *</label> <span id="pwdsp"
							class="notice"></span><br /> <a href="MemberForgot">忘記密碼？</a> <input
							type="password" id="pwd1" class="form-control" name="memberPwd"
							required="required"
							placeholder="請輸入至少8個字且須包含字母、數字、特殊符號混合字元及不可空白(至多20個)"
							maxlength="20" onblur="checkPwd()"> <span>${errors.pwd}</span>
					</div>

					<div class="form-group">
						<a href='<c:url value="/register"/>'>尚未註冊？</a> <br />
						<div class="v_code">
							<div class="code_show">
								<span class="code" id="checkCode"></span> <a id="linkbt">看不清換一張</a>
							</div>
							<div class="input_code">
								<label for="inputCode">驗證碼：</label> <input type="text"
									id="inputCode" name="inputCode" required="required" /> <span
									id="text_show">${errors.incode}</span>
							</div>
						</div>
						<input id="Button1" type="submit" value="登入"
							class="btn py-3 px-4 btn-primary"> <span>${errors.msg}</span>
					</div>

				</form>
			</div>
		</div>
	</section>
	<%@ include file="WEB-INF/pages/footer.jsp"%>
	<%-- 	<%@ include file="WEB-INF/pages/JSsetting.jsp"%> --%>
	<script src="/js/ProductBrowserPage.js" type="text/javascript"></script>

</body>
</html>