<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />
<script src="<c:url value="/resources/js/myPage.js" />"></script>
<c:url var="root" value="/"/>

<title>마이페이지 - 회원탈퇴</title>

<%@ include file="myPageHeader.jsp" %>

<c:if test="${empty loginInfo }">
	<script>location.href='index?formpath=login';</script>
</c:if>

<center>
	<div class="sub_content">
		<form id ="deleteForm" action="deleteProc">
			<div class="memberDelete">
				
				<h2 class="title">회원탈퇴</h2>
				<h2>회원탈퇴 전</h2>
				<h2><span class="warn">유의사항</span>을 확인해주세요.</h2>
				
				
				<p class="warn_title">유의사항</p>
				
				<div class="warn_content">
					<p class="detail_content">- 롯지브이 아이디를 탈퇴하시면 서비스 부정 이용 방지를 위하여 제휴사 회원정책에 따라 일정 기간 동안 회원 재 가입이 불가합니다.</p>
					<p class="detail_content">- 롯지브이 제휴사 탈퇴 시, 제휴사에서 사용하시던 포인트 및 쿠폰 등은 복원할 수 없습니다.</p>
					<p class="detail_content">- 롯지브이 제휴사에서 진행중인 주문 또는 이용중인 서비스가 있을 경우 탈퇴가 불가합니다.</p>
					<p class="detail_content">- 롯지브이 전체 탈퇴 하시려면 아이디 삭제 및 카드해지를 모두 완료하셔야 합니다. 롯지브이 카드 해지는 엘포인트 홈페이지(PC)에서 가능합니다.</p>
					<p class="detail_content">- 탈퇴 즉시 개인정보가 삭제되면, 어떠한 방법으로도 복원할 수 없습니다.<br><br>(전자상거래 서비스 등의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 보호됩니다.)</p>
				</div>
				
				<div class="deleteAgree">
					<input type="checkbox" class="deleteCheck" id = "deleteCheck" name = "deleteCheck"><label class="deleteLabel">위 유의사항을 모두 확인하였고 회원탈퇴에 동의합니다.</label>
				</div>
				<label id = "deleteConfirm"></label>
				
				<div class="delete_btn_area">
				  	<input type="button" id="modifyNo" value="취소" onclick="location.href='${root}';">
	              	<input type="button" id="modifyYes" value="확인" onclick="deleteStep();">
				</div>
			
			</div>
		</form>
	</div>
</center>
