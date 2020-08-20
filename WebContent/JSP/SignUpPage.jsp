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
				<label for="memberPwd">密碼 *</label> <input type="password"
					class="form-control" name="memberPwd" required="required"
					placeholder="20個字母、數字、特殊符號混合字元以內" maxlength="20">
			</div>
			<div class="form-group">
				<label for="confirmMemberPwd">確認密碼 *</label> <input type="password"
					class="form-control" name="confirmMemberPwd" required="required"
					placeholder="20個字母、數字、特殊符號混合字元以內" maxlength="20">
			</div>
			<div class="form-group">
				<label for="memberName">姓名 *</label> <input type="text"
					class="form-control" name="memberName" required="required"
					maxlength="20" autocomplete="on">
			</div>
			<div class="form-group">
				<label for="nickname">暱稱</label> <input type="text"
					class="form-control" name="nickname" required="required"
					maxlength="20" autocomplete="on">
			</div>
			<div class="form-group">
				<label for="memberEmail">電子郵件 *</label> <input type="email"
					class="form-control" name="memberEmail">
			</div>
			<div class="form-group">
				<label for="birthday">生日 *</label> <input type="date"
					name="birthday">
			</div>
			<div class="form-group">
				<label for="gender">性別 *</label><br /> <select name="gender"
					required="required">
					<option value="M">男生</option>
					<option value="F">女生</option>
					<option value="O">其他</option>
				</select>
			</div>
			<div class="form-group">
				<label for="city">城市 *</label><br /> <select name="city"
					required="required">
					<option value="KLU">基隆市</option>
					<option value="TPH">新北市</option>
					<option value="TPE">臺北市</option>
					<option value="TYC">桃園市</option>
					<option value="HSH">新竹縣</option>
					<option value="HSC">新竹市</option>
					<option value="MAC">苗栗市</option>
					<option value="MAL">苗栗縣</option>
					<option value="TXG">臺中市</option>
					<option value="CWH">彰化縣</option>
					<option value="CWS">彰化市</option>
					<option value="NTC">南投市</option>
					<option value="NTO">南投縣</option>
					<option value="YLH">雲林縣</option>
					<option value="CHY">嘉義縣</option>
					<option value="CYI">嘉義市</option>
					<option value="TNN">臺南市</option>
					<option value="KHH">高雄市</option>
					<option value="IUH">屏東縣</option>
					<option value="PTS">屏東市</option>
					<option value="ILN">宜蘭縣</option>
					<option value="ILC">宜蘭市</option>
					<option value="HWA">花蓮縣</option>
					<option value="HWC">花蓮市</option>
					<option value="TTC">臺東市</option>
					<option value="TTT">臺東縣</option>
					<option value="PEH">澎湖縣</option>
					<option value="KMN">金門縣</option>
					<option value="LNN">連江縣</option>
				</select>
			</div>
			<div class="form-group">
				<label for="starSign">星座</label><br /> <select name="starSign">
					<option value="ARI">白羊座</option>
					<option value="TAU">金牛座</option>
					<option value="GEM">雙子座</option>
					<option value="CNC">巨蟹座</option>
					<option value="LEO">獅子座</option>
					<option value="VIR">處女座</option>
					<option value="LIB">天秤座</option>
					<option value="SCO">天蠍座</option>
					<option value="SGR">射手座</option>
					<option value="CAP">摩羯座</option>
					<option value="AGR">水瓶座</option>
					<option value="PSC">雙魚座</option>
				</select>
			</div>
			<div class="form-group">
				<label for="bloodType">血型</label><br /> <select name="bloodType">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="AB">AB</option>
					<option value="O">O</option>
					<option value="Other" selected="selected">Other</option>
				</select>
			</div>
			<div class="form-group">
				<label for="hobbies">興趣</label><br /> <label for="movie"> <input
					type="checkbox" name="hobbies" id="movie" value="movie">電影
				</label> <label for="sport"> <input type="checkbox" name="hobbies"
					id="sport" value="sport">運動
				</label> <label for="reading"> <input type="checkbox" name="hobbies"
					id="reading" value="reading">閱讀
				</label> <label for="shopping"> <input type="checkbox"
					name="hobbies" id="shopping" value="shopping">逛街
				</label> <label for="hiking"> <input type="checkbox" name="hobbies"
					id="hiking" value="hiking">踏青
				</label> <label for="travel"> <input type="checkbox" name="hobbies"
					id="travel" value="travel">旅遊
				</label>
			</div>
			<div class="form-group">
				<label for="selfIntro">自我介紹</label>
				<textarea name="selfIntro" cols="30" rows="10" class="form-control"></textarea>
			</div>
			<div class="form-group">
				<label for="uploadPics">Upload Your Beautiful Pictures:</label> <input
					type="file" name="uploadPics" multiple>
			</div>

			<div class="form-group">
				<input type="submit" value="註冊" class="btn py-3 px-4 btn-primary">
			</div>

		</form>
	</div>

</body>
</html>