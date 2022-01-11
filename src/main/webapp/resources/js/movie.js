function minus_click(i) {
	const result = document.getElementById('num'+i);
	let number = result.innerText;
	number = parseInt(number)-1;
	if(number == -1) number = 0;
	result.innerText = number;
}

function plus_click(i) {
	const result = document.getElementById('num'+i);
	let num1 = parseInt(document.getElementById('num1').innerText);
	let num2 = parseInt(document.getElementById('num2').innerText);
	let num3 = parseInt(document.getElementById('num3').innerText);
	let num4 = parseInt(document.getElementById('num4').innerText);
	
	let number = result.innerText;
	number = parseInt(number)+1;
	if(number ==  9) {
		number = 8;
		alert('예약가능한 인원 수(최대8명)가 초과되었습니다.');
	}
	else if(num1+num2+num3+num4 > 7) {
		number = number-1;
		alert('예약가능한 인원 수(최대8명)가 초과되었습니다.');
	}
	result.innerText = number;
}

function selectAll() {
	var selectAll = document.getElementById("chkSavingTerm").checked;
	var select = document.getElementsByName("select");
	
	if(selectAll === true){
		for(var i=0; i< select.length; i++){
			select[i].checked = true;
		}
	}
	else{
		for(var i=0; i< select.length; i++){
			select[i].checked = false;
		}
	}
}

function agreeChk(){	
	var select = document.getElementsByName("select");
	var selectAll = document.getElementById("chkSavingTerm");
		
	for(var i=0; i<select.length;i++){
		if(select[i].checked == false){
			selectAll.checked = false;
			break;
		}
	}
}

function card_pay() {
	$("#card_chk").css({"border" : "1px solid #000"})
	$("#card_payment").css({"display" : "inline"})
	$("#simple_chk").css({"border" : "1px solid #DDD"})
	$("#simple_payment").css({"display" : "none"})
	
	$("#my_chk").css({"border" : "1px solid #DDD"})
	$("#phone_chk").css({"border" : "1px solid #DDD"})
}

function simple_pay() {
	$("#card_chk").css({"border" : "1px solid #DDD"})
	$("#card_payment").css({"display" : "none"})
	$("#simple_chk").css({"border" : "1px solid #000"})
	$("#simple_payment").css({"display" : "inline"})
	
	$("#my_chk").css({"border" : "1px solid #DDD"})
	$("#phone_chk").css({"border" : "1px solid #DDD"})
}

function my_pay() {
	$("#card_chk").css({"border" : "1px solid #DDD"})
	$("#card_payment").css({"display" : "none"})
	$("#simple_chk").css({"border" : "1px solid #DDD"})
	$("#simple_payment").css({"display" : "none"})
	
	$("#my_chk").css({"border" : "1px solid #000"})
	$("#phone_chk").css({"border" : "1px solid #DDD"})
	
}

function phone_pay() {
	$("#card_chk").css({"border" : "1px solid #DDD"})
	$("#card_payment").css({"display" : "none"})
	$("#simple_chk").css({"border" : "1px solid #DDD"})
	$("#simple_payment").css({"display" : "none"})
	
	$("#my_chk").css({"border" : "1px solid #DDD"})
	$("#phone_chk").css({"border" : "1px solid #000"})
}

function check_button(i){
	for(var j=1;j<=20;j++) {
		$("#chek_btn"+j).css({"border" : "1px solid #DDD"})
	}
	$("#chek_btn"+i).css({"border" : "1px solid #000"})
}

function pay_final_chk() {
	var selectAll = document.getElementById("chkSavingTerm").checked;
	
	if(selectAll === true) {
		location.href='payProc';
	}
	else {
		alert('결제대행서비스 약관에 동의하셔야 구매가 가능합니다.');
		location.href='index?formpath=pay';
	}
}

function movieOpacity(i){
	$(".movieBtn"+i).css({ "background-color" : "rgba( 0,0,0,0.6)"})
	$(".reserve_btn"+i).css({"display" : "inline"})
	$(".detail_btn"+i).css({"display" : "inline"})
}

function moiveOpacityReset(i){
	$(".movieBtn"+i).css({ "background-color" : "rgba( 255,255,255,0)"})
	$(".reserve_btn"+i).css({"display" : "none"})
	$(".detail_btn"+i).css({"display" : "none"})
}

function nowMovieInfo() {
	$("#laterInfo").css({"display" : "none"})
	$("#nowInfo").css({"display" : "block"})
	
	$(".active").css({"border-bottom" : "1px solid #000"})
	$(".now_span").css({"color" : "black"})
	$(".nonActive").css({"border-bottom" : "none", "color":"#BDBDBD"})
	$(".later_span").css({"color" : "#BDBDBD"})
}

function laterMovieInfo() {
	$("#nowInfo").css({"display" : "none"})
	$("#laterInfo").css({"display" : "block"})
	
	$(".active").css({"border-bottom" : "none", "color":"#BDBDBD"})
	$(".now_span").css({"color" : "#BDBDBD"})
	$(".nonActive").css({"border-bottom" : "1px solid #000", "color":"balck"})
	$(".later_span").css({"color" : "black"})
}

/*영화 추가*/
function InputMovieInfo() {
	var check = ["name", "poster", "genre", "director", "age", "country", "time", "actors", "open", "detail"];
	for (var i = 0; i < check.length; i++) {
		var object = document.getElementById(check[i]);
		if (object.value == "") {
			alert("정보를 입력 해 주세요.");
			object.focus();
			return;
		}
	}
		var name = document.getElementById("name").value;
		var poster = document.getElementById("poster").value;
		var genre = document.getElementById("genre").value;
		var director = document.getElementById("director").value;
		var age = document.getElementById("age").value;
		var country = document.getElementById("country").value;
		var time = document.getElementById("time").value;
		var actors = document.getElementById("actors").value;
		var open = document.getElementById("open").value;
		var detail = document.getElementById("detail").value;
		
		var info = 
		{
			name : name, 
			poster: poster, 
			genre: genre, 
			director: director, 
			age: age, 
			time: time,
			country: country,
			actors: actors,
			open: open,
			detail: detail,
		};
		
		Swal.fire({
		  title: '영화 추가',
		  text: "영화를 추가 하시겠어요?",
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText: '취소',
		  confirmButtonText: '추가'
		}).then((result) => {
		  if (result.isConfirmed) {
		  	$.ajax({		
				url: "movieInfoInsert",
				method: 'post',		
				data: JSON.stringify(info), 			
				contentType: "application/json; charset=utf-8", 	
			
				success : function(){	
				    Swal.fire({
				      title: '영화 추가',
				      text: '영화가 추가 되었습니다.',
				      icon: 'success'
				    }).then((result) => {
					  window.location.reload();
			    	})
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		  }
		})
}

/* 영화  정보 수정 */
function movieInfoChange(movieName, poster) {
	var datas = {"name" : movieName};
	console.log(poster);	
	Swal.fire({
	  title: "영화 정보 수정",
	  text: "["+movieName+"] 영화의 정보를 수정 하시겠어요?",
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  cancelButtonText: '취소',
	  confirmButtonText: '수정',
	  imageUrl: poster,
	  imageWidth: 184,
	  imageHeight: 262,

	  
	  
	}).then((result) => {
	  if (result.isConfirmed) {
		
		$.ajax({		
			url: "movieInfoSelect",
			method: 'post',		
			data: JSON.stringify(datas),  			
			contentType: "application/json; charset=utf-8", 	
		
			success : function(){	
				window.location.reload();
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})

	  }
	})
}

/* 영화 정보 삭제 */
function movieInfoDelete(movieName, poster) {
	var datas = {"name" : movieName};
	  	
	Swal.fire({
	  title: '영화 정보 삭제',
	  text: "["+movieName+"] 영화의 정보를 삭제 하시겠어요?",
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  cancelButtonText: '취소',
	  confirmButtonText: '삭제',
	  imageUrl: poster,
	  imageWidth: 184,
	  imageHeight: 262,

	}).then((result) => {
	  if (result.isConfirmed) {
		
		$.ajax({		
			url: "movieInfoDelete",
			method: 'post',		
			data: JSON.stringify(datas),  			
			contentType: "application/json; charset=utf-8", 	
		
			success : function(){	
			    Swal.fire({
			      title: '삭제완료!',
			      text: '삭제가 완료 되었습니다.',
			      icon: 'success'
			    }).then((result) => {
				  window.location.reload();
		    	})
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})

	  }
	})
}

/* 영화 정보 수정창 */
function movieInfoResult(cancel) {
	if (cancel) {
		Swal.fire({
		  title: '정보 수정',
		  text: "정보 수정을 그만 두시겠어요?",
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText: '취소',
		  confirmButtonText: '확인'
		}).then((result) => {
		  if (result.isConfirmed) {
		    location.href='movieInfoChangeCancel';
		  }
		})
	} else {
		var check = ["name", "poster", "genre", "director", "age", "country", "time", "actors", "open", "detail"];
		for (var i = 0; i < check.length; i++) {
			var object = document.getElementById(check[i]);
			if (object.value == "") {
				alert("정보를 입력 해 주세요.");
				object.focus();
				return;
			}
		}
		
		var name = document.getElementById("name").value;
		var poster = document.getElementById("poster").value;
		var genre = document.getElementById("genre").value;
		var director = document.getElementById("director").value;
		var age = document.getElementById("age").value;
		var country = document.getElementById("country").value;
		var time = document.getElementById("time").value;
		var actors = document.getElementById("actors").value;
		var open = document.getElementById("open").value;
		var detail = document.getElementById("detail").value;
		
		var info = 
		{
			name : name, 
			poster: poster, 
			genre: genre, 
			director: director, 
			age: age, 
			time: time,
			country: country,
			actors: actors,
			open: open,
			detail: detail,
		};

		Swal.fire({
		  title: '정보 수정',
		  text: "영화 정보를 수정 하시겠어요?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText: '취소',
		  confirmButtonText: '수정'
		}).then((result) => {
		  if (result.isConfirmed) {
		  	$.ajax({		
				url: "movieInfoChange",
				method: 'post',		
				data: JSON.stringify(info), 			
				contentType: "application/json; charset=utf-8", 	
			
				success : function(){	
				    Swal.fire({
				      title: '정보 수정',
				      text: '영화 정보가 수정 되었습니다.',
				      icon: 'success'
				    }).then((result) => {
					  window.location.reload();
			    	})
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		  }
		})
	}
}

function seatChk() {
	$("#a1").css({"background" : "#FF243E", "color" : "white"});
}