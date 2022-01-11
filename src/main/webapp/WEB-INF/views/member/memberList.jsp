<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<h2 class="tit">회원관리</h2>
		</div>
			<ul class="tab_wrap outer">
				<li class="active">
					<div class="tab_con ty2">
						<h3 class="hidden">FAQ</h3>
						<form action="memberListProc" method="post">
							<fieldset class="search_wrap ty2">
								<legend>영화관 FAQ 검색하기</legend>
								<input type="text" name="search" placeholder="이름을 입력해주세요." id="search" title="검색어를 입력해주세요">
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
									<th scope="col" id="thead1">아이디</th>
									<th scope="col" id="thead1">이름</th>
									<th scope="col" id="thead1">이메일</th>
									<th scope="col" id="thead1">수정</th>
									<th scope="col" id="thead1">삭제</th>
								</tr>
							</thead>
							<tbody id="tab">
							<c:forEach var="user" items="${memberList }">
								<tr class="acc_head" aria-expanded="false" role="button" id="tr_180">
									<td id="row0" headers="thead0">${user.getMemberNum() }</td>
									<td id="row0" headers="thead0">${user.id }</td>
									<td id="row0" headers="thead0">${user.getName() }</td>
									<td id="row0" headers="thead0">${user.getEmail() }</td>
									<td style="cursor: pointer;" id="row0" headers="thead0" onclick="location.href='userInfoProc?id=${user.id }'">수정하기</td>
									<td style="cursor: pointer;" id="row0" headers="thead0" onclick="location.href='deleteMemberProc?id=${user.id }'">삭제하기</td>
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