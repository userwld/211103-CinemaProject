<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />
<script src="<c:url value="/resources/js/myPage.js" />"></script>
<c:url var="root" value="/"/>

<title>마이페이지 - 관람내역</title>

<%@ include file="myPageHeader.jsp" %>

<center>
	<div class="sub_content">
		<div class="myMovieHistory">
			<div class="myMovieHistory_title">
				<h4>내 관람 내역</h4>
				<span><em>${myTicketing.size()}</em>편</span>
			</div>
			<ul class="myMovieHistory_list">
				<c:choose>
					<c:when test="${not empty myTicketing }">
						<c:forEach var="myHistory" items="${myTicketing }">
							<c:set var="movieinfo" value="${myMovieInfo.get(myHistory.movieListNum)}"/>
							<c:if test="${movieinfo.movieAge == '0'}"><c:set var="grAge" value="grade gr_all"/></c:if>
							<c:if test="${movieinfo.movieAge == '12'}"><c:set var="grAge" value="grade gr_12"/></c:if>
							<c:if test="${movieinfo.movieAge == '15'}"><c:set var="grAge" value="grade gr_15"/></c:if>
							<c:if test="${movieinfo.movieAge == '18'}"><c:set var="grAge" value="grade gr_18"/></c:if>
							<li>
							<div class="myMovieHistory_poster">
								<a href="movieDetailProc?movieListNum=${myHistory.movieListNum}">
									<img src="${pageContext.request.contextPath}/resources/images/poster/${movieinfo.moviePoster}" >
								</a>
							</div>
							<strong class="movie_tit">
								<c:set var="movieAge" value="${movieinfo.movieAge}"/>								
								<c:if test="${movieAge == '0'}"><c:set var="movieAge" value="전체"/></c:if>
								<c:if test="${movieAge == '18'}"><c:set var="movieAge" value="청불"/></c:if>								
								<span class="${grAge }">${movieAge}</span>
								<span style="font-size: 16px;">${movieinfo.movieName}</span>
							</strong>
							<div class="detail_history1">
								<span class="detail_info">
									<strong>${cinemaName.get(myHistory.cinemaNum)}</strong>
								</span>
								<span class="detail_info">
									<strong>${hallName.get(myHistory.hallNum)}</strong>
								</span>
								<span class="detail_info">
									<strong>${myHistory.seatName}</strong>
								</span>
							</div>
							<div class="detail_history2">
								<span class="detail_info">
									<strong>${myHistory.openDate}</strong>
								</span>
								<span class="detail_info">
									<strong>${myHistory.openTime}</strong>
								</span>
							</div>
							<div class="detail_history3">
								<span class="detail_info">
									<strong>관람 인원 </strong>
								</span>
								<span class="detail_info">
									<strong>${myHistory.people}명</strong>
								</span>
							</div>
							<dl class="review_box">
								<dt>My Review</dt>
								<dd>${myReview.get(myHistory.movieListNum)}</dd>
							</dl>
							
							<c:set var="present" value="<%=new java.util.Date() %>"/>
							<c:set var ="nowTime"><fmt:formatDate value="${present}" pattern ="yyyy-MM-dd-HH-mm"/></c:set>
<!--  						${nowTime } , ${btnTime.get(myHistory.ticketingNum)}    -->
							<c:if test="${empty myReview.get(myHistory.movieListNum) && nowTime > btnTime.get(myHistory.ticketingNum)}">
								<div class="reviewWrite_btn_area">
									<a href="movieDetailProc?movieListNum=${myHistory.movieListNum}">
										<span>리뷰쓰기</span>
									</a>
								</div>
							</c:if>
						</li>
						</c:forEach>
				</c:when>
					<c:otherwise>
						<li>
							<span class ="noContent">관람 내역이 없습니다.</span>
						</li>
					</c:otherwise>	
				</c:choose>		
			</ul>
		
		<div class="last_list"></div>		
		</div>
	</div>
</center>