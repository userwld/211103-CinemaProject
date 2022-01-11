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
    <title>아이디 찾기</title>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findid.css" />
	<link rel="stylesheet" href="https://members.lpoint.com/resources/css/css_1050.css" type="text/css" media="screen"></head>
	<script src="<c:url value="/resources/js/find.js" />"></script>
	<script src="<c:url value="/resources/js/findid.js" />"></script>
</head>
<body id="KOR" data-device="0" oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <!-- header -->
    <div id="mast-head">
        <div class="container">
            <a href="${root }">
            	<img src="${pageContext.request.contextPath}/resources/images/lot.png" style="width: 300px; height: 105px;"/>
            </a>
        </div>
    </div>
    <!-- //header -->
    
    <!-- 아이디찾기 창 오면 저장되어있던 세션 제거 -->
    <% if (session.getAttribute("memberInfo") != null) { session.removeAttribute("memberInfo"); } %>
	

    <!-- mast body -->
    <div id="mast-body">
        <div class="container">
            <!-- toparea -->
            <div class="toparea">
                <h2 class="title">아이디 찾기 </h2><!-- 아이디 찾기 -->
                <div class="headline">
                    <!-- 등록된 회원정보로<br>아이디를 찾으실 수 있습니다. -->
                    	등록된 회원정보로<br>아이디를 찾으실 수 있습니다.
                </div>
            </div>
            <!-- //toparea -->

            <!-- contents -->
            <div class="contents">
                <!-- section : 아이디찾기 -->
                <div class="section __half __find ui-radio-accodion" id="resident">
                    <div class="subject __underline"></div>
                    <!-- 이메일 주소로 찾기 -->
                    <div class="row">
                        <div class="col-md">
                            <!-- 선택 -->
                            <div class="ui-radio">
                                <input type="radio" id="find-way-email" name="member-find-way" data-id="section-find-emailid" data-code="2" data-trigger="#section-find-emailid" checked="checked">
                                <label for="find-way-email">이메일주소로 찾기 </label><!-- 이메일 주소로 찾기 -->
                            </div>
                            <!-- 펼침 -->
                            <div id="section-find-emailid" class="inner-content active">
                                <!-- 이름 -->
                                <div class="row">
                                    <div class="col-md">
                                        <label for="find-email-user-name">이름</label><!-- 이름 -->
                                    </div>
                                    <div class="col-md">
                                        <div class="form-wrap __normal">
                                            <div class="ui-input">
                                                <input type="text" id="find-email-user-name" data-type="cstNm" maxlength="20">
                                                <span class="placeholder">한글 또는 영문으로 입력해주세요.</span><!-- 한글 또는 영문으로 입력해주세요. -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 이메일 주소 -->
                                <div class="row">
                                    <div class="col-md">
                                        <label for="find-email-user-email">이메일 주소 </label><!-- 이메일 주소 -->
                                    </div>
                                    <div class="col-md">
                                        <div class="form-wrap __normal">
                                            <div class="ui-input">
                                                <input type="email" id="find-email-user-email" data-type="elcAdd" maxlength="50">
                                                <span class="placeholder">이메일주소를 입력해주세요.</span><!-- 이메일 주소를 입력해주세요. -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- //펼침 -->
                        </div>
                    </div>
                </div>

                <!-- //section -->

                <!-- btn -->
                <div class="btn-area __center">
                    <button type="button" class="ui-button __square-large __black" onclick="fnClose();">취소 </button>
                    <button type="button" class="ui-button __square-large __point-color" onclick="fnCheck();">다음 </button>
                </div>
            </div>
            <!-- //contents -->
        </div>
    </div>


    <form name="formBack" action="mbrJoinS0101" id="formBack" method="post">
    </form>
    <form name="formNext" action="/exView/manage/fdPassword_04_001" id="formNext" method="post">
        <input type="hidden" name="onlId" id="onlId">
        <input type="hidden" name="onlIdList" id="onlIdList" value="">
        <input type="hidden" name="frnYn" id="frnYn" value="ko">
        <input type="hidden" name="typeCode" value="" id="typeCode">
    </form>
    <form name="formError" action="/exView/manage/fdPassword_05_002" id="formError" method="post">
        <input type="hidden" name="errorTypeCode" value="002">
    </form>

    <!-- Footer -->
    <div id="mast-foot">
        <div class="container">
            <div class="utility">
                <div class="item"><a href="http://www.lottemembers.com/">회사소개
                        <!-- 회사소개 --></a></div>
                <div class="item"><a href="https://m.lpoint.com/app/center/LWDE100100.do">고객센터
                        <!-- 고객센터 --></a></div>
                <div class="item"><a href="https://m.lpoint.com/app/center/LWDD100100.do">이용약관
                        <!-- 이용약관 --></a></div>
                <div class="item"><a href="https://m.lpoint.com/app/center/LWDD100100.do?popup=4"><em class="__point-color">개인정보처리방침
                            <!-- 개인정보처리방침 --></em></a></div>
            </div>
            <div class="com-address">
                <address>
                    <span>서울시 중구 통일로 2길 16 AIA타워 14층
                        <!-- 서울시 중구 통일로 2길 16 AIA타워 14층 --></span>
                    <span>회사명 롯데멤버스(주)
                        <!-- 회사명 롯데멤버스(주) --></span>
                    <span>대표이사 전형식
                        <!-- 대표이사 강승하 --></span>
                    <span>사업자등록번호 104-86-58491
                        <!-- 사업자등록번호 104-86-58491 --></span>
                    <span>고객센터 1899-8900
                        <!-- 고객센터 1899-8900 --></span>
                </address>
            </div>
        </div>
    </div>
</body>



</html>