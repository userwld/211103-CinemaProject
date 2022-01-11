

<%@page import="com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="com.star.cinema.manage.dto.*" %>
<%@ page import="com.star.cinema.movie.dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mCustomScrollbar.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content_lc21new.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dev.css" />
		
		<script src="${pageContext.request.contextPath}/resources/js/ticketting.js"></script>
</head>
<body>
    <div id="contents" class="contents_full contents_reserve" style="">
        <div class="wrap_reserve">
            <h2 class="hidden">예매하기</h2>
            <div class="section_step_tit">
                <ul>
                    <li class="active step01"><a href="#reserveStep01"><strong class="tit"><span>01</span><br>상영시간</strong></a></li>
                    <li class="disabled"><a style="cursor: default;"><strong class="tit"><span>02</span><br>인원/좌석</strong></a></li>
                    <li class="disabled"><a style="cursor: default;"><strong class="tit"><span>03</span><br>결제</strong></a></li>
                    <li class="disabled"><a style="cursor: default;"><strong class="tit"><span>04</span><br>결제완료</strong></a></li>
                </ul>
            </div>
            <div id="reserveStep01" class="section_step_con step01 active">
                <h3 class="hidden">상영시간</h3>
                <div class="article article_cinema">
                    <div class="group_top">
                        <h4 class="tit">영화관</h4>
                    </div>
                    <div class="inner">
                        <ul class="tab_wrap outer">
                            <li class="active">
                                <div class="tab_con">
                                    <h5 class="hidden">전체</h5>
                                    <div class="cinema_select_wrap cinemaSelect basicCinema">
                                        <ul>
                                        <c:forEach var="country" items="${countryList }" varStatus="status">
                                        	<c:choose>
                                        		<c:when test="${status.count == 1}"> 
                                        			<li class="depth1 active"> 
                                        		</c:when>
	                                        	<c:otherwise>
	                                        		<li class="depth1">
	                                        	</c:otherwise>
                                        	</c:choose>
                                            
                                            <a href="#none">${country}</a>
                                                <div class="depth2">
                                                    <div class="mCustomScrollbar basicCinemaScroll _mCS_${status.count} mCS-autoHide" data-mcs-theme="minimal-dark" style="position: relative; overflow: visible;">
                                                        <div id="mCSB_${status.count}" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" style="max-height: none;" tabindex="0">
                                                            <div id="mCSB_${status.count}_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
                                                                <ul>
                                                                	<c:forEach var="cinema" items="${cinemaList }">
																		<c:if test="${cinema.countryName eq country}">
																			<li class="cinema"><a href="#" onclick="selectCinema('${cinema.cinemaName}');">${cinema.cinemaName}</a></li>
																		</c:if>
																	</c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div id="mCSB_${status.count}_scrollbar_vertical" class="mCSB_scrollTools mCSB_${status.count}_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
                                                            <div class="mCSB_draggerContainer">
                                                                <div id="mCSB_${status.count}_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 628px; max-height: 719px; top: 0px;">
                                                                    <div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
                                                                </div>
                                                                <div class="mCSB_draggerRail"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                        </ul>
                                    </div>
                                    
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="article article_movie">
                    <div class="group_top">
                        <h4 class="tit movie_name">영화 선택</h4>
                    </div>
                    <div class="inner">
                        <div class="movie_select_wrap list movieSelect">
                            <div class="mCustomScrollbar movieScroll _mCS_9 mCS-autoHide" data-mcs-theme="minimal-dark" style="position: relative; overflow: visible;">
                                <div id="mCSB_9" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" tabindex="0" style="max-height: none;">
                                    <div id="mCSB_9_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
                                        <ul>
                                        <c:forEach var="movie" items="${movieList }" varStatus="status">
                                            	<li class="movieSel">
                                         			<a href="#none">
                                                    	<div class="bx_thm"> </div>
                                                    	<div class="group_infor">
                                                        <div class="bx_tit">
                                                        	<c:choose>
                                                        		<c:when test="${movie.movieAge == 12}"> <span class="ic_grade gr_12">12세 관람가</span> </c:when>
                                                        		<c:when test="${movie.movieAge == 15}"> <span class="ic_grade gr_15">15세 관람가</span> </c:when>
                                                        		<c:when test="${movie.movieAge == 18}"> <span class="ic_grade gr_18">18세 관람가</span> </c:when>
                                                        		<c:otherwise> <span class="ic_grade gr_all">0세 관람가</span> </c:otherwise>
                                                        	</c:choose>
                                                        	<strong class="tit" onclick="selectMovie('${movie.movieName}')">${movie.movieName}</strong>
                                                        </div>
                                                    </div>
                                                </a></li>
                                        </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div id="mCSB_9_scrollbar_vertical" class="mCSB_scrollTools mCSB_9_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
                                    <div class="mCSB_draggerContainer">
                                        <div id="mCSB_9_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 258px; max-height: 720px; top: 0px;">
                                            <div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
                                        </div>
                                        <div class="mCSB_draggerRail"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="article article_time">
                    <div class="group_top" id="dateInfo">
                        <h4 class="tit">
                        	<% String selectDate = (String) session.getAttribute("selectDate");%>
                        	<%=selectDate %>
                        
                        </h4>
                    </div>
                    <div class="inner">
                        <div class="date_select_wrap dateReserveWrap">
                            <div class="slide_wrap slide_reserve_date">
                                <ul class="owl-carousel owl-loaded owl-drag">
                                    <div class="owl-stage-outer">
                                        <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1470px;">
                                        	<%
		                                    LocalDate start = LocalDate.now();
		                                    LocalDate end = start.plusDays(7);
		                                    
		                                    LocalDate next = start.minusDays(1);
		                                    while ((next = next.plusDays(1)).isBefore(end.plusDays(1))) {
												    String dayOfWeek = "";
                                                	switch(next.getDayOfWeek().getValue()) {
	                                                	case 1:
	                                                		dayOfWeek = "월";
	                                                		break;
	                                                	case 2:
	                                                		dayOfWeek = "화";
	                                                		break;
	                                                	case 3:
	                                                		dayOfWeek = "수";
	                                                		break;
	                                                	case 4:
	                                                		dayOfWeek = "목";
	                                                		break;
	                                                	case 5:
	                                                		dayOfWeek = "금";
	                                                		break;
	                                                	case 6:
	                                                		dayOfWeek = "토";
	                                                		break;
	                                                	case 7:
	                                                		dayOfWeek = "일";
	                                                		break;
                                                	}
                                                	if (start.getDayOfMonth() == next.getDayOfMonth()) {
                                                		dayOfWeek = "오늘";
                                                	} %>
		                                   <div class="owl-item active" style="width: 52.5px;">
	                                            <li class="item">
	                                                <%if (dayOfWeek.equals("오늘")) { %>
	                                                	<strong class="month"><%=start.getMonthValue()%>월</strong>
	                                                <%} %>
	                                                <%if (dayOfWeek.equals("일")) { %>
	                                                	<span class="date sun">
	                                                <%} else if (dayOfWeek.equals("토")) { %>
	                                                	<span class="date sat">
	                                                <%} else {%>
	                                                	<span class="date">
	                                                <%} %>
	                                                <label>
	                                                <% if (dayOfWeek.equals("오늘")) { %>
	                                                	<input type="radio" name="radioDate1" data-displayyn="Y" data-playdate=<%=next %> data-isplaydate="Y" data-playweek=<%=dayOfWeek%> checked="checked" onclick="selectDate('<%=next%>');">
	                                                <% } else {%>
	                                                	<input type="radio" name="radioDate1" data-displayyn="Y" data-playdate=<%=next %> data-isplaydate="Y" data-playweek=<%=dayOfWeek%> onclick="selectDate('<%=next%>');">
	                                                <% } %>
	                                                <strong><%=next.getDayOfMonth() %></strong>
                                                	<em><%=dayOfWeek %> </em>
                                                	</label>
                                                </span>
                                                </li>
                                            </div>
		                                    <% } %>
                                        </div>
                                    </div>
                                </ul>
                            </div>
                        </div>
                        <ul class="tab_wrap outer sml">
                            <li class="active">
                                <div class="tab_con ty5">
                                    <h5 class="hidden">전체</h5>
                                    <div class="mCustomScrollbar timeScroll _mCS_11 mCS-autoHide mCS_no_scrollbar" data-mcs-theme="minimal-dark" style="position: relative; overflow: visible;">
                                        <div id="mCSB_11" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" style="max-height: none;" tabindex="0">
                                            <div id="mCSB_11_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr" >
                                            	<div id ="timeInfo">
                                            	<%
                                            	ArrayList<TicketingInfoDTO> timeInfoList = (ArrayList<TicketingInfoDTO>) session.getAttribute("timeInfoList");
                                            	ArrayList<MovieDTO> movieInfoList = (ArrayList<MovieDTO>) session.getAttribute("movieList");
                                            	                                            	  
                                            	if (session.getAttribute("timeInfoList") == null || session.getAttribute("movieList") == null) {
                                            	%>
		                                                <div class="bx_notice">
		                                                    <p>조회 가능한 상영시간이 없습니다.</p>
		                                                    <p>조건을 변경해주세요.</p>
		                                                </div>
                                                <%
                                                } else {
                                                %>
                                                	<%
                                                	for (MovieDTO movie : movieInfoList) {
                                                	%>
		                                                <div class="group_time_select">
													    	<div class="time_select_tit">
													    		<%if (movie.getMovieAge().equals("12")) { %>
													    			<span class="ic_grade gr_12">12세 관람가</span>
																<%} else if (movie.getMovieAge().equals("15")) { %>
													    			<span class="ic_grade gr_15">15세 관람가</span>
																<%} else if (movie.getMovieAge().equals("18")) { %>
													    			<span class="ic_grade gr_18">18세 관람가</span>
																<%} else { %>
													    			<span class="ic_grade gr_all">전체</span>
																<%} %>
													    		<strong><%=movie.getMovieName() %></strong>
													    	</div>
													    <div class="time_select_wrap timeSelect">
													        <ul class="list_time">
													        	<%for (TicketingInfoDTO time : timeInfoList) { 
													        		if (time.getMovie().getMovieName().equals(movie.getMovieName())) {%>
													            	<li class="">
													            		<a role="button" href="#none" onclick="selectTime('<%=time.getTime().getTicketDate() %>', '<%=time.getTime().getStartTime() %>','<%=time.getCinema().getCinemaNum() %>', '<%=time.getHall().getHallNum() %>', '<%=time.getTime().getTimeInfoNum()%>', '<%=movie.getMovieName()%>','<%=movie.getMovieAge()%>', <%=time.getReservingSeat() %>, <%=movie.getMovieListNum()%>,'${pageContext.request.contextPath}/resources/images/poster/<%=movie.getMoviePoster()%>');">
													                    <dl>
													                        <dt>상영시간</dt>
													                        <dd class="time">
													                        	<strong><%=time.getTime().getStartTime() %></strong>
													                            <div class="tooltip">종료 <%=time.endTime() %></div>
													                        </dd>
													                        <dt>잔여석</dt>
													                        <dd class="seat"><strong><%=time.getReservingSeat() %></strong> / 120</dd>
													                        <dt>상영관</dt>
													                        <dd class="hall"><%=time.getHall().getHallName() %></dd>
													                    </dl>
													                </a></li>
													            <% } } %>
													        </ul>
													    </div>
													    <% } %>
												    <% }%>
												</div>
                                            </div>
                                            </div>
                                        </div>
                                        <div id="mCSB_11_scrollbar_vertical" class="mCSB_scrollTools mCSB_11_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: none;">
                                            <div class="mCSB_draggerContainer">
                                                <div id="mCSB_11_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
                                                    <div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
                                                </div>
                                                <div class="mCSB_draggerRail"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>