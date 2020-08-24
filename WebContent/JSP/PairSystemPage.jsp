<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAIR SYSTEM</title>
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
div {
	text-align: center;
	font-family: 微軟正黑體;
	background-color: #E6E6F2;
	font-size: 2em;
	border: 3px solid white;
	border-radius: 40px;
}

h1 {
	text-align: center;
	font-family: 微軟正黑體;
}

hr {
	background-color: #E6E6F2
}
</style>
</head>
<body>
	<h1>輸入期望對象的條件</h1>
	<form action="../PairSystem" method="post">
		<div style="font-size: normal">
			<br /> 📝血型 : <input type="text" name="bloodType"
				placeholder="A/B/AB/O [測試→A]" /><br /> <br /> 🚻性別 : <input
				type="text" name="gender" placeholder="M/F/Other [測試→M]" /><br />
			<br /> 🛵城市 : <input type="text" name="city"
				placeholder="KLU/TPE... [測試→KLU]" /><br /> <br /> ⭐星座 : <input
				type="text" name="star_sign" placeholder="ARI/SGR... [測試→ARI]" /><br />
			<br />


		</div>
		<div style="background-color: #ffffff">
			<input class="btn py-3 px-4 btn-primary" type="submit" value="Send" />

		</div>
	</form>
</body>
</html>