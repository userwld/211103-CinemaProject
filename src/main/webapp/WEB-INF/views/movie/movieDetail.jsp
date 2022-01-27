<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/css/materialize.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/movieDetail.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />

<script src="${pageContext.request.contextPath}/resources/js/movieDetail.js"></script>
<title>영화 - 상세정보 및 리뷰</title>

<script>
$(document).ready(function(){
  $('.slider').slider();
});
</script>

<!-- 스틸컷 -->
<c:set var="stillArr" value="${movie.moviePoster.split('\\\.')}"/>
  
<c:set var ="still1" value="${stillArr[0]}_1.${stillArr[1]}"/>
<c:set var ="still2" value="${stillArr[0]}_2.${stillArr[1]}"/>
<c:set var ="still3" value="${stillArr[0]}_3.${stillArr[1]}"/>
<c:set var ="still4" value="${stillArr[0]}_4.${stillArr[1]}"/>
<c:set var ="still5" value="${stillArr[0]}_5.${stillArr[1]}"/>


<div id="slide_wrap" style="height: 653px; width: 100%; background-color: black;">
<div class="slider" style="z-index: 1; height: 653px; width: 980px;">
		<ul class="slides" style="height: 653px; width: auto;">
			<li>			
				<img src="${pageContext.request.contextPath}/resources/images/stillcut/${still1}" width="auto;" height="653px;">
				<div class="caption center-align"></div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/resources/images/stillcut/${still2}" width="auto;" height="653px;">
				<div class="caption center-align"></div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/resources/images/stillcut/${still3}" width="auto;" height="653px;">
				<div class="caption center-align"></div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/resources/images/stillcut/${still4}" width="auto;" height="653px;">
				<div class="caption center-align"></div>	
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/resources/images/stillcut/${still5}" width="auto;" height="653px">
				<div class="caption center-align"></div>
			</li>
		</ul>
	</div>
</div>
	<script src="<c:url value="/resources/js/main.js" />"></script>

<center>
	<div class="content" >
		<div class="detail_top">
			<div class="detail_poster">
				<img src="${pageContext.request.contextPath}/resources/images/poster/${movie.moviePoster}">
			</div>
			<div class="detail_title">
				<c:if test="${movie.movieAge == '0'}"><c:set var="grAge" value="grall"/></c:if>
				<c:if test="${movie.movieAge == '12'}"><c:set var="grAge" value="gr12"/></c:if>
				<c:if test="${movie.movieAge == '15'}"><c:set var="grAge" value="gr15"/></c:if>
				<c:if test="${movie.movieAge == '18'}"><c:set var="grAge" value="gr18"/></c:if>
				
				<span class="grade ${grAge}">
					<c:choose>
					<c:when test="${movie.movieAge == '0' }">
						전체
					</c:when>
					<c:when test="${movie.movieAge == '18' }">
						청불
					</c:when>
					<c:otherwise>
						${movie.movieAge }
					</c:otherwise>
					</c:choose>
				</span>
				<strong>${movie.movieName }</strong>
			</div>
			<ul class="detail_info1">
				<li class="sub_info1">
					<em>관람객 평점</em>
					<strong class="score">
						<em>평점</em>
						<strong><fmt:formatNumber value="${totalGrade}" type="number" maxFractionDigits="1" minFractionDigits="1"/></strong>
					</strong>
				</li>
				<li class="sub_info2">
					<em>예매율 <fmt:formatNumber value="${ticketingRank[0]}" type="number" maxFractionDigits="0"/>위</em>	
					<strong class="str"><fmt:formatNumber value="${ticketingRank[1]}" type="number" maxFractionDigits="1" minFractionDigits="1"/>%</strong>
				</li>
			</ul>
			<ul class="detail_info2">
				<li class="sub_info1">
					<em class="tit">장르</em>
					<strong>
						<em>${movie.movieGenre } / ${movie.movieCountry}</em>
						<em class="line">|</em>
						<em>${movie.movieOpen } 개봉</em>
						<em class="line">|</em>
						<em>${movie.movieTime } 분</em>					
					</strong>
				</li>
				<li class="sub_info2">
					<em class="tit">감독</em>
					<strong>
						<em>${movie.movieDirector }</em>
					</strong>
				</li>
				<li class="sub_info3">
					<em class="tit">출연</em>
					<strong>
						<em>${movie.movieActors }</em>
					</strong>
				</li>
			</ul>
			
			<div class="btn_area">
				<ul>
					<li>
						<button class="movieLikeBtn" onclick="likeCalc(${movie.movieListNum}, ${totalLike });">
							<strong>좋아요</strong>
							<em id="likeCtrl">${totalLike}</em>
						</button>
					</li>
					<li>
						<a class="reserve_a" href='index?formpath=ticketing'>예매하기</a>
					</li>				
				</ul>
			</div>
				
			<div class="tab_con">
				<div class="tab_info1">
					<div class="left_con">
						<strong class="tit_info">시놉시스</strong>
						<textarea readonly="readonly" class="story">${movie.movieDetail }</textarea>
					</div>
										
					<div class="right_con">
						<strong class="tit_info">관람 선호도</strong>
						<div class="group_graph">
						 	<div class="bx_graph01">
						 		<div class="bg"></div>
						 		<dl>
						 			<dt class="mal">남성</dt>
									<dd class="mal">
									<c:set var="fmtpreferM"><fmt:formatNumber value="${prefer[1]}" type="number" maxFractionDigits="1" minFractionDigits="1"/></c:set>
										<span class="bar" style="height: ${fmtpreferM}%;"></span>										
										<strong>
											${fmtpreferM}
											<span>%</span>
										</strong>
									</dd>
									<dt class="fe">여성</dt>
									<dd class="fe">
									<c:set var="fmtpreferW"><fmt:formatNumber value="${prefer[0]}" type="number" maxFractionDigits="1" minFractionDigits="1"/></c:set>
										<span class="bar" style="height: ${fmtpreferW}%;"></span>
										<strong>
											${fmtpreferW}
											<span>%</span>
										</strong>
									</dd>
						 		</dl>
						 	</div>
						 	
						 	<div class="bx_graph02">
						 	<c:set var="fmtprefer10"><fmt:formatNumber value="${ageList[0]}" type="number" maxFractionDigits="1" minFractionDigits="1"/></c:set>
						 	<c:set var="fmtprefer20"><fmt:formatNumber value="${ageList[1]}" type="number" maxFractionDigits="1" minFractionDigits="1"/></c:set>
						 	<c:set var="fmtprefer30"><fmt:formatNumber value="${ageList[2]}" type="number" maxFractionDigits="1" minFractionDigits="1"/></c:set>
						 	<c:set var="fmtprefer40"><fmt:formatNumber value="${ageList[3]}" type="number" maxFractionDigits="1" minFractionDigits="1"/></c:set>
						 		<dl>
						 			<dt class="gen10">10대</dt>
						 			<dd class="gen10" style="height: ${fmtprefer10 }%;">
						 				<span class="bar"></span>
						 				<strong>
						 					${fmtprefer10 }
						 					<span>%</span>
						 				</strong>
						 			</dd>
						 			
						 			<dt class="gen20">20대</dt>
						 			<dd class="gen20" style="height: ${fmtprefer20 }%;">
						 				<span class="bar"></span>
						 				<strong>
						 					${fmtprefer20 }
						 					<span>%</span>
						 				</strong>
						 			</dd>
						 			
						 			<dt class="gen30">30대</dt>
						 			<dd class="gen30" style="height: ${fmtprefer30 }%;">
						 				<span class="bar"></span>
						 				<strong>
						 					${fmtprefer30 }
						 					<span>%</span>
						 				</strong>
						 			</dd>
						 			
						 			<dt class="gen40">40대이상</dt>
						 			<dd class="gen40" style="height: ${fmtprefer40 }%;">
						 				<span class="bar"></span>
						 				<strong>
						 					${fmtprefer40 }
						 					<span>%</span>
						 				</strong>
						 			</dd>
						 		</dl>
						 	</div>						 	
						</div>					
					</div>
				</div>
			</div>		
		</div>
	
	<div class="review_box">
		<div class="score_box">
			<span class="score_ty">
				<em class="score_tit">총 평점</em>
				<strong><fmt:formatNumber value="${totalGrade}" type="number" maxFractionDigits="1" minFractionDigits="1"/></strong>
				<em class="slash">/</em>
				<span>10</span>
			</span>
		</div>
	
		<div class="star_score_box">
			<strong class="score_info">
				<em id="myScore">1</em>점
			</strong>
		
			<div class="star_rate">
			  <span class="starR on" id="star1" onclick="myStar(1);">별1</span>
			  <span class="starR" id="star2" onclick="myStar(2);">별2</span>
			  <span class="starR" id="star3" onclick="myStar(3);">별3</span>
			  <span class="starR" id="star4" onclick="myStar(4);">별4</span>
			  <span class="starR" id="star5" onclick="myStar(5);">별5</span>
			  <span class="starR" id="star6" onclick="myStar(6);">별6</span>
			  <span class="starR" id="star7" onclick="myStar(7);">별7</span>
			  <span class="starR" id="star8" onclick="myStar(8);">별8</span>
			  <span class="starR" id="star9" onclick="myStar(9);">별9</span>
			  <span class="starR" id="star10" onclick="myStar(10);">별10</span>
			</div>
		</div>
			
		</div>
		<div class="reviewBox">
			<textarea class="review_txt" id="review_txt" placeholder="평점 및 영화 관람평을 작성해주세요. 주제와 무관한 리뷰 또는 스포일러는 표시제한 또는 삭제될 수 있습니다."></textarea>
		</div>
		<input type="button" class="btn_submit" value="관람평 작성" onclick="reivewWrite(${movie.movieListNum});">
	</div>
		
	<div class="review_list">
		<div class="review_top">
			<div class="total_info">총<em>${grade.size()}</em>건</div>
		</div>
		
	<ul class="reivew_con_list">
		<c:choose>
			<c:when test="${grade.isEmpty() == false }">
				<c:forEach var="gr" items="${grade }">			
					<c:choose>
						<c:when test="${gr.grade >= 9}"><c:set var="img_gr" value="rev_1.png"/></c:when>
						<c:when test="${gr.grade >= 7}"><c:set var="img_gr" value="rev_2.png"/></c:when>
						<c:when test="${gr.grade >= 5}"><c:set var="img_gr" value="rev_3.png"/></c:when>
						<c:when test="${gr.grade >= 3}"><c:set var="img_gr" value="rev_4.png"/></c:when>
						<c:when test="${gr.grade >= 1}"><c:set var="img_gr" value="rev_5.png"/></c:when>
					</c:choose>							
					<li>
						<span class="img_info"><img src="${pageContext.request.contextPath}/resources/images/movie/${img_gr}"></span>
						<div class="top_info">
							<span class="name_info">${gr.name }</span>
							<span class="score_ty2">
								<em>평점</em>
								<strong>${gr.grade}</strong>
							</span>
						</div>
						<div class="review_info">${gr.review}</div>
						<div class="btm_info">
							<span class="date_info">${gr.regDate} 등록</span>		<!-- 리뷰삭제 -작성자와 관리자만 가능 -->
							<c:if test="${loginInfo.id == gr.id or loginInfo.id == 'admin'}">
								<span class="reviewDelete" onclick="reviewDelete(${movie.movieListNum});">삭제</span>
							</c:if>	
						</div>
						
					</li>
				</c:forEach>
			</c:when>
			<c:otherwise>				
				<li>
					<span class="img_info"><img src="${pageContext.request.contextPath}/resources/images/movie/rev_4.png"></span>
						<div class="review_info">아직 등록된 리뷰가 없습니다.</div>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	
	</div>
	
</center>	

		

		

	
