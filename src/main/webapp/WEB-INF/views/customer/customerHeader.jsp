<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customer.css" />
<script src="<c:url value="/resources/js/customer.js" />"></script>

<center>
	<div class="content">
		<div class="top_menu">
			<h2>고객센터</h2>
				<ul class = "main">
					<li class="main_li">
						<a href="customerList" class = "main_a" style="width : 50%; left : 0%;">
							<span>공지사항</span>
						</a>
					</li>
								
					<li class="main_li">
						<a href="question" class = "main_a" style="width : 50%; left : 0%;">
							<span>1:1문의</span>
						</a>
					</li>
	
				</ul>
		
		</div>
	
	
	</div>
</center>