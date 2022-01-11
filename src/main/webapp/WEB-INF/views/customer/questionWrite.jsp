<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customer.css" />
<script src="<c:url value="/resources/js/question.js" />"></script>
<c:url var="root" value="/"/>

<title>고객센터 - 1:1문의 작성</title>

<%@ include file="customerHeader.jsp" %>

<center>
	<div class="sub_content">
		<div class="question_write">
			<form id = "questionForm" action="questionWriteProc"  method="post" enctype="multipart/form-data">
				
				<p align="left">문의내용</p>
				
				<table class="questionTb">
					<tr>
						<th><font class="must">*</font> <label class="title">분류</label></th>
						<td>
							<select name = "division" id = "division">
								<option value="0">분류 선택</option>
								<option value="1">영화관</option>
								<option value="2">영화</option>
								<option value="3">예매/결제</option>
								<option value="4">개인정보</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">종류</label></th>
						<td>
							<input type ="radio" checked="checked" name="kinds" value="문의"> 문의
							<input type ="radio" name="kinds" value="칭찬"> 칭찬
							<input type ="radio" name="kinds" value="건의"> 건의
							<input type ="radio" name="kinds" value="불만"> 불만
						</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">제목</label></th>
						<td><input type="text" id = "title" name="title" placeholder="제목을 입력해주세요"></td>
					</tr>
					<tr class="question_content">
						<th><font class="must">*</font> <label class="title">내용</label></th>
						<td><textarea placeholder="내용을 입력해주세요" name="content"></textarea></td>
					</tr>
					
				
					<tr>
						<th><label class="title">첨부파일</label></th>
						<td class = "address">
							<input type="file" name="fileName">
						</td>
					</tr>
					
					<tr>
						<th></th>
						<td><label id="inputCheck"></label></td>
					</tr>
				
					<tr>
						<td colspan="2" class="question_btn_area">
						  <input type="button" id="writeNo" value="취소" onclick="location.href='${root}';">
			              <input type="button" id="writeYes" value="확인" onclick="questionWriteStep();">
						</td>
					</tr>
				</table>
			</form>
		
		
		</div>
	</div>
</center>
