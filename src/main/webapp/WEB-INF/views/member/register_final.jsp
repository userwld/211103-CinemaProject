<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<title>롯지브이 : 회원가입 - 정보작성</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/main/icon/lotgv.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css" />

<script src="<c:url value="/resources/js/register.js" />"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:url var="root" value="/"/>

<!-- 정보작성페이지 -->

<center>
<div class="logo">
	<a href="${root }"><img src="${pageContext.request.contextPath}/resources/images/lot.png" style="width:200px; height: auto;"></a>
</div>

<div id="content">
	<form id = "registerForm" action="registerProc" method="post">
		<input type="hidden" name = "name" value=${param.name }>
		<input type="hidden" name = "email" value=${param.email }>
		<table class="registerTb">
			<tr>
				<th><font class="must">*</font> <label class="title">아이디</label></th>
				<td>
					<input type="text" id = "id" name = "id" placeholder="아이디" maxlength="15">
					<input type="button" value="중복확인" onclick="isExistId()"><br>
					<label id = "idLabel">소문자로 시작하며 소문자, 숫자, -_기호만 가능합니다.(5~12자)</label>
					<input type="hidden" id = "authId" value="no">
				</td>
				
			</tr>
			<tr>
				<th><font class="must">*</font> <label class="title">비밀번호</label></th>
				<td>
					<input type="password" id= "pw" name="pw" placeholder="비밀번호" maxlength="16" onkeyup="pwCheck();"><br>
					<label id = "pwLabel">영문자+숫자 조합 / 특수문자는 -_!@#$%^&*?만 가능합니다.(8~16자) </label>
				</td>
			
			</tr>
			<tr>
				<th><font class="must">*</font> <label class="title">비밀번호 확인</label></th>
				<td colspan="2">
					<input type="password" id = "pwChk" name="pwChk" placeholder="비밀번호확인" maxlength="16" onkeyup="pwConfirm();"><br>
					<label id = "pwChkLabel"></label>
				</td>
			</tr>
			<tr>
				<th><font class="must">*</font> <label class="title">생년월일</label></th>
				<td>	<!-- 현재 년도 구해서 반복문 돌려서 역순으로 년도 출력 -->
					<c:set var = "nowDay" value="<%=new java.util.Date() %>"/>
					<c:set var = "nowYear"><fmt:formatDate value="${nowDay}" pattern ="yyyy"/></c:set>
					<select id = "year" name = "year">
						<option>년도</option>
						<c:forEach var="i" begin="1920" end = "${nowYear}" step ="1">
							<option value="${nowYear - i + 1920}">${nowYear - i + 1920}년</option>
						</c:forEach>
					</select>
					
					<input type = "text" id = "month" name = "month" placeholder="월" maxlength="2" >
					<input type = "text" id = "day" name="day" placeholder="일" maxlength="2" ><br>
					<label id="birthLabel"></label>
				</td>
				
			</tr>
			<tr>
				<th><font class="must">*</font> <label class="title">성별</label></th>
				<td><input type="radio" name="gender" value="m" checked="checked">남 
					<input type="radio" name="gender" value="w">여
				</td>
			</tr>
			<tr>
				<th><font class="must">*</font> <label class="title">휴대폰번호</label></th>
				<td>
					<select id ="phone1" name="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<input type="text" id = "phone2" name = "phone2" placeholder="중간자리" maxlength="4">
					<input type="text" id = "phone3" name = "phone3" placeholder="끝자리" maxlength="4" ><br>
					<label id="phoneLabel"></label>
				</td>
			</tr>
			<tr>
				<th><font class="must">*</font> <label class="title">주소</label></th>
				<td class = "address">
					<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly="readonly"><input type = "button" onclick="daumPost();" value="주소 검색"><br>
					<input type="text" id="addr1" name = "addr1" placeholder="주소 검색을 눌러주세요." readonly="readonly"><br>
					<input type="text" id="addr2" name = "addr2" placeholder="상세주소"><br>
					<label id="addrLabel"></label><br>
					<span id = "totalLabel"></span>
				</td>					
			</tr>
					
			<tr>
				<td colspan="3" class="register_btn_area">
				  <input type="button" id="agreeNo" value="취소" onclick="location.href='${root}';">
	              <input type="button" id="agreeYes" value="확인" onclick="registerStep();">
				</td>
			</tr>
		</table>
	</form>
</div>

</center>