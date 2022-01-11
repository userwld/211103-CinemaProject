<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>롯지브이</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/css/materialize.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/js/materialize.min.js"></script>


<script>

$(document).ready(function(){
  $('.slider').slider();
});


</script>

</head>
<body style="background-color: black;">
	<div id="skip_nav_section" class="skip_nav">
	<ul>
		<li><a href="#nav">주 메뉴 바로가기</a></li>
		<li><a href="#contents">본문 바로가기</a></li>
	</ul>
	</div>

	<!-- 자동 슬라이더 -->

		<div class="slider" style="z-index: 1;">
		    <ul class="slides" style="height: 800px;">
		      <li>
		        <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide1.jpg"> 
		        <div class="caption center-align">
		        </div>
		      </li>
		      <li>
		         <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide2.jpg"> 
		        <div class="caption left-align">
		        </div>
		      </li>
		      <li>
		        <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide3.jpg"> 
		        <div class="caption right-align">
		        </div>
		      </li>
		      <li>
		         <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide4.jpg"> 
		        <div class="caption center-align"> 
		        </div>
		      </li>
		        <li>
		         <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide5.jpg"> 
		        <div class="caption center-align"> 
		        </div>
		      </li>
		    </ul>
		  </div>
			
	<!-- 멀티플 슬라이드1 -->
	<div class="multiple_whole">
		<div class="multiple_wrap">
			<ul class="multiple_slider">
			<c:set var ="cnt" value="0"/>			
			<c:forEach var="rate" items="${map }" varStatus="status">
					<c:forEach var="movieList" items="${movieListInfo }" >
						<c:if test="${rate.getKey() == movieList.getMovieListNum() }">
							<c:if test="${cnt < 10 }" >
								<c:set var="cnt" value="${cnt + 1}"/>
								<li>
									<div class="boxBg${status.count }" style="background-image:url('${pageContext.request.contextPath}/resources/images/poster/${movieList.getMoviePoster() }');" onmouseover="bgOpacity(${status.count });" onmouseout="bgOpacityReset(${status.count });">
										<div class="boxBtn${status.count }">	<!-- 마우스오버시 배경만 어둡게 하기위해 영역지정 -->
											<button id="reserve_btn" class="reserve_btn${status.count }" onclick="javascript:location.href='index?formpath=ticketing';">예매하기</button>
											<button id="detail_btn" class="detail_btn${status.count }" onclick="javascript:location.href='movieDetailProc?movieListNum=${movieList.getMovieListNum() }';">상세정보</button>
										</div>
									</div>
									<div class="movieInfo" style="text-align: center;">
					                    <h3 style="font-size: 22px;">${status.count }.${movieList.getMovieName() }</h3>
										<span style="font-size: 15px;">예매율 <fmt:formatNumber value="${rate.getValue() }" type="number" maxFractionDigits="1" minFractionDigits="1"/>%</span>
									</div>
								</li>
							</c:if>
						</c:if>
					</c:forEach>              
			</c:forEach>
			</ul>
		</div>
		
		<button type="button" class="prev1"><img src="${pageContext.request.contextPath}/resources/images/main/icon/slide_left.png"></button>
		<button type="button" class="next1"><img src="${pageContext.request.contextPath}/resources/images/main/icon/slide_right.png"></button>
	</div>
	
	<!-- 멀티플 슬라이드2 -->
	<div class="multiple_whole">
		<div class="multiple_wrap2">
			<ul class="multiple_slider2">
			<c:if test="${not empty gradeR }">
				<c:set var ="gcnt" value="0"/>	
				<c:forEach var="grade" items="${gradeR }" varStatus="index">
					<c:forEach var="mList" items="${movieListInfo }" >
						<c:if test="${grade.getKey() == mList.getMovieListNum() }">
							<c:if test="${gcnt < 10 }" >
								<c:set var="gcnt" value="${gcnt + 1}"/>
									<li>
										<div class="gradeBoxBg${index.count }" style="background-image:url('${pageContext.request.contextPath}/resources/images/poster/${mList.getMoviePoster() }');" onmouseover="bgOpacity2(${index.count });" onmouseout="bgOpacityReset2(${index.count });">
											<div class="gradeBoxBtn${index.count }">	
												<button id="gradeReserve_btn" class="gradeReserve_btn${index.count }" onclick="javascript:location.href='index?formpath=ticketing';">예매하기</button>
												<button id="gradeDetail_btn" class="gradeDetail_btn${index.count }" onclick="javascript:location.href='movieDetailProc?movieListNum=${mList.getMovieListNum() }';">상세정보</button>
											</div>
										</div>
										<div class="movieInfo" style="text-align: center;">
						                    <h3 style="font-size: 22px;">${index.count }.${mList.getMovieName() }</h3>
											<span style="font-size: 15px;">평점 <fmt:formatNumber value="${grade.getValue() }" type="number" maxFractionDigits="1" minFractionDigits="1"/>점</span>
										</div>
									</li>
						</c:if>
					</c:if>
					</c:forEach>               
				</c:forEach>
			</c:if>
			</ul>
		</div>
		
		<button type="button" class="prev2"><img src="${pageContext.request.contextPath}/resources/images/main/icon/slide_left.png"></button>
		<button type="button" class="next2"><img src="${pageContext.request.contextPath}/resources/images/main/icon/slide_right.png"></button>
	</div>
	
	<!-- 로드 후 js작동! -->	
	<script src="<c:url value="/resources/js/main.js" />"></script>
	
</html>