<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>Video Check In</title>
<%@ include file="CSSsettingout.jsp"%>
<style>
.notice {
	color: #ff0000;
	font-size: small;
}
</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	​​​​​​​
	<%@ include file="headerout.jsp"%>

	<section class="ftco-section ftco-schedule" id="schedule-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Videoflix Check In</span>
					<h2 class="mb-4">New Training Video</h2>
					<p>More training, more video.</p>
				</div>
			</div>
			<div class="ftco-schedule">
				<div class="row">
					<div class="col-md-4 nav-link-wrap">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link ftco-animate active" id="v-pills-8-tab"
								data-toggle="pill" href="#v-pills-8" role="tab"
								aria-controls="v-pills-8" aria-selected="true">Video
								Check-in <span>Aloha, new training video!!</span>
							</a>

						</div>
					</div>
					<div class="col-md-8 tab-wrap">

						<div class="tab-content" id="v-pills-tabContent">

							<div class="tab-pane fade show active" id="v-pills-8"
								role="tabpanel" aria-labelledby="day-8-tab">
								<div class="coach-wrap ftco-animate d-sm-flex">

									<!--Video Check In Form -->
									<form action="AdminVideoServlet.do" method="get"
										enctype="multipart/form-data" class="p-5 bg-light"
										style="position: relative; border: 1px solid black;">
										<div class="form-group">
											<label for="videoName">影片主題</label> <span id="namesp"
												class="notice"></span><br /> <input type="text" id="name1"
												class="form-control" name="videoName" required="required"
												autocomplete="on">
										</div>
										<div class="form-group">
											<label for="videoCategory">影片類別</label><br /> <select
												name="videoCategory">
												<option value="bodyback">背部肌群訓練</option>
												<option value="bodychest">胸部肌群訓練</option>
												<option value="bodyleg">腿部肌群訓練</option>
											</select>
										</div>
										<div class="form-group">
											<label for="videoLink">影片連結</label> <span id="linksp"
												class="notice"></span><br /> <input type="text" id="link1"
												class="form-control" name="videoLink" required="required"
												autocomplete="on">
										</div>
										<div class="form-group">
											<label for="videoDesc">影片簡述</label> <span id="linksp"
												class="notice"></span><br />
											<!-- 												<input type="text" id="desc1" class="form-control" name="videoDesc"  -->
											<!-- 												required="required"	autocomplete="on"> -->
											<textarea name="videoDesc" required="required"
												style="width: 550px; height: 120px;"></textarea>
										</div>

										<div class="form-group">
											<input type="submit" value="確認"
												class="btn py-3 px-4 btn-primary">
										</div>
									</form>
								</div>
								<div></div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footerout.jsp"%>
	<%@ include file="JSsettingout.jsp"%>

</body>
</html>