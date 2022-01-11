<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>롯지브이</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/css/materialize.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<script src="${pageContext.request.contextPath}/resources/js/cinemaManagement.js"></script>
</head>
<body>
	<div id="contents" class="contents_customer">
		<div class="title_top">
			<h2 class="tit">영화관 관리</h2>
		</div>
			<ul class="tab_wrap outer">
				<li class="active">
					<div class="tab_con ty2">
						<h3 class="hidden">FAQ</h3>
						<form action="cinemaListProc" method="post">
							<fieldset class="search_wrap ty2">
								<legend>영화관 FAQ 검색하기</legend>
								<input type="text" name="search" placeholder="지점을 입력해주세요." id="searchKeyword" title="검색어를 입력해주세요">
								<button type="submit" name='searchBtn' class="btn_col2">검색</button>
							</fieldset>
						</form>
						<table class="tb_acc_wrap" summary="FAQ 표입니다. 구분, 질문 순서로 행이 구성되어 있습니다.">
							<caption>FAQ</caption>
							<colgroup>
								<col style="width: 20%;">
								<col style="width: auto;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="thead0">번호</th>
									<th scope="col" id="thead1">지역</th>
									<th scope="col" id="thead1">지점</th>
									<th scope="col" id="thead1">삭제하기</th>
								</tr>
							</thead>
							<tbody id="tab">
							<c:forEach var="cinema" items="${cinemaLists }">
								<tr class="acc_head" aria-expanded="false" role="button" id="tr_180">
									<td id="row0" headers="thead0">${cinema.getCinemaNum() }</td>
									<td id="row0" headers="thead0">${cinema.getCountryName() }</td>
									<td id="row0" headers="thead0">${cinema.getCinemaName() }</td>
									<td style="cursor: pointer;" id="row0" headers="thead0" onclick="cinemaDelete('${cinema.getCinemaNum() }')">삭제</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					<h2 class="hidden">영화관 추가</h2>
	                <div class="movie_input_box" style="margin-top: 80px;">
	                	<ul class="tab_btn_type1">
	                        <li class="active">
	                            <button type="button" onclick="javascript:location.href='index?formpath=cinemaList';">
	                                <span class="now_span" style="color: black;">영화관 추가</span>
	                            </button>
	                        </li>
	                    </ul>
	                    <div class="subject __underline" style="border-bottom: 1px solid #000;"></div><br>
	                    	<div class= "input_field" style ="width: 60%">
								<label style="padding-right: 50px">지역명</label>
								<input type="text" placeholder="지역을 입력하세요." maxlength="40" id="input-country-name"><br>
								<label style="padding-right: 50px">지점명</label>
								<input type="text" placeholder="지점을 입력하세요." maxlength="20" id="input-cinema-name"><br>
						</div>
						<input type="button" value="영화관 등록" onclick="InputCinemaInfo();" style=" width:200px; height:100px; background-color: gray; text-align : center; border-color: transparent; color: white; font-weight: bold; cursor:  pointer;">
	            	</div>
						
					<div class="brd_paginate">
						${page }
					</div>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>