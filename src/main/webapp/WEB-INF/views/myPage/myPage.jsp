<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />
<script src="<c:url value="/resources/js/myPage.js" />"></script>
<c:url var="root" value="/"/>
<c:if test="${not empty msg }">
	<script>alert('${msg}')</script>
</c:if>
<title>마이페이지 - 예매내역</title>

<%@ include file="myPageHeader.jsp" %>

<!-- 한달내에 예매내역만 나오는 페이지 -->
<center>
	<div class="sub_content">
		<div class="myTicketing">
			<div class="myTicketing_title">
				<h4>내가 예매한 내역 - </h4>
				<span><font style="color : red;">한달</font> 내 예매한 내역만 출력됩니다.</span>
			</div>
			
			<ul class="myTicketing_list">
				<c:choose>
					<c:when test="${not empty myTicketing }">
						<c:forEach var="myHistory" items="${myTicketing }">
							<c:set var="movieinfo" value="${myMovieInfo.get(myHistory.movieListNum)}"/>
							<c:if test="${movieinfo.movieAge == '0'}"><c:set var="grAge" value="grade gr_all"/></c:if>
							<c:if test="${movieinfo.movieAge == '12'}"><c:set var="grAge" value="grade gr_12"/></c:if>
							<c:if test="${movieinfo.movieAge == '15'}"><c:set var="grAge" value="grade gr_15"/></c:if>
							<c:if test="${movieinfo.movieAge == '18'}"><c:set var="grAge" value="grade gr_18"/></c:if>
							<li>
								<div class="myTicketing_poster">
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
								<div class="detail_reserve1">
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
								<div class="detail_reserve2">
									<span class="detail_info">
										<strong>${myHistory.openDate}</strong>
									</span>
									<span class="detail_info">
										<strong>${myHistory.openTime}</strong>
									</span>
								</div>
								<div class="detail_reserve3">
									<span class="detail_info">
										<strong>관람 인원 </strong>
									</span>
									<span class="detail_info">
										<strong>${myHistory.people}명</strong>
									</span>
								</div>
								<dl class="cancel_box">
									<dt>취소 관련 주의사항</dt>
									<dd>예매취소는 신용카드로 결제한 내역만<br>가능합니다.</dd>
								</dl>
								
								<c:set var="present" value="<%=new java.util.Date() %>"/>
								<c:set var = "nowTime"><fmt:formatDate value="${present}" pattern ="yyyy-MM-dd-HH-mm"/></c:set>		
<!-- 							${nowTime } , ${btnTime.get(myHistory.ticketingNum)} 	 -->	
								<c:if test="${ nowTime < btnTime.get(myHistory.ticketingNum)}">								
									<div class="cancel_btn_area">
										<a href="#">
											<span>취소하기</span>
										</a>
									</div>
								</c:if>
							</li>
						</c:forEach>
					</c:when>	
					
					<c:otherwise>
						<li>
							<span class ="noContent">최근 관람내역이 없습니다.</span>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>			
			<div class="last_list"></div>	
		</div>
	</div>
</center>


