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