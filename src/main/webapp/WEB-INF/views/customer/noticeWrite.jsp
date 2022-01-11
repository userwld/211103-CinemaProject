<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customer.css" />
<script src="<c:url value="/resources/js/customer.js" />"></script>
<c:url var="root" value="/"/>

<title>고객센터 - 공지사항 작성</title>

<%@ include file="customerHeader.jsp" %>


<c:if test="${not empty msg }">
	<script>alert('${msg}');</script>
</c:if>

<center>
	<div class="sub_content">
		<div class="notice_write">
			<form id = "noticeWriteForm" action="noticeWriteProc" method="post">
				
				<p align="left">공지사항 작성</p>
				
				<table class="notice_write_Tb">
					<tr>
						<th><font class="must">*</font> <label class="title">분류</label></th>
						<td>
							<input type ="radio" checked="checked" name="theater" value="0"> 전체
							<input type ="radio" name="theater" value="1"> 직접입력
							<input type="text" name="self_theater" placeholder= "영화관명 입력" disabled="disabled">
						</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">제목</label></th>
						<td><input type="text" id = "title" name = "title" placeholder="제목을 입력해주세요"></td>
					</tr>
					<tr class="notice_content">
						<th><font class="must">*</font> <label class="title">내용</label></th>
						<td><textarea placeholder="내용을 입력해주세요" id = "content" name="content"></textarea></td>
					</tr>
					<tr>
						<th></th>
						<td><label id="inputCheck"></label></td>
					</tr>

					<tr>
						<td colspan="2" class="noticeWrite_btn_area">
						  <input type="button" id="writeNo" value="취소" onclick="location.href='${root}customerList';">
			              <input type="button" id="writeYes" value="확인" onclick="noticeWriteStep();">
						</td>
					</tr>
				</table>
			</form>
		
		
		</div>
	</div>
</center>
