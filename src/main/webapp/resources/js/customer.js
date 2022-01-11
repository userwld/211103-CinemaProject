
/* 공지사항 작성 - 영화관 직접입력 버튼 클릭시에만 text박스 활성화됨 */
$(document).ready(function(){
    $("input:radio[name=theater]").click(function(){
 
        if($("input[name=theater]:checked").val() == "1"){
            $("input:text[name=self_theater]").attr("disabled",false);
           
        }else if($("input[name=theater]:checked").val() == "0"){
              $("input:text[name=self_theater]").attr("disabled",true);
           
        }
    });
});


/* 글쓰기 작성 눌렀을 때 빈항목 체크 */
function inputCheckStep(){
	 if($("input[name=theater]:checked").val() == "1"){
          if($("input[name=self_theater]").val() == ""){
				$("#inputCheck").text("영화관을 입력해주세요.");
				return false;
			}else{
				$("#inputCheck").text("");
			}
        }else{$("#inputCheck").text("");}
        
     if($("input[name=title]").val() == "" || $("#content").val() == ""){
			$("#inputCheck").text("내용과 제목을 모두 입력해주세요.");
			return false;
	}else{
		$("#inputCheck").text("");
	}
	
	return true;        
}

/* 빈항목 체크 함수 호출 후 빈 항목 없으면 폼전송 */
function noticeWriteStep(){
	var check = inputCheckStep();
	if(check == true) document.getElementById("noticeWriteForm").submit();
}




