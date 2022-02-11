<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />

<head>
<meta charset="UTF-8">
<title>롯지브이</title>
	<link rel="icon" href="https://www.lottecinema.co.kr/NLCHS/favicon.ico?v=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css" />
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/js/materialize.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="<c:url value="/resources/js/main.js" />"></script>

</head>
<body>
	<div class="gnb">
			<h1 class="logo" style="margin-left: 420px;">
				<a href="${root }"><img style="margin: 10px 0 auto; width: 150px; height: auto;" src="${pageContext.request.contextPath}/resources/images/lot.png"></a>
			</h1>
			<ul class="g_menu2" style="margin-top: -20px;">
			<c:if test="${loginInfo.id == 'admin' }">
				<li><a href="${root }timeInfoProc">상영시간표관리</a></li>
				<li><a href="${root }cinemaListProc">영화관관리</a></li>
				<li><a href="index?formpath=movieManagement">영화관리</a></li>
				<li><a href="${root }memberListProc">회원관리</a></li>
			</c:if>
				<li><a href="${root }customerList">고객센터</a></li>	
				<!-- 소셜 로그인 추가로 인한 변경 -->
				<c:choose>
					<c:when test="${not empty loginInfo }">		
						<li><a href="#" onclick="logOut()">로그아웃</a></li>
					</c:when>
					
					<c:when test="${not empty id }">					
				     	<c:set var = "redirectUri" value = "http://localhost:8085/cinema/kakaoLogout"/>	
						<c:set var = "restKey" value = "24d1826f93f5ef832e2398885563dee4"/>	
						<li><a href="https://kauth.kakao.com/oauth/logout?client_id=${restKey }&logout_redirect_uri=${redirectUri }">카카오 로그아웃</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="index?formpath=login">로그인</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="g_menu3">
				<%if (session.getAttribute("loginInfo") != null) {%>
					<li><a href="${root}ticketingHistory" class="btn_my">마이</a></li>
				<% } else { %>
					<li><a href="register1" class="btn_my">회원가입</a></li>
				<% } %>
				<li><a href="index?formpath=ticketing" class="btn_reserve">바로 예매</a></li>
				<li><button class="btn_menu_all">전체 메뉴 레이어 열기</button><div id="allmenu"></div></li>
			</ul>
		</div>
		<div id="nav">
			<ul>
				<li class="">
					<a href="index?formpath=ticketing">예매</a>
					<div style="display: none;">
						<ul style="opacity: 0;">
							<li><a href="index?formpath=ticketing" title="예매하기">예매하기</a></li>
							<li><a href="index?formpath=ticketing" title="상영시간표">상영시간표</a></li>
						</ul>
					</div>
				</li>
				<li class="">
					<a href="movieListProc">영화</a>
					<div style="display: none;">
						<ul style="opacity: 0;">
							<li><a href="movieListProc" title="홈">홈</a></li>
							<li class=""><a href="movieInfoListProc?page=1" title="현재상영작">현재상영작</a></li>
							<li><a href="movieInfoListProc?page=2" title="상영예정작">상영예정작</a></li>
						
						</ul>
					</div>
				</li>
				<li class="">
					<a href="#">영화관</a>
					<div style="display: none;">
						<ul style="opacity: 0;">
							<c:forEach var="country" items="${countryList }">
								<li><a href="#" title="${country}">${country}</a>
									<div style="display: none;">
										<ul style="opacity: 0;">
											<c:forEach var="cinema" items="${cinemaList }">
												<c:if test="${cinema.countryName eq country}">
													<li><a href="index?formpath=ticketing">${cinema.cinemaName}</a></li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</li>
			</ul>
		</div>