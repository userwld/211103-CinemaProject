<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.star.cinema.manage.dto.*" %>
<%@ page import="com.star.cinema.movie.dto.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>롯지브이</title>
<script src="${pageContext.request.contextPath}/resources/js/movie.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pay.css" />
</head>

<body>
	<%
	TicketingInfoDTO tickets = (TicketingInfoDTO) session.getAttribute("selectTicket"); 
		  MovieDTO movie = tickets.getMovie();
		  HallDTO hall = tickets.getHall();
		  TimeInfoDTO time = tickets.getTime();
		  CinemaDTO cinema = tickets.getCinema();
	%>
	  
    <div id="contents" class="contents_full contents_reserve">
        <div class="wrap_reserve ">
			<h2 class="hidden">예매하기</h2>
					<div class="section_step_tit">
		                <ul>
		                    <li class="step01 prev" style="margin-left: 0">
		                    	<a style="cursor: default;">
		                    		<strong class="tit"><span>01</span><br>상영시간</strong>
		                        </a>
		                    </li>
		                    <li class="step02" style="background-color: #333;">
							    <a href="#" style="color: #fff;"><strong class="tit"><span>02</span><br>인원/좌석</strong>
								</a>
						    </li>
		                    <li class="step03 active">
		                    	<a href="#"><strong class="tit"><span>03</span><br>결제</strong>
						    	</a>
						    </li>
		                    <li>
		                    	<a style="cursor: default;">
		                    		<strong class="tit"><span>04</span><br>결제완료</strong>
		                    	</a>
		                    </li>
		                </ul>
					</div>

                <div id="reserveStep01" class="section_step_con step01 ">
                    <h3 class="hidden">상영시간</h3>
                </div>
                <div id="reserveStep02" class="section_step_con step02 ">
                    <h3 class="hidden">인원/좌석</h3>
                </div>
                <div id="reserveStep03" class="section_step_con step03 active">
                    <h3 class="hidden">결제</h3>
                    <div class="article article_sum_infor">
                        <div class="group_top">
                            <h4 class="tit">예매정보</h4>
                        </div>
                        <div class="inner">
                        <%TicketingDTO ticket = (TicketingDTO) session.getAttribute("seatList"); %>
                            <div class="movie_infor new2020">
                                <span class="thm">
                                    <img src="${pageContext.request.contextPath}/resources/images/poster/<%=movie.getMoviePoster()%>" alt="<%=movie.getMovieName()%>">
                                </span>
                                <strong class="tit">
                                <%if (movie.getMovieAge().equals("12")) { %>
									<span class="ic_grade gr_12">12세 관람가</span>
								<%} else if (movie.getMovieAge().equals("15")) { %>
									<span class="ic_grade gr_15">15세 관람가</span>
								<%} else if (movie.getMovieAge().equals("18")) { %>
									<span class="ic_grade gr_18">18세 관람가</span>
								<%} else { %>
									<span class="ic_grade gr_all">전체</span>
								<%} %>
                                &nbsp;<%=ticket.getMoiveName() %></strong>
                                <dl class="dlist_infor">
                                    <dt>일시</dt>
                                    <dd><strong><%=ticket.getOpenDate()%></strong></dd>
                                    <dt>영화관</dt>
                                    <dd><%=cinema.getCinemaName() %> - <%=hall.getHallName() %></dd>
                                    <dt>인원</dt>
                                    <dd><%=ticket.getPeople()%>명</dd>
                                </dl>
                            </div>
                            <div class="seat_infor">
                                <dl class="dlist_infor">
                                    <dt>좌석</dt>
                                    <dd><strong><%=ticket.getSeatName()%></strong></dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="article article_pay_method">
                        <div class="inner">
                            <div class="mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" data-mcs-theme="minimal-dark" style="position: relative; overflow: visible;">
                                <div id="mCSB_1" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" style="max-height: none;" tabindex="0">
                                    <div class="group_top">
                                    	<h4 class="tit">결제수단</h4>
                                    </div>
                                    <div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                                        <div class="group_saving_cash">
	                                        <div class="group_payment">
	                                            <h5 class="tit_payment">최종 결제수단</h5>
	                                            <div class="bx_cate">
	                                                <ul class="list_pay_item cate6">
	                                                    <li><button type="button" class="cate1 " id="card_chk" onclick="card_pay();">신용카드</button></li>
	                                                    <li><button type="button" class="cate3 " id="simple_chk" onclick="simple_pay();">간편결제</button></li>
	                                                    <li><button type="button" class="cate5 ty2 " id="my_chk" onclick="my_pay();">내통장결제</button></li>
	                                                    <li><button type="button" class="cate4 ty2 " id="phone_chk" onclick="phone_pay();">휴대폰</button></li>
	                                                </ul>
	                                            </div>
												<div class="article_pay_card" style="display: none;" id="card_payment">
												    <ul class="list_pay_item cate5">
												        <li><button id="chek_btn1" onclick="check_button(1);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_lotte.png" alt="롯데카드" class="mCS_img_loaded"></span><span class="tit">롯데카드</span></button></li>
												        <li><button id="chek_btn2" onclick="check_button(2);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_kb.png" alt="국민카드" class="mCS_img_loaded"></span><span class="tit">국민카드</span></button></li>
												        <li><button id="chek_btn3" onclick="check_button(3);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_kakao.png" alt="카카오뱅크" class="mCS_img_loaded"></span><span class="tit">카카오뱅크</span></button></li>
												        <li><button id="chek_btn4" onclick="check_button(4);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_shinhan.png" alt="신한카드" class="mCS_img_loaded"></span><span class="tit">신한카드</span></button></li>
												        <li><button id="chek_btn5" onclick="check_button(5);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_samsung.png" alt="삼성카드" class="mCS_img_loaded"></span><span class="tit">삼성카드</span></button></li>
												        <li><button id="chek_btn6" onclick="check_button(6);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_hyundai.png" alt="현대카드" class="mCS_img_loaded"></span><span class="tit">현대카드</span></button></li>
												        <li><button id="chek_btn7" onclick="check_button(7);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_hana.png" alt="하나카드" class="mCS_img_loaded"></span><span class="tit">하나카드</span></button></li>
												        <li><button id="chek_btn8" onclick="check_button(8);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_keb.png" alt="외환카드" class="mCS_img_loaded"></span><span class="tit">외환카드</span></button></li>
												        <li><button id="chek_btn9" onclick="check_button(9);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_woori.png" alt="우리카드" class="mCS_img_loaded"></span><span class="tit">우리카드</span></button></li>
												        <li><button id="chek_btn10" onclick="check_button(10);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_bc.png" alt="BC카드" class="mCS_img_loaded"></span><span class="tit">BC카드</span></button></li>
												        <li><button id="chek_btn11" onclick="check_button(11);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_citi.png" alt="씨티카드" class="mCS_img_loaded"></span><span class="tit">씨티카드</span></button></li>
												        <li><button id="chek_btn12" onclick="check_button(12);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_nh.png" alt="NH카드" class="mCS_img_loaded"></span><span class="tit">NH카드</span></button></li>
												        <li><button id="chek_btn13" onclick="check_button(13);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_jb.png" alt="전북카드" class="mCS_img_loaded"></span><span class="tit">전북카드</span></button></li>
												        <li><button id="chek_btn14" onclick="check_button(14);"><span class="thm"><img src="${pageContext.request.contextPath}/resources/images/movie/card_logo_kj.png" alt="광주카드" class="mCS_img_loaded"></span><span class="tit">광주카드</span></button></li>
												    </ul>
												</div>
												<div class="article_pay_simple" style="display: none;" id="simple_payment">
												    <ul class="list_pay_item cate3">
												        <li><button type="button" id="chek_btn15" class="pay_simple_btn_box" onclick="check_button(15);"><span class="pay_simple_thm"><img src="${pageContext.request.contextPath}/resources/images/movie/payment_simple_kakao.png" alt="카카오페이"></span><span class="pay_simple_tit">카카오페이</span></button></li>
												        <li><button type="button" id="chek_btn16" class="pay_simple_btn_box" onclick="check_button(16);"><span class="pay_simple_thm"><img src="${pageContext.request.contextPath}/resources/images/movie/payment_simple_payco.png" alt="페이코"></span><span class="pay_simple_tit">페이코</span></button></li>
												        <li><button type="button" id="chek_btn17" class="pay_simple_btn_box" onclick="check_button(17);"><span class="pay_simple_thm"><img src="${pageContext.request.contextPath}/resources/images/movie/payment_simple_npay.png" alt="네이버페이"></span><span class="pay_simple_tit">네이버페이</span></button></li>
												        <li><button type="button" id="chek_btn18" class="pay_simple_btn_box" onclick="check_button(18);"><span class="pay_simple_thm"><img src="${pageContext.request.contextPath}/resources/images/movie/payment_simple_toss.png" alt="토스"></span><span class="pay_simple_tit">토스</span></button></li>
												        <li><button type="button" id="chek_btn19" class="pay_simple_btn_box" onclick="check_button(19);"><span class="pay_simple_thm"><img src="${pageContext.request.contextPath}/resources/images/movie/payment_simple_chai.svg" alt="차이페이"></span><span class="pay_simple_tit">차이페이</span></button></li>
												        <li><button type="button" id="chek_btn20" class="pay_simple_btn_box" onclick="check_button(20);"><span class="pay_simple_thm"><img src="${pageContext.request.contextPath}/resources/images/movie/payment_simple_tbee.png" alt="모바일캐시비/티머니"></span><span class="pay_simple_tit">모바일캐시비/티머니</span></button></li>
												    </ul>
												</div>
	                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: none;">
                                    <div class="mCSB_draggerContainer">
                                        <div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
                                            <div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
                                        </div>
                                        <div class="mCSB_draggerRail"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="article article_payment">
                        <div class="group_top">
                            <h4 class="tit">결제하기</h4>
                        </div>
                        <div class="inner">
							<div class="select_item_wrap">
							    <div class="group_item active">
							        <div class="bx_item">
							        	<input type="checkbox" id="chkSavingTerm" onclick="selectAll();">
							        	<label for="chkSavingTerm" class="ty2">결제대행서비스 약관 동의</label>
							        </div>
							        <div class="group_side">
							            <div class="bx_provision">
							                <ul class="provision_list">
							                    <li><input type="checkbox" id="chkProvisionTerm01" name="select" onclick="agreeChk();"><label for="chkProvisionTerm01" class="ty2">전자금융거래 이용약관 동의</label><button class="btn_txt_more ty2">약관보기</button></li>
							                    <li><input type="checkbox" id="chkProvisionTerm02" name="select" onclick="agreeChk();"><label for="chkProvisionTerm02" class="ty2">고유식별정보 수집 및 이용안내</label><button class="btn_txt_more ty2">약관보기</button></li>
							                    <li><input type="checkbox" id="chkProvisionTerm03" name="select" onclick="agreeChk();"><label for="chkProvisionTerm03" class="ty2">개인정보 수집 및 이용동의</label><button class="btn_txt_more ty2">약관보기</button></li>
							                    <li><input type="checkbox" id="chkProvisionTerm04" name="select" onclick="agreeChk();"><label for="chkProvisionTerm04" class="ty2">개인정보 제3자 제공/위탁동의</label><button class="btn_txt_more ty2">약관보기</button></li>
							                </ul>
							            </div>
							        </div>
							    </div>
							</div>
                            <div class="payment_sum_wrap">
                                <dl>
                                    <dt>상품금액</dt>
                                    <dd><strong><%=ticket.getTotalPrice()%></strong>원</dd>
                                </dl>
                                <dl>
                                    <dt>결제금액</dt>
                                    <dd>총<strong><%=ticket.getTotalPrice()%></strong>원</dd>
                                </dl>
                                <a onclick="pay_final_chk();" class="btn_col1 btn_confirm">결제하기</a>
                            	
                            </div>
                        </div>
                    </div>
                </div>
                <div id="reserveStep04" class="section_step_con step04 ">
                    <h3 class="hidden">결제완료</h3>
                </div>
			</div>
        </div>

    <!-- popup : 추가상품구매 -->
    <div id="layerAddprodbuy" class="layer_wrap layer_pay_addprodbuy_infor"></div>
    
    <!-- //popup : 추가상품구매 -->
	<div id="layerNoticePopup" class="layer_wrap layer_Combi_Notice"></div>
	
</body>

</html>