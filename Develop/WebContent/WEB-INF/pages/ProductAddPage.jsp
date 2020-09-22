<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsetting.jsp"%>
<title>Product Add</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="header.jsp"%>

	<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
		id="about-section">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-6 col-lg-5 d-flex">
					<div class="img d-flex align-self-stretch align-items-center"
						style="background-image: url(../images/bg_1.jpg);"></div>
				</div>
				<div class="comment-form-wrap pt-5">
					<h3 class="mb-5">新增產品</h3>
					<form action="<c:url value='/product/addProduct' />" method="post"
						enctype="multipart/form-data" class="p-5 bg-light"
						style="position: relative; border: 1px solid;"
						onsubmit="return checkBeforeSubmit();">
						<div id="memo">*欄位為必填</div>
						<div class="form-group">
							<label for="categorySelect">產品類別 *</label><br /> <select
								name="category" id="categorySelectId" required="required">
								<option value="Massager">Massager</option>
								<option value="Yoga">Yoga</option>
								<option value="Supplement">Supplement</option>
							</select>
						</div>
						<div class="form-group">
							<label for="productName">產品名稱 *</label> <span id="productSp"
								class="notice"></span><br /> <input type="text"
								id="productNameId" class="form-control" name="productName"
								required="required" placeholder="最多20個字元" maxlength="20"
								autocomplete="on" onblur="checkProductName()">
						</div>
						<div class="form-group">
							<label for=productPrice>產品價格 *</label> <span id="productSp"
								class="notice"></span><br /> <input type="text"
								id="productPriceId" class="form-control" name="price"
								required="required" placeholder="最多6位數" maxlength="6"
								onblur="checkProductPrice()">
						</div>
						<div class="form-group">
							<label for="productStock">庫存 *</label> <span id="stockSp"
								class="notice"></span><br /> <input type="text"
								id="productStockId" class="form-control" name="stock"
								required="required" onblur="checkProductStock()">
						</div>
						<div class="form-group">
							<label for="productDescription">產品介紹</label>
							<textarea name="productDescription" id="productDescriptionId"
								cols="30" rows="10" class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label for="thumbnail">產品縮圖</label> <input type="file"
								accept=".jpg, .jpeg, .png" name="thumbnail" id="thumbnailId">
						</div>
						<div id="thumbnailDisplay" style="width: 200px; height: 200px;">
							<img src="" id="thumbnailPreview" height="200"
								alt="Image preview...">
						</div>
						<div class="form-group">
							<label for="detailImg">產品詳圖</label> <input type="file"
								accept=".jpg, .jpeg, .png" name="detailImg" id="detailImgId">
						</div>
						<div id="detailImgDisplay" style="width: 200px; height: 200px;">
							<img src="" id="detailImgPreview" height="200"
								alt="Image preview...">
						</div>
						<div class="form-group">
							<input id='btn' type="submit" value="送出"
								class="btn py-3 px-4 btn-primary">
						</div>
					</form>
					<div style="text-align: right;">
						<a href="/WeMatch_dev/product/manage"
							class="btn btn-primary px-5 py-3 mt-3">返回</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>

	<script src="../js/ProductAddPage.js" type="text/javascript"></script>

</body>
</html>