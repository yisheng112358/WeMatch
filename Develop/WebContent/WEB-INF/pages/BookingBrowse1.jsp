<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>	


</head>
<body>

	<form action="" method="get" class="p-5 bg-light"
							style="position: relative; border: 1px solid black; text-align: center">
							<table>
								<thead>
									<tr>
										<th>序號</th>
                                        <th>日期</th>
										<th>時間</th>
										<th></th>


					<th> <a href="<c:url value='/bookingcontroller/select'/>">查詢</a> </th> 
<!-- 					<th> <input type="button"  value="查詢" id="checkDB"> </th> -->
					
					
					
									</tr>
								</thead>
								<tbody>
										<tr>
											<td>&nbsp;</td>
										</tr>
									<c:forEach var="film" varStatus="status" items="${films}">
										<tr>
											<td>${status.count}</td>

											<td>${film.bookingDate}</td>
											<td>${film.bookingTime}點鐘</td>

											<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td><a
												href="<c:url value='/bookingcontroller/delete?id=${film.bookingId}' />">刪除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>






    <script src="../js/bookingcheck3.js"></script>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.easing.1.3.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>

	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/scrollax.min.js"></script>

</body>
</html>