<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<script>
	//=========第一個商品============
	$(function() {
		var t1 = $("#quantity1");
		$("#add1").click(function() {
			t1.val(parseInt(t1.val()) + 1);
			$("#min1").removeAttr("disabled"); //當按加1時，解除$("#min")不可讀狀態
			setTotal1();
		})
		$("#min1").click(function() {
			if (parseInt(t1.val()) > 1) { //判斷數量值大於1時才可以減少
				t1.val(parseInt(t1.val()) - 1)
			} else {
				$("#min1").attr("disabled", "disabled") //當$("#min")為1時，$("#min")不可讀狀態
			}
			setTotal1();
		})
		function setTotal1() {
			$("#total1").html((parseInt(t1.val()) * 299).toFixed(2));
		}
		setTotal1();
	})

	//=========第二個商品============
	$(function() {
		var t2 = $("#quantity2");
		$("#add2").click(function() {
			t2.val(parseInt(t2.val()) + 1);
			$("#min2").removeAttr("disabled"); //當按加1時，解除$("#min")不可讀狀態
			setTotal2();
		})
		$("#min2").click(function() {
			if (parseInt(t2.val()) > 1) { //判斷數量值大於1時才可以減少
				t2.val(parseInt(t2.val()) - 1)
			} else {
				$("#min2").attr("disabled", "disabled") //當$("#min")為1時，$("#min")不可讀狀態
			}
			setTotal2();
		})
		function setTotal2() {
			$("#total2").html((parseInt(t2.val()) * 1000).toFixed(2));
		}
		setTotal2();
	})
	
	
	
	
	$(function(){
		var finaltotal=$("#total1").html+$("#total2").htm2;

		}
			)
</script>
</head>
<body>

	<!-- =================================================== -->
	<!-- =================頁面程式碼======================== -->
	<!-- =================================================== -->


	<h1 style="text-align: center;">商品清單</h1>
	<hr>
	<!-- //=========第一個商品============ -->
	<div>
		<h4>3D massager 鑽石按摩儀</h4>
		<br /> 價錢：299 <br />

		<form action="xxxxxxx" method="post" id="bookingNumber1">
			    <input type="button" name="???" id="productName" value="詳細資訊"></input><br /> 
			    <input type="button" id="Pid1" name="Pid1" value="加入購物車"  ></input><br /> 
				<input id="min1" name="" type="button" value="-" /> 
				<input id="quantity1" type="text"  value="1" /> 
				<input id="add1" name="" type="button" value="+" />
			<p>
				總價：<label id="total1"></label>
			</p>
			
			<input type="button" id="test1" value="test"/>

		</form>
	</div>
	<hr>


	<!-- //=========第二個商品============ -->
	<div>
		<h4>Roller Massager</h4>
		<br /> 價錢：1000 <br />

		<form action="xxxxxxx" method="post" id="bookingNumber2">
			<input type="button" name="???" value="詳細資訊"></input><br /> <input
				type="button" id="Pid2" name="Pid2" value="加入購物車"></input><br /> <input
				id="min2" name="" type="button" value="-" /> <input id="quantity2"
				type="text" value="1" /> <input id="add2" name="" type="button"
				value="+" />
			<p>
				總價：<label id="total2"></label>
			</p>

		</form>
	</div>
	
<script src="js/cookie.js"></script>
	<script>

	   <p>
	   總價：<label id="finaltotal"></label>
	   </p>	

		
		$("#Pid1").click(function(){
			add($('#productName'),$("#quantity1").val());
})


		
	</script>

	<hr>
</body>
</html>