<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="CSSsetting.jsp"%>
<title>Product</title>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="header.jsp"%>

	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Product</span>
					<h2 class="mb-4">Training Product</h2>
					<p>You go far, we help you go further.</p>
				</div>
			</div>
			<div>
				<div class="sidebar-box">
					<form action="#" class="search-form">
						<div class="form-group">
							<span class="icon icon-search"></span> <input type="text"
								class="form-control" placeholder="Type a keyword and hit enter">
						</div>
					</form>
				</div>
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
						<%
							if (memberStatus.equals("2")) {
							out.write(
							"<p style='text-align: center;'><a href='/WeMatch_dev/product/manage' class='btn btn-primary px-5 py-3 mt-3'>Manage</a></p>");
						}
						%>
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
	<script src="../js/ProductBrowserPage.js" type="text/javascript"></script>

</body>
</html>
