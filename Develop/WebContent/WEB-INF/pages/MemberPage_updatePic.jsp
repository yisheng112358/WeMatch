<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	left: center;
	color: #ff0000;
	font-size: small;
	text-align: right;
	padding-right: 50px;
	width: 280px;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	
	<%@ include file="header.jsp"%>

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">會員照片上傳</h3>
				<form Action="MemberPic" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="picture_1">Upload Your Beautiful Pictures1:</label> <input
							type="file" name="picture_1">
					</div>
					<div class="form-group">
						<label for="picture_2">Upload Your Beautiful Pictures2:</label> <input
							type="file" name="picture_2">
					</div>
					<div class="form-group">
						<a href='<c:url value="/MemberPage"/>'>回到會員頁面</a><br />
						<input type="submit" value="上傳" class="btn py-3 px-4 btn-primary">
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
	<script src="../js/ProductBrowserPage.js" type="text/javascript"></script>
</body>
</html>