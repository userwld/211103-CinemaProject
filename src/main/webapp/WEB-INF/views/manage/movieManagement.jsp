<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.star.cinema.movie.dto.*" %>
    
        <!DOCTYPE html>
        <html>

        <head>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/css/materialize.min.css" />
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
            <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
            <script src="https://code.jqeury.com/ui/1.12.1/jquery-ui.js"></script>
            <script>
                $(document).ready(function () {
                    $('.slider').slider();
                });
            </script>
        </head>
        <body>
            <div class="slider" style="z-index: 1;">
                <ul class="slides" style="height: 450px;">
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide1.jpg">
                        <div class="caption center-align"></div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide2.jpg">
                        <div class="caption left-align"></div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide3.jpg">
                        <div class="caption right-align"></div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide4.jpg">
                        <div class="caption center-align"></div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/resources/images/main/slide/slide5.jpg">
                        <div class="caption center-align"></div>
                    </li>
                </ul>
            </div>
            <div id="contents" class="contents_movie_list">
	            <%if (session.getAttribute("movieSelect") != null) { 
	              MovieDTO movie = (MovieDTO) session.getAttribute("movieSelect");
	            %>
	            <div class="movie_input_box">
                	<ul class="tab_btn_type1">
                        <li class="active">
                            <button type="button" onclick="javascript:location.href='index?formpath=movieManagement';">
                                <span class="now_span" style="color: black;">영화 정보 수정</span>
                            </button>
                        </li>
                    </ul>
	                    <div class="subject __underline" style="border-bottom: 1px solid #000;"></div><br>
		                    <div class= "input_field" style ="width: 60%">
                    			<form id="movieInfoForm" action="movieInfoInsert" method="post">
									<label style="padding-right: 50px">영화 이름</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 이름을 입력하세요." name="name" id="name"><%=movie.getMovieName() %></textarea>
									
								<br>
									<label style="padding-right: 50px">영화 이미지 이름</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 이미지 이름을 입력하세요." name="poster" id="poster"><%=movie.getMoviePoster() %></textarea>
									
								<br>
									<label style="padding-right: 50px">영화 장르</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 장르를 입력하세요." name="genre" id="genre"><%=movie.getMovieGenre() %></textarea>
									
								<br>
									<label style="padding-right: 50px">영화 감독</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 감독을 입력하세요." name="director" id="director"><%=movie.getMovieDirector() %></textarea>
									
								<br>
									<label style="padding-right: 50px">영화 연령</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 연령을 입력하세요." name="age" id="age"><%=movie.getMovieAge() %></textarea>
									
								<br>
									<label style="padding-right: 50px">영화 국가</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 국가를 입력하세요." name="country" id="country"><%=movie.getMovieCountry() %></textarea>
								<br>
									<label style="padding-right: 50px">영화 시간</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 러닝 타임을 입력하세요." name="time" id="time"><%=movie.getMovieTime() %></textarea>
									
								<br>
									<label style="padding-right: 38px">영화 출연자</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 출연자를 입력하세요." name="actors" id="actors"><%=movie.getMovieActors() %></textarea>
								<br>
									<label style="padding-right: 38px">영화 개봉일</label>
									<input type="date" placeholder="영화 개봉일을 선택하세요." name="open" id="open" value=<%=movie.getMovieOpen()%>>
								<br>
									<label style="padding-right: 38px">영화 상세 설명</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 설명을 입력하세요." name="detail" id="detail"><%=movie.getMovieDetail() %></textarea>
								<br>
                    			</form>
							</div>
						</div>
					<input type="button" value="영화 수정" onclick="movieInfoResult(false)" style=" width:200px; height:100px; margin: -500px 0 0 700px; background-color: red; text-align : center; border-color: transparent; color: white; font-weight: bold; cursor:  pointer;">
					<input type="button" value="취소" onclick="movieInfoResult(true)" style=" width:200px; height:100px; margin: -300px 0 0 700px; background-color: gray; text-align : center; border-color: transparent; color: white; font-weight: bold; cursor:  pointer;">
            	</div>
	            <%} else { %>
                <h2 class="hidden">영화목록</h2>
                <div class="movie_screen_box">
                    <ul class="tab_btn_type1">
                        <li class="active">
                            <button type="button" onclick="javascript:location.href='index?formpath=movieManagement';">
                                <span class="now_span" style="color: black;">상영중인 영화 목록</span>
                            </button>
                        </li>
                    </ul>
					<div class="subject __underline" style="border-bottom: 1px solid #000;"></div>
					<br><br>
                    <ul class="movie_list type2" id="nowInfo">
                    	<%int index = 1; %>
                    	<c:forEach var="movieListInfo" items="${movieList}">
	                    	<li class="screen_add_box">
	                            <div class=movieBg style="background-size:200px; border-radius:5px; background-image:url('${pageContext.request.contextPath}/resources/images/poster/${movieListInfo.moviePoster }');" onmouseover="movieOpacity(<%=index %>);" onmouseout="moiveOpacityReset(<%=index %>);">
	                                <div class=<%="movieBtn"+index %>>
	                                    <button id="movieReserve_btn" style="display: none;" class=<%="reserve_btn"+index %> onclick="movieInfoChange('${movieListInfo.movieName}', '${pageContext.request.contextPath}/resources/images/poster/${movieListInfo.moviePoster }');">영화 정보 수정</button>
	                                    <button id="movieDetail_btn" style="display: none;" class=<%="detail_btn"+index %> onclick="movieInfoDelete('${movieListInfo.movieName}', '${pageContext.request.contextPath}/resources/images/poster/${movieListInfo.moviePoster }');">영화 정보 삭제</button>
	                                </div>
	                            </div>
	                            <div class="btm_info">
	                                <strong class="tit_info">${movieListInfo.movieName }</strong>

	                            </div>
	                        </li>
                       		<%index++;%>
                    	</c:forEach>
                    </ul>
                </div>
                <br>
                <h2 class="hidden">영화정보 넣기</h2>
                <div class="movie_input_box">
                	<ul class="tab_btn_type1">
                        <li class="active">
                            <button type="button" onclick="javascript:location.href='index?formpath=movieManagement';">
                                <span class="now_span" style="color: black;">영화 정보 넣기</span>
                            </button>
                        </li>
                    </ul>
	                    <div class="subject __underline" style="border-bottom: 1px solid #000;"></div><br>
		                    <div class= "input_field" style ="width: 60%">
                    			<form id="movieInfoForm" action="movieInfoInsert" method="post">
									<label style="padding-right: 50px">영화 이름</label>
									<input type="text" placeholder="영화 이름을 입력하세요."name="name" id="name">
								<br>
									<label style="padding-right: 50px">영화 이미지 이름</label>
									<input type="text" placeholder="영화 이미지 이름을 입력하세요."name="poster" id="poster">
								<br>
									<label style="padding-right: 50px">영화 장르</label>
									<input type="text" placeholder="영화 장르를 입력하세요."name="genre" id="genre">
								<br>
									<label style="padding-right: 50px">영화 감독</label>
									<input type="text" placeholder="영화 감독을 입력하세요." name="director" id="director">
								<br>
									<label style="padding-right: 50px">영화 연령</label>
									<input type="number" placeholder="영화 연령을 입력하세요."name="age" id="age">
								<br>
									<label style="padding-right: 50px">영화 국가</label>
									<input type="text" placeholder="영화 국가를 입력하세요."name="country" id="country">
								<br>
									<label style="padding-right: 50px">영화 시간</label>
									<input type="number" placeholder="영화 러닝 타임을 입력하세요."name="time" id="time">
								<br>
									<label style="padding-right: 38px">영화 출연자</label>
									<input type="text" placeholder="영화 출연자를 입력하세요." name="actors" id="actors">
								<br>
									<label style="padding-right: 38px">영화 개봉일</label>
									<input type="date" placeholder="영화 개봉일을 선택하세요." name="open" id="open">
								<br>
									<label style="padding-right: 38px">영화 상세 설명</label>
									<textarea rows="30" cols="60" style="min-height: 50px;" placeholder="영화 설명을 입력하세요." name="detail" id="detail"></textarea>
								<br>
                    			</form>
							</div>
						</div>
					<input type="button" value="영화 등록" onclick="InputMovieInfo()" style=" width:200px; height:100px; margin: -400px 0 0 700px; background-color: gray; text-align : center; border-color: transparent; color: white; font-weight: bold; cursor:  pointer;">
            	</div>
            <%} %>
        </body>
        
        <script src="<c:url value="/resources/js/movie.js" />"></script>

        </html>