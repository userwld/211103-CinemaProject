<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.star.cinema.manage.dto.*" %>
<%@ page import="com.star.cinema.movie.dto.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>롯지브이</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seat.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
</head>
<body>
	<%
	TicketingInfoDTO ticket = (TicketingInfoDTO) session.getAttribute("selectTicket"); 
		  MovieDTO movie = ticket.getMovie();
		  HallDTO hall = ticket.getHall();
		  TimeInfoDTO time = ticket.getTime();
		  CinemaDTO cinema = ticket.getCinema();
	%>

    <div id="contents" class="contents_full contents_reserve">

        <div class="wrap_reserve">
            <h2 class="hidden">예매하기</h2>
            <div id="PersonSeatHeader" class="section_step_tit">
                <ul>
                    <li class="step01 prev" style="margin-left: 0">
                    	<a style="cursor: default;">
                    		<strong class="tit"><span>01</span><br>상영시간</strong>
                        </a>
                    </li>
                    <li class="step02 active">
                    	<a style="cursor: default;">
                    		<strong class="tit"><span>02</span><br>인원/좌석</strong>
                        </a>
                    </li>
                    <li class="step03">
                    	<a style="cursor: default;">
                    		<strong class="tit"><span>03</span><br>결제</strong>
                        </a>
                    </li>
                    <li>
                    	<a style="cursor: default;">
                    		<strong class="tit"><span>04</span><br>결제완료</strong>
                    	</a>
                    </li>
                </ul>
            </div>
            
            <div id="reserveStep01" class="section_step_con step01">
                <h3 class="hidden">상영시간</h3>
            </div>
            
            <div id="reserveStep02" class="section_step_con step02 active">
                <h3 class="hidden">인원/좌석</h3>

                <div class="select-container">
				<div class="select-wrapper">
					<div class="select-title">
						<div class="group_top">
		                	<h4 class="tit">예매정보</h4>
		                </div>
					</div>
					<div class="select-seat-container">
						<div class="select-seat-number-container">
							<div class="select-seat-number-wrapper">
								<div class="select-seat">
									<div class="select-seat-age">일반</div>
									<div class="select-seat-number">
										<ul class="select-seat-ul select-seat-ul-normal">
											<li class="select-number-normal ">0</li>
											<li class="select-number-normal">1</li>
											<li class="select-number-normal">2</li>
											<li class="select-number-normal">3</li>
											<li class="select-number-normal">4</li>
											<li class="select-number-normal">5</li>
										</ul>
									</div>
								</div>
								<div class="select-seat">
									<div class="select-seat-age">청소년</div>
									<div class="select-seat-number">
										<ul class="select-seat-ul select-seat-ul-teen">
											<li class="select-number-teen">0</li>
											<li class="select-number-teen">1</li>
											<li class="select-number-teen">2</li>
											<li class="select-number-teen">3</li>
											<li class="select-number-teen">4</li>
											<li class="select-number-teen">5</li>
										</ul>
									</div>
								</div>
								<div class="select-seat">
									<div class="select-seat-age">우대</div>
									<div class="select-seat-number">
										<ul class="select-seat-ul  select-seat-ul-old">
											<li class="select-number-old">0</li>
											<li class="select-number-old">1</li>
											<li class="select-number-old">2</li>
											<li class="select-number-old">3</li>
											<li class="select-number-old">4</li>
											<li class="select-number-old">5</li>
										</ul>
									</div>
								</div>
		
							</div>
							<div class="reserve-number-wrapper">
								<div class="reserve-number-title">선택된 좌석 수</div>
								<div class="reserve-number">0</div>
							</div>
						</div>
						<div class="select-seat-information">
							<div class="selected-movie"><%=movie.getMovieName() %></div>
							<div class="select-seat-information-wrapper">
								<div class="select-theater-place selected-theater-place-info cinema"><%=cinema.getCinemaName() %></div>
								<div style="width: 30px;" class="select-theater-place selected-theater-place-info hall"><%=hall.getHallName() %></div>
								<div class="select-theater-place">
									<span>남은좌석</span><span class="remain-seats">152</span>/<span class="all-seats">172</span>
								</div>
							</div>
							
							<div class="select-theater-date">
								<div class="theater-date"><%=time.getTicketDate() %></div>
								<div class="theater-time"><%=time.getStartTime() %></div>
							</div>

							<div class="selected-seats-wrapper">
								<span class="selected-seats-title">좌석번호</span> <span
									class="selected-seats">선택한 좌석이 없습니다.</span>
							</div>

							<div class="ticket-price-wrapper">
								<div class="ticket-price-title">가격</div>
								<div class="ticket-price">0원</div>
							</div>

							<form action="seatProc" class="seatForm" method="post">
								<input type="hidden" class="title" name="title" id="title">
								<input type="hidden" class="selectedTheater" name="selectedTheater" id="selectedTheater">
								<input type="hidden" class="reserveDate" name="reserveDate" id="reserveDate">
								<input type="hidden" class="runningTime" name="runningTime" id="runningTime">
								<input type="hidden" class="totalPrice" name="totalPrice" id="totalPrice">
								<!-- 티켓의수(선택한 좌석) -->
								<input type="hidden" class="ticketNumber" name="ticketNumber">
								<input type="hidden" class="selectedSeat" name="selectedSeat">
								
								<!-- 번호 정보 전달 -->
								<input type="hidden" class="hallName" name="hallName">
								<input type="hidden" class="moiveListName" name="moiveListName">
								<input type="hidden" class="cinemaName" name="cinemaName">
								
								<!-- 결제 정보 -->
								<input type="hidden" class="payMoney" name="payMoney">
								<button type="button" class="reserve-button">결제하기</button>
							</form>
						</div>
		
					</div>
						<div class="seat-container">
							<div class="seat-wrapper">
								<div class="screen-view-wrapper">
									<div class="screen-view">SCREEN</div>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>

            <div id="reserveStep03" class="section_step_con step03 ">
                <h3 class="hidden">결제</h3>
            </div>

            <div id="reserveStep04" class="section_step_con step04 ">
                <h3 class="hidden">결제완료</h3>
            </div>

        </div>

    </div>
</body>


<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/movie.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/seat.js"></script>
<script>
	$(document).ready(function(){ 
		<%List<String> seatList = (List<String>) session.getAttribute("reserveSeatList");
			if (session.getAttribute("reserveSeatList") != null) {%>
			remainSeat.innerHTML = 120 - <%=seatList.size()%>;
			<% for (String info : seatList) { %>
				$(<%=info%>).addClass('checked');
			<%}%>
		<%}%>
	});

	function refreshSeat() {
		<% if (session.getAttribute("reserveSeatList") != null) {%>
			let seat = document.querySelectorAll('.seat');
			remainSeat.innerHTML = seat.length - selectedSeatsArray.length - <%=seatList.size()%>;
		<%} else {%>
			remainSeat.innerHTML = seat.length - selectedSeatsArray.length;

		<%}%>
	}
</script>
</html>