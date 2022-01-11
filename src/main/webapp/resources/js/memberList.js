function userModifyProc(){
	var pwChk = pwCheck();
	var pwCon = pwConfirm();
	
	if(pwChk == false) {
		alert('사용 불가능한 비밀번호입니다.');
	}
	else if(pwCon == false) {
		alert('비밀번호가 일치하지 않습니다.');
	}
	else {
		document.getElementById('modifyForm').submit();
	}
}

/* 비밀번호 유효성 */
function pwCheck(){
	var pw = document.getElementById("pw").value;
	var reg = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z\d-_!@#$%^&*?]{8,16}$/;
	
	if(!reg.test(pw)){		
		$('#pwLabel').text("영문자+숫자 조합 / 특수문자는 -_!@#$%^&*?만 가능합니다.(8~16자)");		
		return false;
	}
	else{
		$('#pwLabel').text("사용가능한 비밀번호 입니다.");	
		return true;
	}
}

/* 비밀번호 확인 */
function pwConfirm(){	
	var pw = document.getElementById("pw").value;
	var pwChk = document.getElementById("pwChk").value;
	if(pw == ""){
		$('#pwChkLabel').text("비밀번호 확인을 해주세요.");	
		return false;
	}
	
	if(pw != pwChk){
		$('#pwChkLabel').text("비밀번호가 일치하지 않습니다.");	
		return false;
	}
	else{
		$('#pwChkLabel').text("");	
		return true;
	}	
	
}