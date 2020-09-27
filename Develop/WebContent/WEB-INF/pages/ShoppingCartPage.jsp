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
<style>
table {
	margin-left: auto;
	margin-right: auto;
	background-color: white;
}
</style>
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
				out.write("	<div style='text-align:center;''>");
				out.write(
				"<table style='text-align:center;padding: 100px;border-radius: 20px;background:white;margin: auto;width: 1200px;length: 200px;font-family: 微軟正黑體;font-size: 20px;'><tr><th>產品名稱</th><th>產品圖片</th><th>產品庫存</th><th>產品單價</th><th>減少</th><th>數量</th><th>增加</th><th>小記</th></tr>");
				for (ProductBean product : carts) {

					out.write("<tr><td><h4 id=" + product.getProductId() + ">" + product.getProductName() + "</h4></td>");
					out.write("<td><img style='width: 100px; height: 100px;' id='detailImg' src='cart/showOrderThumbnail/"
					+ product.getProductId() + "'></td>");
					out.write("<td><label id='stock" + product.getProductId() + "'>" + product.getStock() + "</label></td>");
					out.write("<td>" + (int) product.getPrice() + " <br /></td>");
					out.write("<td><input id='minus" + product.getProductId() + "' type='button' value='-' /></td>");
					out.write("<td><input id='quantity" + product.getProductId() + "' type='text' value='1' class='quantity' name='"
					+ product.getProductId() + "'/></td>");
					out.write("<td><input id='add" + product.getProductId() + "' type='button' value='+' /></td>");
					out.write("<td><p><label name='" + product.getPrice() + "' id='itemTotal" + product.getProductId() + "'>"
					+ (int) product.getPrice() + "</label></p></td>");
				}
				out.write("</tr></table></div>");
			} else {
				out.write("<h1>目前購物車是空的喔~~趕快去選購吧！！！</h1>");
				out.write("<a href='/WeMatch_dev/product/browse' class='btn btn-primary px-5 py-3 mt-3'>繼續購物</a>");
			}
			%>
		</div>
	</section>
	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Cart</span>
					<h2 class="mb-4">寄送資訊</h2>
				</div>
			</div>
		</div>
		<div
			style="text-align: center; width: 700px; margin-left: auto; margin-right: auto; padding: 50px; background-color: #FFBD9D; border-radius: 30px;">
			<p style="font-color: black; font-weight: bold; font-size: larger;">[
				請填寫收件人資訊 ]</p>
			<form:form action="addTransportInformation" method="POST"
				modelAttribute="transportInformation">
				<table
					style="width: 600px; margin-left: auto; padding: 100px; margin: 20px; padding: 50px; background-color: #FFBD9D;">
					<tr>
						<td style="font-color: #336666; font-weight: bold;"><form:label
								path="totalAmount">總金額：</form:label></td>
						<td><form:input path="totalAmount" class="form-control"
								id='totalAmount' /></td>
					</tr>
					<tr>
						<td style="font-color: #804040; font-weight: bold;"><form:label
								path="receiverName">姓名：</form:label></td>
						<td><form:input path="receiverName" class="form-control" /></td>
					</tr>
					<tr>
						<td style="font-color: #804040; font-weight: bold;"><form:label
								path="receiverPhone">電話：</form:label></td>
						<td><form:input path="receiverPhone" class="form-control" /></td>
					</tr>
					<tr>
						<td style="font-color: #804040; font-weight: bold;"><form:label
								path="receiverAddress">地址：</form:label></td>
						<td><form:input path="receiverAddress" class="form-control" /></td>
					</tr>
					<tr>
						<td style="font-color: #804040; font-weight: bold;"><form:label
								path="receiverEmail">信箱：</form:label></td>
						<td><form:input path="receiverEmail" class="form-control" /></td>
					</tr>
					<tr>
						<td style="font-color: #804040; font-weight: bold;"><form:label
								path="receiverNote">備註：</form:label></td>
						<td><form:input path="receiverNote" class="form-control" /></td>
					</tr>
					<tr>
						<td colspan="2"><form:button value="Send" id="sendOrderBtn"
								onclick="retrievePerchaseAmount()"
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
