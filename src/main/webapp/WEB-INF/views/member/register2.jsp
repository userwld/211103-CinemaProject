<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<title>롯지브이 : 회원가입 - 이메일인증</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/main/icon/lotgv.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css" />

<script src="<c:url value="/resources/js/register.js" />"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:url var="root" value="/"/>

<!-- 이메일인증페이지 -->

<center>
<div class="logo">
	<a href="${root }"><img src="${pageContext.request.contextPath}/resources/images/lot.png" style="width:200px; height: auto;"></a>
</div>

<div id="content">
	<form id = "authForm" action="register_final" method="post">
		<table class="emailTb">
			<tr>
				<th><font class="must">*</font> <label class="title">이름</label></th>
				<td><input type="text" id = "name" name = "name" placeholder="한글 또는 영문으로 입력해주세요." maxlength="20"></td>
			</tr>
			<tr>
				<th><font class="must">*</font> <label class="title">이메일 주소</label></th>
				<td><input type="text" id="email" name="email" placeholder="이메일주소를 입력해주세요." maxlength="30"> <input type="button" id="sendMailBtn" value="메일발송" onclick="sendAuth();"></td>
			</tr>
			<tr>
				<th><font class="must">*</font> <label class="title">인증번호</label></th>
				<td><input type="text" id = "authNum" name = "authNum" placeholder="인증번호를 입력해주세요." maxlength="6" onkeyup="numberChk();"> <input type="button" id = "authBtn" value="인증확인" onclick="authConfirm()"></td>
			</tr>
			<tr>
				<td colspan="2"><label id="authLabel"></label></td>
			</tr>
			<tr>
				<td colspan="2" class="auth_btn_area">
				  <input type="button" id="agreeNo" value="취소" onclick="location.href='${root}';">
	              <input type="button" id="agreeYes" value="확인" onclick="nextStep2();">
				</td>
			</tr>
		</table>
	</form>
</div>

</center>