<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customer.css" />
<script src="<c:url value="/resources/js/customer.js" />"></script>
<c:url var="root" value="/"/>

<title>고객센터 - 공지사항 상세</title>

<%@ include file="customerHeader.jsp" %>
<center>
	<div class="content">
		<div>
			<table class="detail_notice">
				<colgroup><col style="width : auto;"></colgroup>
				<thead>
					<tr>
						<th scope="col">${view.title}</th>
					</tr>
				</thead>
				<tbody>
					<tr class="detail_th">
						<td>
							<span class="tit1">영화관</span><span class="line"></span>
							<span>${view.division} </span>
							<span class="tit2">등록일</span><span class="line"></span>
							<span>${view.regDate}</span>
							<span class="tit3">조회수</span><span class="line"></span>
							<span>${view.hit}</span>
						
						</td>
					<tr class="detail_con">
						<td>
							<div class="detail_notice_con">
							<textarea>${view.content}</textarea>
							</div>
						</td>
					<tr>
					</tr>
					<tr class="notice_btn_area" align="right">
						<td>	 
							<c:if test="${not empty loginInfo and loginInfo.id == 'admin'}">
								<input type="button" value="작성" onclick="location.href='index?formpath=noticeWrite';">
								<input type="button" value="수정" onclick="location.href='noticeModifyForm?num=${view.noticeNum}';">
								<input type="button" value="삭제" onclick="location.href='noticeDeleteProc?num=${view.noticeNum}';">
							</c:if>
							
								<c:choose>
									<c:when test="${not empty search }">
										<input type="button" value="목록으로" onclick="location.href='customerList?currentPage=${currentPage}&sel=${search.sel }&search=${search.search }';">									
									</c:when>
									<c:otherwise>
										<input type="button" value="목록으로" onclick="location.href='customerList?currentPage=${currentPage}';">
									</c:otherwise>								
								</c:choose>
								
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
	</div>

</center>
