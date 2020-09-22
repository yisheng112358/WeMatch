<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<form class="p-5 bg-light" action="preInsert"
					style="position: relative; border: 1px solid;" method="post">
					<table class="form-group">
						<div class="form-group">
							<input type="submit" value="查詢" class="btn py-3 px-4 btn-primary">
							<a href="<c:url value='/preInsert.do' />">新增</a>
						</div>
						<thead>
							<tr>
								<th>序號</th>
								<th>編號</th>
								<th>帳號</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="status" var="result" items="${results}">
								<tr>
									<td>${status.count}</td>
									<td>${result.memberId}</td>
									<td>${result.memberAccount}</td>
									<td><a
										href="<c:url value='/preUpdate?id=${result.memberId}' />">查詢</a>
										<a href="<c:url value='/delete?id=${result.memberId}' />">刪除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="form-group"></div>

				</form>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
	<script src="../js/ProductBrowserPage.js" type="text/javascript"></script>
</body>
</html>