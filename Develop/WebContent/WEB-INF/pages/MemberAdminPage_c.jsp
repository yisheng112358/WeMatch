<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<%@ include file="header.jsp" %>
	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="schedule-section">
		<div class="container">
			<div class="comment-form-wrap pt-5" style="padding: 20px;">
				<h3 class="mb-5">會員管理資料</h3>
				<form:form class="p-5 bg-light" action="Insert"
					style="position: relative; border: 1px solid;" method="post"
					modelAttribute="Member">
					<table class="form-group">
						<thead>
							<tr>
								<th>帳號</th>
								<th>密碼</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" id="memberAccount"
									class="form-control" name="memberAccount" maxlength="20" /></td>
								<td><input type="password" id="memberPwd"
									class="form-control" name="memberPwd" maxlength="20" /></td>
								<td>${errors.msg}</td>
								<td><input type="submit" value="更新"
									class="btn py-3 px-4 btn-primary"></td>
							</tr>
						</tbody>
					</table>
				</form:form>
				<div class="form-group"></div>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
	<script src="../js/ProductBrowserPage.js" type="text/javascript"></script>
</body>
</html>