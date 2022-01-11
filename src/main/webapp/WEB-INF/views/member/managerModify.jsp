<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />

<script src="<c:url value="/resources/js/memberList.js" />"></script>
<script src="<c:url value="/resources/js/register.js" />"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:url var="root" value="/"/>

<title>롯지브이</title>

<center>
	<div class="sub_content">
		<div class="memberModify">
			<form id="modifyForm" action="modifyMemberProc?id=${past.id }" method="post">
				<p align="left">회원 정보 수정</p>
				<table class="modifyTb">
					<tr>
						<th><font class="must">*</font> <label class="title">이름</label></th>
						<td>${past.getName() }</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">아이디</label></th>
						<td>${past.id }</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">비밀번호</label></th>
						<td>
							<input type="password" max="16" id="pw" name="pw" onkeyup="pwCheck();"><br>
							<label id="pwLabel">영문자+숫자 조합 / 특수문자는 -_!@#$%^&*?만 가능합니다.(8~16자) </label>
						</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">비밀번호 확인</label></th>
						<td>
							<input type="password" id="pwChk" name="pwChk" onkeyup="pwConfirm();"><br>
							<label id="pwChkLabel"></label>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="modify_btn_area">
							<input type="button" id="modifyNo" value="취소" onclick="location.href='memberListProc';">
					        <input type="button" id="modifyYes" value="확인" onclick="userModifyProc();">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</center>
