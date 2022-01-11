<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customer.css" />
<script src="<c:url value="/resources/js/customer.js" />"></script>
<c:url var="root" value="/"/>

<title>고객센터 - 공지사항 수정</title>

<%@ include file="customerHeader.jsp" %>

<c:if test="${not empty msg }">
	<script>alert('${msg}');</script>
</c:if>

<center>
	<div class="sub_content">
		<div class="notice_write">
			<form id = "noticeModifyForm" action="noticeModifyProc?num=${view.noticeNum}" method="post">
				<p align="left">공지사항 수정</p>
				<label id = "emptyChk"></label>
				
				<table class="notice_write_Tb">
					<tr>
						<th><font class="must">*</font> <label class="title">분류</label></th>
						<td>
							${view.division }
						</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">제목</label></th>
						<td><input type="text" id = "title" name = "title" value="${view.title }"></td>
					</tr>
					<tr class="notice_content">
						<th><font class="must">*</font> <label class="title">내용</label></th>
						<td><textarea id = "content" name="content">${view.content }</textarea></td>
					</tr>

					<tr>
						<td colspan="2" class="noticeWrite_btn_area">
						  <input type="button" id="writeNo" value="취소" onclick="location.href='${root}customerList';">
			              <input type="submit" id="writeYes" value="확인">
						</td>
					</tr>
				</table>
			</form>
		
		
		</div>
	</div>
</center>
