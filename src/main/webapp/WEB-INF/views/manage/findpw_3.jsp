<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.star.cinema.member.dto.*" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />
    <link rel="stylesheet" href="https://members.lpoint.com/resources/css/common.css?date=20200428000001">
		<link rel="stylesheet" href="https://members.lpoint.com/resources/css/swiper.min.css?date=20200428000001">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css" />
	
	<link rel="stylesheet" href="https://members.lpoint.com/resources/css/css_1050.css" type="text/css" media="screen"></head>
	

<script src="<c:url value="/resources/js/findid.js" />"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:url var="root" value="/"/>

<title>롯지브이</title>
<%MemberDTO member = (MemberDTO) session.getAttribute("memberInfo"); 
if (member == null) {%>
	<jsp:forward page="/" />
<% }%>

	<div id="mast-head">
        <div class="container">
            <a href="${root }">
            	<img src="${pageContext.request.contextPath}/resources/images/lot.png" style="width: 300px; height: 105px;"/>
            </a>
        </div>
    </div>
<center>
	<div class="sub_content">
		<div class="memberModify">
			<form id="modifyForm" action="modifyMemberProc?id=<%=member.getId() %>" method="post">
				<p align="center">비밀번호 수정</p>
				<table class="modifyTb">
					<tr>
						<th><font class="must">*</font> <label class="title">이름</label></th>
						<td><%=member.getName() %></td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">아이디</label></th>
						<td><%=member.getId() %></td>
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
							<input type="password" id="pwChk" onkeyup="pwConfirm();"><br>
							<label id = "pwChkLabel"></label>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="modify_btn_area">
							<input type="button" id="modifyNo" value="취소" onclick="location.href='index?formpath=login';">
					        <input type="button" id="modifyYes" value="확인" onclick="changePw('<%=member.getId()%>');">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</center>
