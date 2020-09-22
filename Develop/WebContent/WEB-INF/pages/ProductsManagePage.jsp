<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsetting.jsp"%>
<title>Product Manage</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="header.jsp"%>

	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Product</span>
					<h2 class="mb-4">Product Management</h2>
					<p>You can add, remove and edit product here.</p>
				</div>
			</div>
			<div class="ftco-schedule">
				<p style="text-align: right;">
					<a href="/WeMatch_dev/product/addProduct"
						class="btn btn-primary px-5 py-3 mt-3">新增</a>
				</p>
				<div class="row">
					<div class="col-md-4 nav-link-wrap">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link ftco-animate active" id="v-pills-8-tab"
								data-toggle="pill" href="#v-pills-8" role="tab"
								aria-controls="v-pills-8" aria-selected="true">Massage <span>Massager,
									Fascia gun...</span></a> <a class="nav-link ftco-animate"
								id="v-pills-9-tab" data-toggle="pill" href="#v-pills-9"
								role="tab" aria-controls="v-pills-9" aria-selected="false">Yoga
								<span>Mat, Roller...</span>
							</a> <a class="nav-link ftco-animate" id="v-pills-10-tab"
								data-toggle="pill" href="#v-pills-10" role="tab"
								aria-controls="v-pills-10" aria-selected="false">Supplement
								<span>Protein, Vitamin...</span>
							</a>
						</div>
						<p style="text-align: center;">
							<a href="/WeMatch_dev/product/browse"
								class="btn btn-primary px-5 py-3 mt-3">Browse</a>
						</p>
					</div>
					<div class="col-md-8 tab-wrap">
						<div class="tab-content" id="v-pills-tabContent">

							<div class="tab-pane fade show active" id="v-pills-8"
								role="tabpanel" aria-labelledby="day-8-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentMassager" class="productTable"></table>
								</div>
								<div id="pageMassager" class="text-center"></div>
							</div>

							<div class="tab-pane fade" id="v-pills-9" role="tabpanel"
								aria-labelledby="v-pills-day-9-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentYoga" class="productTable"></table>
								</div>
								<div id="pageYoga" class="text-center"></div>
							</div>

							<div class="tab-pane fade" id="v-pills-10" role="tabpanel"
								aria-labelledby="v-pills-day-10-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">
									<!--Show Products & Page-->
									<table id="contentSupplement" class="productTable"></table>
								</div>
								<div id="pageSupplement" class="text-center"></div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	<%@ include file="JSsetting.jsp"%>
	<script src="../js/ProductManagePage.js" type="text/javascript"></script>

</body>
</html>