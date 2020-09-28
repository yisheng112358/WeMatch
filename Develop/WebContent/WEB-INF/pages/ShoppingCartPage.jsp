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

<script type="text/javascript">
	function cartkey() {
		document.getElementById("rec_name").value = "小奕";
		document.getElementById("rec_phone").value = "0910156347";
		document.getElementById("rec_address").value = "106台北市大安區復興南路一段390號2樓";
		document.getElementById("rec_email").value = "yee2020@gmail.com";
		document.getElementById("rec_note").value = "需打統編:35701598";
		checkname();
		checkphone();
		checkaddress();
		checkemail();
	}

	function checkname() {
		let theNameObj = document.getElementById("rec_name");
		let theNameObjVal = theNameObj.value;
		let theNameObjValLen = theNameObjVal.length;
		let chinese = /^[\u4e00-\u9fa5]{2,}$/;
		var nameoutcome = document.getElementById("namecheck");
		if (theNameObjVal == "") {
			nameoutcome.innerHTML = "⛔不可空白";
			nameoutcome.style.color = "#A23400";
			return false;
		} else if (theNameObjValLen < 2) {
			nameoutcome.innerHTML = "⛔請填完整姓名";
			nameoutcome.style.color = "#A23400";
			return false;
		} else if (!chinese.test(theNameObjVal)) {
			nameoutcome.innerHTML = "⛔請輸入中文";
			nameoutcome.style.color = "#A23400";
			return false;
		} else if (chinese.test(theNameObjVal) && theNameObjValLen >= 2) {
			nameoutcome.innerHTML = "👌🏻格式正確";
			nameoutcome.style.color = "#408080";
			return true;
		} else {
			nameoutcome.innerHTML = "⛔格式有誤";
			nameoutcome.style.color = "#A23400";
			return false;
		}
	}

	function checkphone() {
		let thePhoneObj = document.getElementById("rec_phone");
		let thePhoneObjVal = thePhoneObj.value;
		let thePhoneObjValLen = thePhoneObjVal.length;
		let unmber = /09\d{8}/;
		var phoneoutcome = document.getElementById("phonecheck");
		if (thePhoneObjVal == "") {
			phoneoutcome.innerHTML = "⛔不可空白";
			phoneoutcome.style.color = "#A23400";
			return false;
		} else if (unmber.test(thePhoneObjVal)) {
			phoneoutcome.innerHTML = "👌🏻格式正確";
			phoneoutcome.style.color = "#408080";
			return true;
		} else {
			phoneoutcome.innerHTML = "⛔請填10個阿拉伯數字";
			phoneoutcome.style.color = "#A23400";
			return false;
		}
	}

	function checkaddress() {
		let theAddressObj = document.getElementById("rec_address");
		let theAddressObjVal = theAddressObj.value;
		let theAddressObjValLen = theAddressObjVal.length;
		var addressoutcome = document.getElementById("addresscheck");
		if (theAddressObjVal == "") {
			addressoutcome.innerHTML = "⛔不可空白";
			addressoutcome.style.color = "#A23400";
			return false;
		} else if (theAddressObjValLen < 5) {
			addressoutcome.innerHTML = "⛔請填完整地址";
			addressoutcome.style.color = "#A23400";
			return false;
		} else if (theAddressObjVal != "" && theAddressObjValLen >= 5) {
			addressoutcome.innerHTML = "👌🏻格式正確";
			addressoutcome.style.color = "#408080";
			return true;
		} else {
			addressoutcome.innerHTML = "⛔格式有誤";
			addressoutcome.style.color = "#A23400";
			return false;
		}
	}

	function checkemail() {
		let theEmailObj = document.getElementById("rec_email");
		let theEmailObjVal = theEmailObj.value;
		let theEmailObjValLen = theEmailObjVal.length;
		let emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
		var emailoutcome = document.getElementById("emailcheck");
		if (theEmailObjVal == "") {
			emailoutcome.innerHTML = "⛔不可空白";
			emailoutcome.style.color = "#A23400";
			return false;
		} else if (emailRule.test(theEmailObjVal)) {
			emailoutcome.innerHTML = "👌🏻格式正確";
			emailoutcome.style.color = "#408080";
			return true;
		} else {
			emailoutcome.innerHTML = "⛔格式有誤";
			emailoutcome.style.color = "#A23400";
			return false;
		}
	}

	function cartsubmit() {
		if (checkname() && checkphone() && checkaddress() && checkemail()) {
			return true;
		} else {
			alert("欄位有誤 請重新確認再送出！");
			return false;
		}
	}
</script>
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
					out.write("<td><input id='quantity" + product.getProductId() + "' type='text' value='0' class='quantity' name='"
					+ product.getProductId() + "'/></td>");
					out.write("<td><input id='add" + product.getProductId() + "' type='button' value='+' /></td>");
					out.write("<td><p><label name='" + product.getPrice() + "' id='itemTotal" + product.getProductId() + "'>0</label></p></td>");
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
				modelAttribute="transportInformation" onsubmit="return cartsubmit()">
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
						<td><form:input path="receiverName" class="form-control"
								id='rec_name' onchange='checkname()' /><span id=namecheck
							style="font-weight: bold;"></span></td>
					</tr>
					<tr>
						<td style="font-color: #804040; font-weight: bold;"><form:label
								path="receiverPhone">電話：</form:label></td>
						<td><form:input path="receiverPhone" class="form-control"
								id='rec_phone' onchange='checkphone()' /><span id=phonecheck
							style="font-weight: bold;"></span></td>
					</tr>
					<tr>
						<td style="font-color: #804040; font-weight: bold;"><form:label
								path="receiverAddress">地址：</form:label></td>
						<td><form:input path="receiverAddress" class="form-control"
								id='rec_address' onchange='checkaddress()' /><span
							id=addresscheck style="font-weight: bold;"></span></td>
					</tr>
					<tr>
						<td style="font-color: #804040; font-weight: bold;"><form:label
								path="receiverEmail">信箱：</form:label></td>
						<td><form:input path="receiverEmail" class="form-control"
								id='rec_email' onchange='checkemail()' /><span id=emailcheck
							style="font-weight: bold;"></span></td>
					</tr>
					<tr>
						<td style="font-color: #804040; font-weight: bold;"><form:label
								path="receiverNote">備註：</form:label></td>
						<td><form:input path="receiverNote" class="form-control"
								id='rec_note' /></td>
					</tr>
					<tr>
						<td colspan="2"><form:button value="Send" id="sendOrderBtn"
								onclick="retrievePerchaseAmount()"
								class='btn btn-primary px-5 py-3 mt-3'>確認送出訂單</form:button></td>
					</tr>
				</table>
			</form:form>

			<div>
				<span><input
					style="position: absolute; right: 0; margin-right: 50px;"
					class="btn py-3 px-4 btn-primary" type="button" value="DEMO"
					onclick="cartkey()"></span>
			</div>
		</div>

	</section>

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>
	<script src="../js/ShoppingCartPage.js" type="text/javascript"></script>

</body>
</html>
