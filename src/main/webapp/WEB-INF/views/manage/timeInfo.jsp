<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>롯지브이</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<c:if test="${not empty msg }">
	<script>alert('${msg}')</script>
</c:if>
</head>
<body>
	<div id="contents" class="contents_customer">
		<div class="title_top">
			<h2 class="tit">상영시간표 관리</h2>
		</div>
			<ul class="tab_wrap outer">
				<li class="active">
					<div class="tab_con ty2">
						<h3 class="hidden">FAQ</h3>
						<form action="timeInfoProc" method="post">
							<fieldset class="search_wrap ty2">
								<legend>영화관 FAQ 검색하기</legend>
								<input type="text" name="search" placeholder="지점명을 입력해주세요." id="search" title="검색어를 입력해주세요">
								<button type="submit" name='searchBtn' class="btn_col2">검색</button>
							</fieldset>
						</form>
						<div align="right">
							<input style="border-radius: 5px; cursor:pointer; border-color: transparent; background-color: red; color: white; width: 90px; height: 35px;" type="button" value="추가하기" onclick="location.href='${root }index?formpath=timeInfoInsert'">
						</div>
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
									<th scope="col" id="thead1">지점명</th>
									<th scope="col" id="thead1">영화명</th>
									<th scope="col" id="thead1">영화관 이름</th>
									<th scope="col" id="thead1">상영 날짜</th>
									<th scope="col" id="thead1">상영 시간</th>
									<th scope="col" id="thead1">삭제하기</th>
								</tr>
							</thead>
							<tbody id="tab">
							<c:forEach var="info" items="${timeInfoList }">
								<tr class="acc_head" aria-expanded="false" role="button" id="tr_180">
									<td id="row0" headers="thead0">${info.getTimeInfoNum() }</td>
									<td id="row0" headers="thead0">${info.getCountryName() }</td>
									<td id="row0" headers="thead0">${info.getCinemaName() }</td>
									<td id="row0" headers="thead0">${info.getMovieName() }</td>
									<td id="row0" headers="thead0">${info.getHallName() }</td>
									<td id="row0" headers="thead0">${info.getTicketDate() }</td>
									<td id="row0" headers="thead0">${info.getStartTime() }</td>
									<td id="row0" headers="thead0" style="cursor: pointer;" onclick="location.href='timeInfoDeleteProc?hallName=${info.getHallName() }&timeInfoNum=${info.getTimeInfoNum() }'">삭제하기</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div class="brd_paginate">
							${page }
						</div>
					</div>
				</li>
			</ul>
	</div>
</body>
</html>