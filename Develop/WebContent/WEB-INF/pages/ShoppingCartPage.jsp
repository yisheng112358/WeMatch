<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="tw.eeit117.wematch.product.model.ProductBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsetting.jsp"%>
<title>Shopping Cart</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="header.jsp"%>

	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Cart</span>
					<h2 class="mb-4">購買清單</h2>
					<p>請確認資訊</p>
				</div>
			</div>
		</div>

		<div style="text-align: center;">
			<%
				Set<ProductBean> carts = (Set<ProductBean>) session.getAttribute("shoppingCarts");
			if (carts.size() != 0) {
				for (ProductBean product : carts) {
					out.write("<h4 id=" + product.getProductId() + ">" + product.getProductName() + "</h4>");
					out.write("<img style='width: 200px; height: 200px;' id='detailImg' src='cart/showThumbnail/"
					+ product.getProductId() + "'>");
					out.write("<br /> 價錢：" + (int) product.getPrice() + " <br />");
					out.write("<br /> 庫存：<label id='stock" + product.getProductId() + "'>" + product.getStock() + "</label><br />");
					out.write("<input id='minus" + product.getProductId() + "' type='button' value='-' />");
					out.write("<input id='quantity" + product.getProductId() + "' type='text' value='1' />");
					out.write("<input id='add" + product.getProductId() + "' type='button' value='+' />");
					out.write("<p>金額：<label name='" + product.getPrice() + "' id='itemTotal" + product.getProductId() + "'>"
					+ (int) product.getPrice() + "</label></p>");
				}
				out.write("<p>總金額： <input id='totalAmount'/></P>");
			} else {
				out.write("<h1>目前購物車是空的喔~~趕快去選購吧！！！</h1>");
			}
			%>
		</div>
		<div style="text-align: center;">
			<%
				if (carts != null) {
				out.write("<a href='/WeMatch_dev/shoppingCart/transportInf' class='btn btn-primary px-5 py-3 mt-3'>填寫收件人資訊</a>");
			}
			%>
			<p>
				<a href="<c:url value='/product/browse' />"
					class="btn btn-primary px-5 py-3 mt-3">繼續購物</a>
			</p>
		</div>

		<%@ include file="footer.jsp"%>
		<%@ include file="JSsetting.jsp"%>
		<script src="../js/ShoppingCartPage.js" type="text/javascript"></script>
</body>
</html>
