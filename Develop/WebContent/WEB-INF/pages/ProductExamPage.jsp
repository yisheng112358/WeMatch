<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="tw.eeit117.wematch.product.model.ProductBean"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsetting.jsp"%>
<title>Product Exam</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="header.jsp"%>

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="about-section">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-6 col-lg-5 d-flex">
					<div class="img d-flex align-self-stretch align-items-center">
						<%
							ProductBean productBean = (ProductBean) session.getAttribute("product");
						out.write("<img style='width: 400px; height: 400px;' id='detailImg' src='examProduct/showDetailImg/"
								+ productBean.getProductId() + "'>");
						%>
					</div>
				</div>
				<div class="col-md-6 col-lg-7 pl-lg-5 py-5">
					<div class="py-md-5">
						<div class="row justify-content-start pb-3">
							<div class="col-md-12 heading-section ftco-animate">
								<%
									out.write("<span class='subheading' id='category'>" + productBean.getCategory() + "</span>");
								out.write("<h2 class='mb-4' id='productName' style='font-size: 34px; text-transform: capitalize;'>"
										+ productBean.getProductName() + "</h2>");
								out.write("<p id='price'>Price: " + productBean.getPrice() + "</p>");
								out.write("<p id='stock'>Stock: " + productBean.getStock() + "</p>");
								out.write("<p id='productDescription'>" + productBean.getProductDescription() + "</p>");
								%>
								<div style="text-align: left;">
									<a href="/WeMatch_dev/product/browse"
										class="btn btn-primary px-5 py-3 mt-3">加入購物車</a>
								</div>
							</div>
						</div>
					</div>
					<div style="text-align: right;">
						<a href="/WeMatch_dev/product/browse"
							class="btn btn-primary px-5 py-3 mt-3">返回</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>

</body>
</html>