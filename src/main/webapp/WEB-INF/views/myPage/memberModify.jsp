<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="<c:url value="/resources/js/myPage.js" />"></script>
<script src="<c:url value="/resources/js/register.js" />"></script>

<c:url var="root" value="/"/>

<title>마이페이지- 회원정보수정</title>

<%@ include file="myPageHeader.jsp" %>

<c:if test="${empty loginInfo }">
	<script>location.href='index?formpath=login';</script>
</c:if>

<center>
	<div class="sub_content">
		<div class="memberModify">
			<form id = "modifyForm" method="post">
				
				<p align="left">회원 정보 수정</p>
				
				<table class="modifyTb">
					<tr>
						<th><font class="must">*</font> <label class="title">이름</label></th>
						<td>${loginInfo.name}</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">아이디</label></th>
						<td>${loginInfo.id}</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">비밀번호</label></th>
						<td>
							<input type="password" id = "pw" name="pw" maxlength="16" onkeyup="pwCheck();" ><br>
							<label id = "pwLabel">영문자+숫자 조합 / 특수문자는 -_!@#$%^&*?만 가능합니다.(8~16자) </label>
						</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">비밀번호 확인</label></th>
						<td>
							<input type="password" id = "pwChk" name="pwChk" maxlength="16" onkeyup="pwConfirm();"><br>
							<label id = "pwChkLabel"></label>
						</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">휴대폰번호</label></th>
						<td>
							<c:set var="phoneArr" value="${loginInfo.phone.split('-') }"></c:set>
							<select id ="phone1" name="phone1">
								<option value="010" <c:if test="${phoneArr[0] == '010' }"> selected </c:if>> 010</option>
								<option value="011" <c:if test="${phoneArr[0] == '011' }"> selected </c:if>> 011</option>
								<option value="016" <c:if test="${phoneArr[0] == '016' }"> selected </c:if>> 016</option>
								<option value="017" <c:if test="${phoneArr[0] == '017' }"> selected </c:if>> 017</option>
								<option value="018" <c:if test="${phoneArr[0] == '018' }"> selected </c:if>> 018</option>
								<option value="019" <c:if test="${phoneArr[0] == '019' }"> selected </c:if>> 019</option>
							</select>	 
							<input type="text" id = "phone2" name="phone2" placeholder="중간자리" value="${phoneArr[1]}" maxlength="4">
							<input type="text" id = "phone3" name="phone3" placeholder="끝자리" value="${phoneArr[2]}" maxlength="4"><br>
							<label id="phoneLabel"></label>
						</td>
					</tr>
					<tr>
						<th><font class="must">*</font> <label class="title">주소</label></th>
						<td class = "address">
							<c:set var="addrArr" value="${loginInfo.address.split('&&') }"></c:set>
							<input type="text" id="zipcode" name = "zipcode" placeholder="우편번호" value="${loginInfo.zipcode }" readonly="readonly"><input type="button" value="우편번호 검색" onclick="daumPost();"><br>
							<input type="text" id="addr1" name="addr1" placeholder="주소" value="${addrArr[0]}" readonly="readonly"><br>
							<input type="text" id="addr2" name="addr2" placeholder="상세주소" value="${addrArr[1]}"><br>
							<label id = "addrLabel"></label><br>
							<span id = "totalLabel"></span>
						</td>				
					</tr>
					
					<tr>
						<td colspan="2" class="modify_btn_area">
						  <input type="button" id="modifyNo" value="취소" onclick="location.href='${root}';">
			              <input type="button" id="modifyYes" value="확인" onclick="modifyStep();">
						</td>
					</tr>
				</table>
			</form>
		
		
		</div>
	</div>
</center>
