<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<%@ page import="com.star.cinema.member.dto.*" %>

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

	<script src="https://members.lpoint.com/resources/js/lib/jquery-1.12.3.min.js"></script>
	<script src="https://members.lpoint.com/resources/js/lib/serialize.object.js"></script>
	<script src="https://members.lpoint.com/resources/js/lib/json2.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findid.css" />
    <link rel="stylesheet" href="https://members.lpoint.com/resources/css/common.css?date=20200428000001">
	<link rel="stylesheet" href="https://members.lpoint.com/resources/css/component.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/resize.css" />
	<link rel="stylesheet" href="https://members.lpoint.com/resources/css/css_1050.css" type="text/css" media="screen"></head>
	<script src="<c:url value="/resources/js/find.js" />"></script>
	<script src="<c:url value="/resources/js/findid.js" />"></script>
</head>
<body id="KOR" data-device="0" oncontextmenu="return false">
    <!-- header -->
    <div id="mast-head">
        <div class="container">
            <a href="${root }">
            	<img src="${pageContext.request.contextPath}/resources/images/lot.png" style="width: 300px; height: 105px;"/>
            </a>
        </div>
    </div>
    <!-- //header -->


    <div id="mast-body">
        <div class="container">
            <!-- toparea -->
            <div class="toparea">
                <h2 class="title">
                   	 아이디 찾기
                </h2>
                <!-- 아이디 찾기 -->
                <% MemberDTO member = (MemberDTO) session.getAttribute("memberInfo");
                	System.out.println(member);
                	if (member != null) { %>
		                <div class="headline">
		                   	 입력하신 정보와<br>일치하는 아이디 정보입니다.
		                </div>
	                <%} else { %>
		                <div class="toparea">
							<div class="headline __error">
								입력하신 정보와<br>일치하는 아이디 정보가 없습니다.
							</div>
						</div>
	                <% } %>
            </div>
            <!-- //toparea -->
            <!-- contents -->
            <%if (member != null) { %>
	            <div class="contents">
	                <!-- section : 결과(공통) -->
	                <div class="section __high">
	                    <h3 class="subject __underline">
	                        <em class="idResultTitle">아이디 찾기 결과</em> <em class="frnIdResultTitle __none">There are<em class="IdCount __point-color __none"></em>
	                            number of IDs.</em>
	                    </h3>
	                    <div class="row" id="div-idCstNm1">
	                        <table class="normal-table">
	                            <caption>
	                                	아이디
	                            </caption>
	                            <colgroup>
	                                <col>
	                            </colgroup>
	                            <tbody id="div-tBodyId">
	                                <tr>
	                                    <td><%=member.getId() %></td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>

               

                <!-- btn -->
                <div class="btn-area" id="div-lgnBtn1">
                    <button class="ui-button __dot" onclick="location.href='index?formpath=login';"><em>확인</em><!-- <em>확인</em> --></button>
                </div>
            </div>
            <% } else { %>
	                	<div class="btn-area" id="div-lgnBtn1">
	                    	<button class="ui-button __dot" onclick="location.href='index?formpath=login';"><em>확인</em><!-- <em>확인</em> --></button>
	                	</div>
	        <% } %>
            <!-- //contents -->
        </div>
        </div>
    <!-- //mast body -->


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