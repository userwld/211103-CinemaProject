<%@page import="org.springframework.security.web.authentication.preauth.PreAuthenticatedGrantedAuthoritiesUserDetailsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />
<script src="<c:url value="/resources/js/myPage.js" />"></script>
<c:url var="root" value="/"/>

<title>마이페이지 - 찜목록</title>

<%@ include file="myPageHeader.jsp" %>


<center>
	<div class="sub_content">
		<div class="myLike">
			<div class="myLike_title">
				<h4>내가 찜한 영화</h4>
				<span><em>${myGrade.size()}</em>편</span>
			</div>
			<ul class="myLike_list">
				<c:choose>
					<c:when test="${not empty myGrade }">
						<c:forEach var="myLike" items="${myGrade }">
							<c:set var="movieinfo" value="${myMovieInfo.get(myLike.movieListNum)}"/>
							<c:if test="${movieinfo.movieAge == '0'}"><c:set var="grAge" value="grade gr_all"/></c:if>
							<c:if test="${movieinfo.movieAge == '12'}"><c:set var="grAge" value="grade gr_12"/></c:if>
							<c:if test="${movieinfo.movieAge == '15'}"><c:set var="grAge" value="grade gr_15"/></c:if>
							<c:if test="${movieinfo.movieAge == '18'}"><c:set var="grAge" value="grade gr_18"/></c:if>
							<li>
								<div class="myLike_poster">
									<a href="movieDetailProc?movieListNum=${myLike.movieListNum}">
										<img src="${pageContext.request.contextPath}/resources/images/poster/${movieinfo.moviePoster}" >
									</a>
								</div>
								<strong class="movie_tit">
									<c:set var="movieAge" value="${movieinfo.movieAge}"/>								
										<c:if test="${movieAge == '0'}"><c:set var="movieAge" value="전체"/></c:if>
										<c:if test="${movieAge == '18'}"><c:set var="movieAge" value="청불"/></c:if>								
									<span class="${grAge }">${movieAge}</span>
									<span style="font-size : 16px;">${movieinfo.movieName}</span>
								</strong>
								<div class="detail">
									<span class="reserve_per">
										<em>예매율</em>
										<strong><fmt:formatNumber value="${movieRate.get(myLike.movieListNum)}" type="number" maxFractionDigits="1" minFractionDigits="1"/> % </strong>
									</span>
									<span class="score">
										<em>평점</em>
										<strong><fmt:formatNumber value="${myMovieGrade.get(myLike.movieListNum)}" type="number" maxFractionDigits="1" minFractionDigits="1"/></strong>
									</span>
									<button type="button" class="heart_btn" onclick="myLikeCalc(${myLike.movieListNum});"></button>
								</div>
								<dl class="review_box">
									<dt>Recent Review</dt>
									<dd>${recentReview.get(myLike.movieListNum)}</dd>
								</dl>
								<div class="reserve_btn_area">
									<a href="index?formpath=ticketing">
										<span>예매하기</span>
									</a>
								</div>
							</li>
						</c:forEach>
					</c:when>
				<c:otherwise>
					<li>
						<span class ="noContent">찜한 영화가 없습니다.</span>
					</li>
				</c:otherwise>				
			</c:choose>
			</ul>
		
		<div class="last_list">		
		</div>		
		</div>
	</div>
</center>