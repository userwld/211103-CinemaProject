

function questionCheckStep(){	
	 if($("#division").val() == "0"){
		  $("#inputCheck").text("분류를 선택해주세요.");
		  return false;
		}
	
	 if($("#title").val() == "" ||  $("#content").val() == ""){
		 $("#inputCheck").text("모든 항목을 채워주세요.");
		  return false;
		}
		
	 $("#inputCheck").text("");
	 return true;
}	

function questionWriteStep(){
	var check = questionCheckStep();
	if(check == true) document.getElementById("questionForm").submit();
}


