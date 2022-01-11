

/* 회원탈퇴페이지에서 확인버튼 클릭시 */
function deleteStep(){
	var deleteCheck = document.getElementById('deleteCheck').checked;
	
	if(deleteCheck == false){
		document.getElementById('deleteConfirm').innerHTML = "동의가 필요합니다.";
	}else{
		document.getElementById('deleteConfirm').innerHTML = "";
		if(confirm('정말 탈퇴하시겠습니까?')){
			document.getElementById('deleteForm').submit();
		}
	}
}

function myLikeCalc(n){
	var info = {movieListNum : n};
	
	$.ajax({		
			url: "likeCalcProc", type: "POST",		
			data: JSON.stringify(info), 			
			contentType: "application/json; charset=utf-8", 	
			dataType: "json", 
		
			success : function(result){		
				alert(result.msg);
				if(result.msg != '로그인 후 이용가능합니다.'){
					location.reload();
				}
			},
			error : function(){
				alert('통신실패');
			}
	})	
}


