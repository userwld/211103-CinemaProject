

/* 약관동의 - 전체선택 체크박스 체크시 전체선택/해제 */
function checkAll(){	
	var checkAll = document.getElementById("chk_all").checked;
	var check = document.getElementsByName("check");
	
	if(checkAll === true){
		for(var i=0; i< check.length; i++){
			check[i].checked = true;
		}
	}else{
		for(var i=0; i< check.length; i++){
			check[i].checked = false;
		}
	}
}

/* 약관동의 - 전체선택 누른다음 개별체크박스 해제시 -> 전체선택해제구현 */
function agreeChk(){	
	var check = document.getElementsByName("check");
	var checkAll = document.getElementById("chk_all");
		
	for(var i=0; i<check.length;i++){
		if(check[i].checked == false){
			checkAll.checked = false;
			break;
		}
	}
}

/* 약관동의 - 확인버튼 클릭시 > 약관동의여부 확인후 모두 동의시에만 페이지 이동 */
function nextStep1(){
	var agreeArr = [];
	$("input[name='check']:checked").each(function(){
		agreeArr.push($(this).val());
	})
	var data = {"agree" : agreeArr};
		
	$.ajax({		
		url: "agreeCheck", type: "POST",		
		data: JSON.stringify(data), 			
		contentType: "application/json; charset=utf-8", 	
		dataType: "json", 
	
		success : function(result){		
			$('.agree_chk').text(result.msg);
			if(result.msg == ''){
				document.getElementById('agreeForm').submit();	
			}		
		},
		error : function(){
			$('.agree_chk').text('error');
		}
	})
}

/* 키보드 입력시 숫자 형식인지 확인 */
function numberChk(){
	authNum = document.getElementById('authNum').value;
	var reg = /([^0-9])/;
	if(authNum.match(reg) != null){
		document.getElementById('authLabel').innerHTML = "인증번호는 숫자만 가능합니다.";
		authNum = "";
	}else{
		document.getElementById('authLabel').innerHTML = "";
	}
}

/* 이메일 인증 */
function sendAuth(){		
	var e = document.getElementById("email").value;
	var n = document.getElementById("name").value;
	var info = {email : e, name: n};
	
	$.ajax({		
		url: "sendAuth", type: "POST",		
		data: JSON.stringify(info), 			
		contentType: "application/json; charset=utf-8", 	
		dataType: "json", 
	
		success : function(result){		
			$('#authLabel').text(result.msg);	

		},
		error : function(){
			$('#authLabel').text('error');
		}
	})	
}

function authConfirm(){		
	var a = document.getElementById("authNum").value;
	var info = {authNum : a};
	
	$.ajax({		
		url: "authConfirm", type: "POST",		
		data: JSON.stringify(info), 			
		contentType: "application/json; charset=utf-8", 	
		dataType: "json", 
	
		success : function(result){		// 인증 성공시 이름과 이메일주소 -readonly, 메일발송, 인증버튼 disabled
			$('#authLabel').text(result.msg);	
			if(result.msg =="인증 성공"){
				$('#name').prop('readonly', true); 
				$('#email').prop('readonly', true); 
				$('#sendMailBtn').attr('disabled', true);	
				$('#authBtn').attr('disabled', true);	
			}
	
		},
		error : function(){
			$('#authLabel').text('error');
		}
	})	
}


/* 이메일인증 - 확인버튼 클릭시 */
function nextStep2(){
	
	var e = document.getElementById("email").value;
	var n = document.getElementById("name").value;
	
	var info = {email : e, name: n};
	
	$.ajax({		
		url: "authProc", type: "POST",		
		data: JSON.stringify(info), 			
		contentType: "application/json; charset=utf-8", 	
		dataType: "json", 
	
		success : function(result){		
			$('#authLabel').text(result.msg);	
			if(result.msg =="인증 성공"){
				document.getElementById('authForm').submit();	
			}else{
				$('#name').prop('readonly', false); 
				$('#email').prop('readonly', false); 
				$('#sendMailBtn').attr('disabled', false);	
				$('#authBtn').attr('disabled', false);	
			}
	
		},
		error : function(){
			$('#authLabel').text('error');
		}
	})	
	
}

/* 아이디 중복확인 */

function isExistId(){
	var i = document.getElementById("id").value;		
	var info = {id : i};
	var check = false;
	
	$.ajax({		
		url: "isExistId", type: "POST",		
		data: JSON.stringify(info), 			
		contentType: "application/json; charset=utf-8", 	
		dataType: "json", 
		async:false,
	
		success : function(result){		
			$('#idLabel').text(result.msg);	
			if(result.msg == "사용 가능한 아이디 입니다."){
				check = true;
				$('#id').prop('readonly', true);
				$('#authId').val("yes");
			}else{
				check = false;
			}

		},
		error : function(){
			$('#idLabel').text('error');
		}
	})	

	return check;
}

/* 회원정보입력 페이지 - 우편번호 */
function daumPost(){		
	new daum.Postcode({
		oncomplete:function(data){	
			var addr = "";
			if(data.userSelectedType === "R"){	
				addr = data.roadAddress;
			}else{	
				addr = data.jibunAddress;
			}

			$('#zipcode').val(data.zonecode);			
			$('#addr1').val(addr);
			$('#addr2').focus();
		}
	}).open();
}


/* 비밀번호 유효성 */
function pwCheck(){
	var pw = document.getElementById("pw").value;
	var reg = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z\d-_!@#$%^&*?]{8,16}$/;
	
	if(!reg.test(pw)){		
		$('#pwLabel').text("영문자+숫자 조합 / 특수문자는 -_!@#$%^&*?만 가능합니다.(8~16자)");		
		return false;
	}else{
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
	}else{
		$('#pwChkLabel').text("");	
		return true;
	}	
	
}

/* 생년월일, 나이(만 14세이하 가입불가) */
function birthCheck(){
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;
	var day = document.getElementById("day").value;
	
	if(month == "" || day == ""){
		$('#birthLabel').text("생년월일을 입력해주세요.");	
         return false;
	}
	
	if(month > 12 || month < 0){
		$('#birthLabel').text("생년월일을 다시 확인해주세요.");	
         return false;
	}
	
 	var maxDaysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
    var maxDay = maxDaysInMonth[month - 1];
	if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {	
        maxDay = 29;
    }
	
  	if (day > maxDay) {
		$('#birthLabel').text("생년월일을 다시 확인해주세요.");	
         return false;
    }
  	
  	birthday = year+month+day;
  	var age = calcAge(birthday);
  	
  	if(age < 14){
  		$('#birthLabel').text("만 14세 미만은 가입이 불가능합니다.");
  		return false;
  	}else{
  		$('#birthLabel').text("");
  		return true;
  	}
}

function calcAge(birth){
	 var date = new Date();
     var year = date.getFullYear();
     var month = (date.getMonth() + 1);
     var day = date.getDate();
     if (month < 10) month = '0' + month;
     if (day < 10) day = '0' + day;
     
     var monthDay = month + '' + day;

     var birthdayy = birth.substr(0, 4);
     var birthdaymd = birth.substr(4, 4);

     var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;	
     return age;
}

/* 핸드폰 번호 확인  */
function phoneCheck(){	
	var phone1 = document.getElementById("phone1").value;
	var phone2 = document.getElementById("phone2").value;
	var phone3 = document.getElementById("phone3").value;
	
	var phone2Reg = /\d{3,4}$/;
	var phone3Reg = /\d{4}$/;
	
	if(phone1 == "" || phone2 == "" || phone3 == "" ){
		$('#phoneLabel').text("휴대폰 번호를 입력해주세요.");
		return false;
	}
	
	if(!phone2Reg.test(phone2) || !phone3Reg.test(phone3)){
		$('#phoneLabel').text("휴대폰 번호가 올바르지 않습니다.");
		return false;
	}else{
		$('#phoneLabel').text("");
		return true;
	}
		
}
/* 주소 비어있는지 확인 */
function addrCheck(){
	var z = document.getElementById("zipcode").value;
	var a1 = document.getElementById("addr1").value;
	var a2 = document.getElementById("addr2").value;
	
	if(z == "" || a1 == "" || a2 == ""){
		$('#addrLabel').text("주소를 입력해주세요.");
		return false;
	}else{
		$('#addrLabel').text("");
		return true;
	}
}

/* 모든 입력값 최종 검증 후 가입 */
function registerStep(){
	var idchk = isExistId();
	var pwchk = pwCheck();
	var pwcon = pwConfirm();
	var birchk = birthCheck();
	var phchk = phoneCheck();
	var addchk = addrCheck();
	
	if($("#authId").val() == "no"){
		$('#idLabel').text("아이디 중복확인을 해주세요.");
		return;
	}		
	if(idchk == false || pwchk == false || pwcon == false || birchk == false ||
		phchk == false || addchk == false){
		$('#totalLabel').text("모든 항목을 통과해야합니다.");
	}else{
		$('#totalLabel').text("");
		var form = $("#registerForm").serialize();
			
		$.ajax({		
			url: "registerProc", type: "POST",		
			data: form, 			 	
			dataType: "json", 
		
			success : function(result){		
				if(result.msg == '회원가입 성공'){
					location.href='index';
				}else{
					$('#totalLabel').text(result.msg);	
				}
			},
			error : function(){
				$('#totalLabel').text('error');
			}
		})	
	}
}

/* 정보수정페이지에서 확인버튼 클릭시 */
function modifyStep(){
		
	var pwchk = pwCheck();
	var pwcon = pwConfirm();
	var phchk = phoneCheck();
	var addchk = addrCheck();
		
	if( pwchk == false || pwcon == false || phchk == false || addchk == false){
		$('#totalLabel').text("모든 항목을 통과해야합니다.");
		
	}else{
		$('#totalLabel').text("");
		var form = $("#modifyForm").serialize();
		
		$.ajax({		
			url: "modifyProc", type: "POST",		
			data: form, 			 	
			dataType: "json", 
		
			success : function(result){		
				$('#totalLabel').text(result.msg);
				if(result.msg == '수정완료! 3초 후 로그아웃 됩니다.'){
					setTimeout(function (){
						location.href='logoutRequest';
					}, 3000);
				}
			},
			error : function(){
				$('#totalLabel').text("error");
			}
		})		
	}


	

}

