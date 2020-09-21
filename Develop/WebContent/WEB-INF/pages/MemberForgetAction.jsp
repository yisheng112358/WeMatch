<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>
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
			<a class="navbar-brand" href="index.html">Slim</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<li class="nav-item"><a href="MemberAdminPages"
						class="nav-link"><span>Admin</span></a></li>
					<li class="nav-item"><a href="<c:url value='/loginPage'/>"
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
				<h3 class="mb-5">忘記密碼</h3>
				<form action="memberforgot.co" method="post" class="p-5 bg-light"
					style="position: relative; border: 1px solid;"
					onsubmit="return submitFunc()">
					<div class="form-group">
						<label for="memberPwd">新密碼 *</label> <span id="pwdsp"
							class="notice"></span><br /> <input type="password" id="pwd1"
							class="form-control" name="memberPwd" required="required"
							placeholder="請輸入至少8個字且須包含字母、數字、特殊符號混合字元及不可空白(至多20個)"
							maxlength="20" onblur="checkPwd()"> <span>${errors.pwd}</span>
					</div>
					<div class="form-group">
						<label for="memberNewPwd">確認密碼 *</label> <span id="pwdsp"
							class="notice"></span><br /> <input type="password" id="pwd1"
							class="form-control" name="memberNewPwd" required="required"
							placeholder="請輸入至少8個字且須包含字母、數字、特殊符號混合字元及不可空白(至多20個)"
							maxlength="20" onblur="checkPwd()">
					</div>
					<div class="form-group">
						<a href='<c:url value="/loginPage"/>'>回到登入</a><br /> <input
							id="Button1" type="submit" value="送出"
							class="btn py-3 px-4 btn-primary"> <span>${error.msg}</span>
					</div>
				</form>
				<div class="form-group"></div>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
	<script src="../js/ProductBrowserPage.js" type="text/javascript"></script>
</body>
</html>