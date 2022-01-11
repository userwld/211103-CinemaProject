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


	<!-- 비밀번호찾기 창 오면 저장되어있던 세션 제거 -->
    <% if (session.getAttribute("memberInfo") != null) { session.removeAttribute("memberInfo"); } %>
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

		<div class="toparea">
			<h2 class="title">비밀번호 찾기 </h2> <!-- 비밀번호 찾기 -->
			<div class="headline">
				아이디 확인 후<br>비밀번호를 다시 설정하실 수 있습니다.<!-- 아이디 확인 후<br>비밀번호를 다시 설정하실 수 있습니다. -->
			</div>
		</div>

		<!-- contents -->
		<div class="contents">
			<!-- section -->
			<div class="section __half">
				<h3 class="subject __underline"></h3>
				<!-- 아이디 -->
				<div class="row">
					<div class="col-md">
						<label for="user-id">아이디</label>
					</div>
					<div class="col-md">
						<div class="form-wrap __normal __x1">
							<div class="inner">
								<div class="ui-input active">
									<input type="text" id="user-id" title="아이디를 입력해주세요." class=""> <!-- 아이디를 입력해주세요. -->
									<span class="placeholder">아이디를 입력해주세요. </span>
								</div>
								<button type="button" class="ui-button __square-small __black" id="checkId" onclick="fnCheckId();">확인</button><!-- 확인 -->
							</div>

						</div>
					</div>
				</div>
			</div>

			<!-- btn -->
			<div class="btn-area __center">
				<button type="button" class="ui-button __square-large __black" onclick="fnClose();">취소 </button><!-- 취소 -->
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