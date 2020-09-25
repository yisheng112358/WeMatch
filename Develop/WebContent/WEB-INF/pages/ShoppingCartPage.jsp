<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
						out.write("<img style='width: 200px; height: 200px;' id='detailImg' src='cart/showOrderThumbnail/"
								+ product.getProductId() + "'>");
						out.write("<br /> 價錢：" + (int) product.getPrice() + " <br />");
						out.write("<br /> 庫存：<label id='stock" + product.getProductId() + "'>" + product.getStock()
								+ "</label><br />");
						out.write("<input id='minus" + product.getProductId() + "' type='button' value='-' />");
						out.write("<input id='quantity" + product.getProductId() + "' type='text' value='1' />");
						out.write("<input id='add" + product.getProductId() + "' type='button' value='+' />");
						out.write("<p>金額：<label name='" + product.getPrice() + "' id='itemTotal" + product.getProductId()
								+ "'>" + (int) product.getPrice() + "</label></p>");
					}
				} else {
					out.write("<h1>目前購物車是空的喔~~趕快去選購吧！！！</h1>");
					out.write("<a href='/WeMatch_dev/product/browse' class='btn btn-primary px-5 py-3 mt-3'>繼續購物</a>");
				}
			%>
		</div>
	</section>
	<hr />
	<section class="ftco-section testimony-section" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Cart</span>
					<h2 class="mb-4">寄送資訊</h2>
					<p>請填寫收件人資訊</p>
				</div>
			</div>
		</div>
		<div style="text-align: center;">

			<form:form action="addTransportInformation" method="POST"
				modelAttribute="transportInformation">
				<table>
					<tr>
						<td><form:label path="totalAmount">總金額：</form:label></td>
						<td><form:input path="totalAmount" id='totalAmount' /></td>
					</tr>
					<tr>
						<td><form:label path="receiverName">姓名：</form:label></td>
						<td><form:input path="receiverName" /></td>
					</tr>
					<tr>
						<td><form:label path="receiverPhone">電話：</form:label></td>
						<td><form:input path="receiverPhone" /></td>
					</tr>
					<tr>
						<td><form:label path="receiverAddress">地址：</form:label></td>
						<td><form:input path="receiverAddress" /></td>
					</tr>
					<tr>
						<td><form:label path="receiverEmail">信箱：</form:label></td>
						<td><form:input path="receiverEmail" /></td>
					</tr>
					<tr>
						<td><form:label path="receiverNote">備註：</form:label></td>
						<td><form:input path="receiverNote" /></td>
					</tr>
					<tr>
						<td colspan="2"><form:button value="Send"
								class='btn btn-primary px-5 py-3 mt-3'>確認送出訂單</form:button></td>
					</tr>
				</table>
			</form:form>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>
	<script src="../js/ShoppingCartPage.js" type="text/javascript"></script>
</body>
</html>
