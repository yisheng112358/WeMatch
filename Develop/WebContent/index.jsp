<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	本頁為暫時模擬會員系統登入情形，最終仍需刪掉以正式會員系統為主。
	<%
	session.setAttribute("memberStatus", "visitor");
String memberStatus = (String) session.getAttribute("memberStatus");
if (memberStatus.equals("member") || memberStatus.equals("bms")) {
	out.write(
	"<li class='nav-item'><a href='/WeMatch_dev/product/logout' class='nav-link'><span>Login</span></a></li>");
} else {
	out.write("<li class='nav-item'><a href='/WeMatch_dev/product/login' class='nav-link'><span>Login</span></a></li>");
}
%>
</body>
</html>