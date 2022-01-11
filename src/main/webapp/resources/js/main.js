$(function(){
	//개발단 화면 로드후 실행
	onload();
});
function onload(){
	nav();
	headerFixed();
}

//nav
function nav(){
	var depth1 = $("#nav > ul > li");
	var depth2 = $("#nav > ul > li > div > ul > li");
	$(depth1).children("a").off().on("mouseenter focusin", function(){
		$(this).parent("li").addClass("ov").siblings("li").removeClass("ov");
		$(depth1).children("div").hide().children("ul").stop().animate({"opacity" : "0"});
		$(this).siblings("div").show().children("ul").stop().animate({"opacity" : "1"});
	});
	$(depth2).children("a").off().on("mouseenter focusin", function(){
		$(this).parent("li").addClass("ov").siblings("li").removeClass("ov");
		$(depth2).children("div").hide().children("ul").stop().animate({"opacity" : "0"});
		$(this).siblings("div").show().children("ul").stop().animate({"opacity" : "1"});
	});
	$("#nav > ul").off().on("mouseleave", function(){
		$("#nav li").removeClass("ov");
		$("#nav li > div").hide().children("ul").stop().animate({"opacity" : "0"});
		$("#nav > ul > li.active > div, #nav > ul > li > div > ul > li.active > div").show().children("ul").stop().animate({"opacity" : "1"});
	});
}

//상단비쥬얼 nav위치값
	function slideVisualNavPos(){
		var winWdh = $(window).outerWidth();
		if (owl.parents('.visual_top').children('.inner').length > 0 && owl.find('.owl-nav').length > 0){
			owl.find('.owl-nav ').css({'width' : winWdh, 'margin-left' : -winWdh / 2});
		}
	};
	
	
// 멀티플 슬라이드
var slides = document.querySelector('.multiple_slider'),
	slide = document.querySelectorAll('.multiple_slider li'),
	currentIdx = 0,
	slideCount = slide.length,
	slideWidth = 245,
	slideMargin = 20,
	prevBtn1 = document.querySelector('.prev1'),
	nextBtn1 = document.querySelector('.next1');
	
	prevBtn2 = document.querySelector('.prev2'),
	nextBtn2 = document.querySelector('.next2');
	
makeClone();

function makeClone(){
	for(var i =0; i < slideCount; i++){
		var cloneSlide = slide[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides.appendChild(cloneSlide);		// 요소 뒤 추가
	}
	
	for(var i = slideCount-1; i >=0; i--){
		var cloneSlide = slide[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides.prepend(cloneSlide);	// 요소 앞 추가
		
	}
	updateWidth();
	setInitalPos();	// 초기위치잡기
	setTimeout(function(){		// translateX animate안보이게 설정
		slides.classList.add('animated');	
	},100);
	
}

function updateWidth(){
	var currentSlides = document.querySelectorAll('.multiple_slider li');
	var newSlideCount = currentSlides.length;
	// ul의 너비 지정
	var newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + 'px';
	slides.style.width = newWidth;
}

function setInitalPos(){
	var initialTranslateValue = -(slideWidth + slideMargin) * slideCount;
	// 트랜스폼 조정
	slides.style.transform = 'translateX(' + initialTranslateValue + 'px)';

}

nextBtn1.addEventListener('click',function(){
	moveSlide(currentIdx +1);
	
});

prevBtn1.addEventListener('click',function(){
	moveSlide(currentIdx -1);
});


function moveSlide(num){
	slides.style.left = -num * (slideWidth + slideMargin) + 'px';
	currentIdx = num;
	
	if(currentIdx == slideCount || currentIdx == -slideCount){	// 맨마지막 또는 맨 앞으로 가면 다시 원위치를 옮김
		setTimeout(function(){		// 0.5초후에 위치 이동
			slides.classList.remove('animated');
			slides.style.left = '0px';
			currentIdx = 0;
		},400);
		
		setTimeout(function(){		// 0.6초후 다시 추가
			slides.classList.add('animated');	
		},500);
	
	}
}



var slides2 = document.querySelector('.multiple_slider2'),
	slide2 = document.querySelectorAll('.multiple_slider2 li'),
	currentIdx2 = 0,
	slideCount2 = slide2.length,
	slideWidth2 = 245,
	slideMargin2 = 20,
	
	prevBtn2 = document.querySelector('.prev2'),
	nextBtn2 = document.querySelector('.next2');
	
makeClone2();

function makeClone2(){
	for(var i =0; i < slideCount2; i++){
		var cloneSlide = slide2[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides2.appendChild(cloneSlide);		// 요소 뒤 추가
	}
	
	for(var i = slideCount2 -1; i >=0; i--){
		var cloneSlide = slide2[i].cloneNode(true);
		cloneSlide.classList.add('clone');
		slides2.prepend(cloneSlide);	// 요소 앞 추가
		
	}
	updateWidth2();
	setInitalPos2();	// 초기위치잡기
	setTimeout(function(){		// translateX animate안보이게 설정
		slides2.classList.add('animated');	
	},100);
	
}

function updateWidth2(){
	var currentSlides = document.querySelectorAll('.multiple_slider2 li');
	var newSlideCount = currentSlides.length;
	// ul의 너비 지정
	var newWidth = (slideWidth2 + slideMargin2) * newSlideCount - slideMargin2 + 'px';
	slides2.style.width = newWidth;
}

function setInitalPos2(){
	var initialTranslateValue = -(slideWidth2 + slideMargin2) * slideCount2;
	// 트랜스폼 조정
	slides2.style.transform = 'translateX(' + initialTranslateValue + 'px)';

}

nextBtn2.addEventListener('click',function(){
	moveSlide2(currentIdx2 +1);
	
});

prevBtn2.addEventListener('click',function(){
	moveSlide2(currentIdx2 -1);
});


function moveSlide2(num){
	slides2.style.left = -num * (slideWidth2 + slideMargin2) + 'px';
	currentIdx2 = num;
	
	if(currentIdx2 == slideCount2 || currentIdx2 == -slideCount2){	// 맨마지막 또는 맨 앞으로 가면 다시 원위치를 옮김
		setTimeout(function(){		// 0.5초후에 위치 이동
			slides2.classList.remove('animated');
			slides2.style.left = '0px';
			currentIdx2 = 0;
		},400);
		
		setTimeout(function(){		// 0.6초후 다시 추가
			slides2.classList.add('animated');	
		},500);
	
	}
}

//헤더
function headerFixed() {
	$(window).on("scroll", function () {
		var scrTop = $(window).scrollTop();
		var gnbHgt = $(".gnb").outerHeight();
		var banHgt = gnbHgt + $("#main_top_of_top_banner").outerHeight();

		if ($('#main_top_of_top_banner').hasClass('banner_top_wrap')) {
			// 상단 배너 있을 경우
			if (scrTop > banHgt) {
				headerFixed_add();
			} else {
				headerFixed_remove();
			}
		} else {
			// 상단 배너 없을 경우
			if (scrTop > gnbHgt) {
				headerFixed_add();
			} else {
				headerFixed_remove();
			}
		}
	});
}

//헤더 : 고정
function headerFixed_add() {
	var scrTop = $(window).scrollTop();
	$(".header").addClass("fixed");
	if ($(".visual_top").length > 0) {
		$(".visual_top").not(".visual_main").stop().css({ "margin-top": "120px" });
	} else {
		if ($("#contents").hasClass("contents_mypage")) {
			$("#contents.contents_mypage").stop().css({ "padding-top": "170px" });
		} else {
			$("#contents").stop().css({ "margin-top": "120px" });
		}
	}
	if ($(".contents_mall_home .tab_wrap_lnk").length > 0) {
		var mallTabConOff = $(".contents_mall_home .tab_con_lnk").offset().top;
		if (scrTop > mallTabConOff - 160) {
			$(".contents_mall_home .tab_wrap_lnk").addClass("fixed");
		} else {
			$(".contents_mall_home .tab_wrap_lnk").removeClass("fixed");
		}
	}
}
//헤더 : 고정 해제
function headerFixed_remove() {
	$(".header").removeClass("fixed");
	if ($(".visual_top").length > 0) {
		$(".visual_top").stop().css({ "margin-top": "" });
	} else {
		if ($("#contents").hasClass("contents_mypage")) {
			$("#contents.contents_mypage").stop().css({ "padding-top": "50px" });
		} else {
			$("#contents").stop().css({ "margin-top": "" });
		}

	}
}

// 멀티플 슬라이더에 마우스오버시 배경 투명 + 버튼 나오는 효과 
function bgOpacity(i){
	$(".boxbtn"+i).css({ "background-color" : "rgba( 0,0,0,0.6)"})
	$(".reserve_btn"+i).css({"display" : "inline"})
	$(".detail_btn"+i).css({"display" : "inline"})
}

// 멀티플 슬라이더 마우스아웃시 원래대로
function bgOpacityReset(i){
	$(".boxbtn"+i).css({ "background-color" : "rgba( 255,255,255,0)"})
	$(".reserve_btn"+i).css({"display" : "none"})
	$(".detail_btn"+i).css({"display" : "none"})
}


function bgOpacity2(i){
	$(".gradeBoxBtn"+i).css({ "background-color" : "rgba( 0,0,0,0.6)"})
	$(".gradeReserve_btn"+i).css({"display" : "inline"})
	$(".gradeDetail_btn"+i).css({"display" : "inline"})
}

function bgOpacityReset2(i){
	$(".gradeBoxBtn"+i).css({ "background-color" : "rgba( 255,255,255,0)"})
	$(".gradeReserve_btn"+i).css({"display" : "none"})
	$(".gradeDetail_btn"+i).css({"display" : "none"})
}

// 로그아웃
function logOut() {
	result = window.confirm("로그아웃 하시겠습니까?");
	if (result) {
		location.href='logoutRequest';
	}

}	