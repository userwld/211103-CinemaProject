<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />
<script src="<c:url value="/resources/js/myPage.js" />"></script>
 
<center>
	<div class="content">
		<div class="top_menu">
			<ul class = "main">
				<li class="main_li">
					<a href="ticketingHistory" class = "main_a" style="width : 12.5%; left : 0%;">
						<span>예매내역</span>
					</a>
					<ul class="sub">
						<li>
							<a href="ticketingHistory" class="sub_a" style="left : 0px; margin-left : 28.85px;">
								<span>예매내역</span>
							</a>
						</li>
						<li>
							<a href="movieHistory" class="sub_a" style="left : 0px; margin-left : 28.85px;">
								<span>관람내역</span>
							</a>
						</li>
					</ul>
					
				</li>
				<li class="main_li">
					<a href="myLikeProc" class = "main_a" style="width : 12.5%; left : 0%;">
						<span>찜목록</span>
					</a>
				</li>
				<li class="main_li">
					<a href="myQuestionList" class = "main_a" style="width : 12.5%; left : 0%;">
						<span>1:1문의내역</span>
					</a>
					<ul class="sub">
						<li>
							<a href="myQuestionList" class="sub_a" style="left : 0px; margin-left : 28.85px;">
								<span>1:1문의리스트</span>
							</a>
						</li>
						<li>
							<a href="index?formpath=questionWrite" class="sub_a" style="left : 66px; margin-left : 28.85px;">
								<span>1:1문의 작성</span>
							</a>
						</li>
					</ul>
				</li>
					<li class="main_li">
					<a href="index?formpath=memberModify" class = "main_a" style="width : 12.5%; left : 0%;">
						<span>정보관리</span>
					</a>
					<ul class="sub">
						<li>
							<a href="index?formpath=memberModify" class="sub_a" style="left : 0px; margin-left : 28.85px;">
								<span>정보수정</span>
							</a>
						</li>
						<li>
							<a href="index?formpath=memberDelete" class="sub_a" style="left : 66px; margin-left : 28.85px;">
								<span>회원탈퇴</span>
							</a>
						</li>
					</ul>
				</li>
			</ul>		
		</div>
	
	
	</div>
</center>