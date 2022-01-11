<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="https://members.lpoint.com/resources/css/common.css?date=20200428000001">
	<link rel="stylesheet" href="https://members.lpoint.com/resources/css/component.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/resize.css" />
	<link rel="stylesheet" href="https://members.lpoint.com/resources/css/swiper.min.css?date=20200428000001">
	<link rel="stylesheet" href="https://members.lpoint.com/resources/css/css_1050.css" type="text/css" media="screen"></head>
	

	<script src="https://members.lpoint.com/resources/js/lib/jquery-1.12.3.min.js"></script>
	<script src="https://members.lpoint.com/resources/js/lib/serialize.object.js"></script>
	<script src="https://members.lpoint.com/resources/js/lib/json2.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	

	<script src="<c:url value="/resources/js/find.js" />"></script>
	<script src="<c:url value="/resources/js/findid.js" />"></script>
</head>

<body id="KOR" data-device="0" oncontextmenu="return false" ondragstart="return false"> <!-- KOR / ENG / JPN / CHN-CN / CHN-TW -->


 
<!-- header -->
    <div id="mast-head">
        <div class="container" style="max-width:1170px;">
            <a href="${root }">
            	<img src="${pageContext.request.contextPath}/resources/images/lot.png" style="width: 300px; height: 105px;"/>
            </a>
        </div>
    </div>
<!-- //header -->

<!-- this page only -->

<!-- mast body -->
<div id="mast-body">
	<div class="container">
		<!-- toparea -->
		<div class="toparea">
			<h2 class="title">비밀번호 찾기</h2> <!-- 비밀번호 찾기 -->
			<div class="headline">
				본인확인 수단을<br>선택해주세요. <!-- 본인확인 수단을<br>선택해주세요. -->
			</div>
		</div>
		<!-- //toparea -->

		<!-- contents -->
		<div class="contents">
			<!-- section : 내 정보에 등록된 휴대폰 번호로 인증 -->
			<div class="section __half __find ui-radio-accodion">
				<div class="subject __underline"></div>

				<!-- section : 본인인증으로 찾기 -->
				<div class="row">
					<div class="col-md">
						<!-- 선택 -->
						<div class="ui-radio">
							<input type="radio" id="find-way-certify" name="member-find-way" data-trigger="#section-find-certify" checked="checked">
							<label for="find-way-certify" >본인인증</label>
						</div>
						<!-- 펼침 -->
						<div id="section-find-certify" class="inner-content active">
								<!-- section -->
									<div id="section-certify-way">
										<!-- 인증수단 -->
										<div class="col-md">
											<ul class="item-wrap">		
												<li><a href="#" class="item certify-card" onclick="callEmailCtf()">이메일 인증</a></li> <!-- 카드인증방식 추가 2020.06.14 gun -->
												
											</ul>
										</div>
									</div>
								<!-- //section -->
							<div class="description">
								<p>이메일 인증 버튼을 클릭 시 이메일로 인증번호가 전송 되오니, 인증번호를 팝업창에 입력하여 주시길 바랍니다.</p>
							</div>
						</div>
						<!-- //펼침 -->
					</div>
				</div>
			</div>

			<!-- btn -->
			<div class="btn-area __center">
				<button type="button" class="ui-button __square-large __black" onclick="fnBack();">이전 </button>
				<button type="button" class="ui-button __square-large __point-color __none" id="nextButton" onclick="fnCert();">다음 </button>
			</div>
		</div>
		<!-- //contents -->
	</div>
</div>
<!-- //mast body -->



<form name="formBack" action="" id="formBack" method="post">
</form>
<form name="formNext" action="mbrJoinS0201" id="formNext" method="post">
	<input type="hidden" name="onlId" value="">
	<input type="hidden" name="onlCstTpC" value="">
	<input type="hidden" name="ssoTkn" value="">
</form>
<form name="formError" action="" id="formError" method="post">
</form>


<!-- Footer -->
<div id="mast-foot">
	<div class="container">
		<div class="utility">
			<div class="item"><a href="http://www.lottemembers.com/">회사소개<!-- 회사소개 --></a></div>
			<div class="item"><a href="https://m.lpoint.com/app/center/LWDE100100.do">고객센터<!-- 고객센터 --></a></div>
			<div class="item"><a href="https://m.lpoint.com/app/center/LWDD100100.do">이용약관<!-- 이용약관 --></a></div>
			<div class="item"><a href="https://m.lpoint.com/app/center/LWDD100100.do?popup=4"><em class="__point-color">개인정보처리방침<!-- 개인정보처리방침 --></em></a></div>
		</div>
		<div class="com-address">
			<address>
				<span>서울시 중구 통일로 2길 16 AIA타워 14층<!-- 서울시 중구 통일로 2길 16 AIA타워 14층 --></span>
				<span>회사명 롯데멤버스(주)<!-- 회사명 롯데멤버스(주) --></span>
				<span>대표이사 전형식<!-- 대표이사 강승하 --></span>
				<span>사업자등록번호 104-86-58491<!-- 사업자등록번호 104-86-58491 --></span>
				<span>고객센터 1899-8900<!-- 고객센터 1899-8900 --></span>
			</address>
		</div>
		<div class="copyright">© LOTTE MEMBERS CO.,LTD.</div>

	</div>
</div>



</body>
</html>