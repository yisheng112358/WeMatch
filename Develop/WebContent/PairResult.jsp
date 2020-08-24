<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>PAIRS RESULT</title>
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

.button {
	display: inline-block;
	padding: 15px 25px;
	font-size: 24px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #4CAF50;
	border: none;
	border-radius: 15px;
	box-shadow: 0 9px #999;
	font-family: 微軟正黑體;
}

.button:hover {
	background-color: #3e8e41
}

.button:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}
</style>

</head>
<body>
	<%
		String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>

	<%-- <base href="<%=basePath%>"> --%>


	<%-- <img src="${pageContext.request.contextPath }"><br/> --%>
	<h1>配對結果</h1>
	<div>
		你的天選之人:${Name[0]}<br /> <img
			src="${pageContext.request.contextPath}/temp/10.jpg"> <img
			src="${pageContext.request.contextPath}/temp/100.jpg"> <br />
		<br />

	</div>

	<div>
		你的天選之人:${Name[1]}<br /> <img
			src="${pageContext.request.contextPath}/temp/20.jpg"> <img
			src="${pageContext.request.contextPath}/temp/200.jpg"> <br />
		<br />

	</div>

	<div>
		你的天選之人3:${Name[2]}<br /> <img
			src="${pageContext.request.contextPath}/temp/30.jpg"> <img
			src="${pageContext.request.contextPath}/temp/300.jpg"> <br />
		<br />

	</div>
	<div>
		你的天選之人4:${Name[3]}<br /> <img
			src="${pageContext.request.contextPath}/temp/40.jpg"> <img
			src="${pageContext.request.contextPath}/temp/400.jpg"> <br />
		<br />

	</div>
	<div>
		<%-- 		你的天選之人5:${Name[4]}<br /> --%>
	</div>
</body>



<div style="background-color: #ffffff">
	<input class="button" type="button" onclick="history.back() "
		value="回到配對首頁"></input>
</div>
</html>