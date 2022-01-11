<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />
<script src="<c:url value="/resources/js/question.js" />"></script>
<c:url var="root" value="/"/>

<title>1:1문의 내역 확인</title>

<%@ include file="customerHeader.jsp" %>

<!-- 관리자가 모든 1:1문의내역 확인하는곳 -->
<center>
	<div class="sub_content">
		<div class="myQuestion">
			<table class="question_list">
				<colgroup>
					<col style="width : 8%">
					<col style="width : 18%">
					<col style="width : auto;">
					<col style="width : 12%">
					<col style="width : 12%">
					<col style="width : 8%">					
				</colgroup>
				<thead class="question_th">
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>답변여부</th>				
					</tr>
				</thead>
				<tbody>
					<c:choose>
					<c:when test="${list.isEmpty() == false }">
						<c:forEach var="dto" items="${list }">
							<c:set var="division" value=""/>
							<c:if test="${dto.division == '1'}"><c:set var="division" value="영화관"/></c:if>
							<c:if test="${dto.division == '2'}"><c:set var="division" value="영화"/></c:if>
							<c:if test="${dto.division == '3'}"><c:set var="division" value="예매/결제"/></c:if>
							<c:if test="${dto.division == '4'}"><c:set var="division" value="개인정보"/></c:if>
								<tr>
									<td>${dto.questionNum }</td>
									<td>${division}</td>
									<td><a href="questionViewProc?num=${dto.questionNum}&cp=${cp}">${dto.title}</a></td>
									<td>${dto.id}</td>
									<td>${dto.regDate}</td>
							<c:choose>
								<c:when test="${dto.answer == 'no' }">
										<td>N</td>
								</c:when>
								<c:otherwise>
										<td>Y</td>
								</c:otherwise>
							</c:choose>			
								</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">
								<div class="noQuestion">
									<p>문의내역이 존재하지 않습니다.</p>
								</div>
							</td>
						<tr>
						</tr>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		
		<div class="question_paging" align="center">
			${page }
		</div>
		
	</div>
</center>