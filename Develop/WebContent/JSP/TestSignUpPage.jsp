<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帳號註冊</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<div class="comment-form-wrap pt-5">
		<h3 class="mb-5">帳號註冊</h3>
		<form action="../SignUpJdbcConnServlet.do" method="post" enctype="multipart/form-data" class="p-5 bg-light">
			<div class="form-group">
				<label for="memberAccount">帳號 *</label> <input type="text"
					class="form-control" name="memberAccount" required="required"
					placeholder="20個字母、數字混合字元以內" maxlength="20" autocomplete="on">
			</div>

			<div class="form-group">
				<input type="submit" value="註冊" class="btn py-3 px-4 btn-primary">
			</div>

		</form>
	</div>

	<!-- 	<h2>Sign Up</h2> -->
	<!-- 	<form action="../SignUpJdbcConnServlet.do" method="post"> -->
	<!-- 		<p> -->
	<!-- 			Name:<input type="text" name="userName" /><br /> Address:<input -->
	<!-- 				type="text" name="userAddress" /><br /> Phone:<input type="text" -->
	<!-- 				name="userPhone" /><br /> -->
	<!-- 		</p> -->
	<!-- 		<input type="submit" value="Save" /> -->
	<!-- 	</form> -->
</body>
</html>