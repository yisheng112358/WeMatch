<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帳號註冊</title>
<link rel="stylesheet" href="../css/style.css">
<style>
.notice {
	color: #ff0000;
	font-size: small;
}

body {
	margin-left: 50px;
	margin-right: 50px;
	margin-bottom: 50px;
}

#memo {
	position: absolute;
	right: 0;
	color: #ff0000;
	font-size: small;
	text-align: right;
	padding-right: 50px;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<div class="comment-form-wrap pt-5">
		<h3 class="mb-5">帳號註冊</h3>
		<form action="../SignUpJdbcConnServlet.do" method="post"
			enctype="multipart/form-data" class="p-5 bg-light"
			style="position: relative; border: 1px solid;">
			<div id="memo">*為必填</div>
			<div class="form-group">
				<label for="memberAccount">帳號 *</label> <span id="accountsp"
					class="notice"></span><br /> <input type="text" id="account1"
					class="form-control" name="memberAccount" required="required"
					placeholder="請輸入少8個字字母、數字混合字元以內且不可空白(至多20個)" maxlength="20"
					autocomplete="on" onblur="checkAccount()">
			</div>
			<div class="form-group">
				<label for="memberPwd">密碼 *</label> <span id="pwdsp" class="notice"></span><br />
				<input type="password" id="pwd1" class="form-control"
					name="memberPwd" required="required"
					placeholder="請輸入至少8個字且須包含字母、數字、特殊符號混合字元及不可空白(至多20個)" maxlength="20"
					onblur="checkPwd()">
			</div>
			<div class="form-group">
				<label for="confirmMemberPwd">確認密碼 *</label> <span id="repwdsp"
					class="notice"></span><br /> <input type="password" id="repwd1"
					class="form-control" name="confirmMemberPwd" required="required"
					onblur="checkRepwd()">
			</div>
			<div class="form-group">
				<label for="memberName">姓名 *</label> <span id="namesp"
					class="notice"></span><br /> <input type="text" id="name1"
					class="form-control" name="memberName" required="required"
					placeholder="請輸入2個字以上中文且不可空白,例:小奕(至多20個)" maxlength="20"
					autocomplete="on" onblur="checkName()">
			</div>
			<div class="form-group">
				<label for="nickname">暱稱*</label> <span id="nicksp" class="notice"></span><br />
				<input type="text" id="nick1" class="form-control" name="nickname"
					required="required" maxlength="20" autocomplete="on"
					onblur="checkNick()">
			</div>
			<div class="form-group">
				<label for="memberEmail">電子郵件 *</label> <span id="mailsp"
					class="notice"></span><br /> <input type="email" id="mail1"
					class="form-control" name="memberEmail" onblur="checkMail()">
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
				<label for="starSign">星座*</label><br /> <select name="starSign">
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
				<label for="bloodType">血型*</label><br /> <select name="bloodType">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="AB">AB</option>
					<option value="O">O</option>
					<option value="Other" selected="selected">Other</option>
				</select>
			</div>
			<div class="form-group">
				<label for="hobbies">興趣*</label><br /> <label for="movie">
					<input type="checkbox" name="hobbies" id="movie" value="movie">電影
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

	<script type="text/javascript">
		function checkAccount() {
			let theAccountObj = document.getElementById("account1");
			let theAccountObjVal = theAccountObj.value;
			let theAccountObjValLen = theAccountObjVal.length;
			let flag1 = false, flag2 = false;
			let accountObj = document.getElementById("accountsp");

			if (theAccountObjVal == "") {
				accountObj.innerHTML = "帳號不可空白";
			} else if (theAccountObjValLen < 8) {
				accountObj.innerHTML = "帳號至少8個字";
			} else {
				for (let i = 0; i < theAccountObjValLen; i++) {
					let ch = theAccountObjVal.charAt(i).toUpperCase();
					if (ch >= "A" && ch <= "Z") {
						flag1 = true;
					} else if (ch >= "0" && ch <= "9") {
						flag2 = true;
					}
					if (flag1 && flag2) {
						break;
					}
				}
				if (flag1 && flag2) {
					accountObj.innerHTML = "帳號正確";
				} else {
					accountObj.innerHTML = "帳號格式錯誤";
				}

			}
		}

		function checkPwd() {
			let thePwdObj = document.getElementById("pwd1");
			let thePwdObjVal = thePwdObj.value;
			let thePwdObjValLen = thePwdObjVal.length;
			let flag3 = false, flag4 = false, flag5 = false;
			let pwdObj = document.getElementById("pwdsp");

			if (thePwdObjVal == "") {
				pwdObj.innerHTML = "密碼不可空白";
			} else if (thePwdObjValLen < 8) {
				pwdObj.innerHTML = "密碼至少8個字";
			} else {
				for (let i = 0; i < thePwdObjValLen; i++) {
					let ch = thePwdObjVal.charAt(i).toUpperCase();
					if (ch >= "A" && ch <= "Z") {
						flag3 = true;
					} else if (ch >= "0" && ch <= "9") {
						flag4 = true;
					} else if (ch >= "\u0021" && ch <= "\u0040") {
						flag5 = true;
					}
					if (flag3 && flag4 && flag5) {
						break;
					}
				}
				if (flag3 && flag4 && flag5) {
					pwdObj.innerHTML = "密碼正確";
				} else {
					pwdObj.innerHTML = "密碼格式錯誤";
				}

			}
		}

		function checkRepwd() {
			let theRepwdObj = document.getElementById("repwd1");
			let theRepwdObjVal = theRepwdObj.value;
			console.log(theRepwdObjVal);
			let checkPwdObj = document.getElementById("pwd1");
			let checkPwdObjVal = checkPwdObj.value;
			console.log(checkPwdObjVal);
			let repwdObj = document.getElementById("repwdsp");

			if (theRepwdObjVal == "") {
				repwdObj.innerHTML = "確認密碼不可空白";
			} else if (theRepwdObjVal != "") {
				if (theRepwdObjVal = checkPwdObj) {
					repwdObj.innerHTML = "確認密碼正確";
				} else {
					repwdObj.innerHTML = "確認密碼錯誤";
				}
			}

		}

		function checkName() {
			let theNameObj = document.getElementById("name1");
			let theNameObjVal = theNameObj.value;
			let theNameObjValLen = theNameObjVal.length;
			let flag6 = false;
			let nameObj = document.getElementById("namesp");

			if (theNameObjVal == "") {
				nameObj.innerHTML = "姓名不可空白";
			} else if (theNameObjValLen >= 2) {

				for (let i = 0; i <= theNameObjValLen; i++) {
					let ch1 = theNameObjVal;
					if (ch1 >= "\u4E00" && ch1 <= "\u9FFF")
						flag6 = true;
					break;
				}
				if (flag6)
					nameObj.innerHTML = "姓名正確";
				else
					nameObj.innerHTML = "姓名格式錯誤";
			} else {
				document.getElementById("namesp").innerHTML = "姓名至少2個字";
			}
		}

		function checkNick() {
			let theNickObj = document.getElementById("nick1");
			let theNickObjVal = theNickObj.value;
			let nickObj = document.getElementById("nicksp");

			if (theNickObjVal == "") {
				nickObj.innerHTML = "暱稱不可空白";
			} else {
				nickObj.innerHTML = "暱稱正確";
			}
		}

		function checkMail() {
			let theMailObj = document.getElementById("mail1");
			let theMailObjVal = theMailObj.value;
			let mailObj = document.getElementById("mailsp");

			if (theMailObjVal == "") {
				mailObj.innerHTML = "電子郵件不可空白";
			} else {
				mailObj.innerHTML = " ";
			}
		}
	</script>

</body>
</html>