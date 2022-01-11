<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="<c:url value="/resources/js/myPage.js" />"></script>
<c:url var="root" value="/"/>


<title>마이페이지 - 1:1문의상세</title>

<%@ include file="myPageHeader.jsp" %>

<script>
function answerUpdate(n){
	
	var a = document.getElementById("answer").value;
	var info = {answer : a, num : n};
	
	$.ajax({		
		url: "answerUpdate", type: "POST",		
		data: JSON.stringify(info), 			
		contentType: "application/json; charset=utf-8", 	
		dataType: "json", 
	
		success : function(result){		
			location.href='questionViewProc?num='+n+'&cp=${cp}';

		},
		error : function(){
			alert('답변등록error!');
		}
	})	

}
</script>

<center>
	<div class="content">
		<div>
			<table class="detail_question">
				<colgroup><col style="width : auto;"></colgroup>
				<thead>
					<tr>
						<th scope="col" colspan="2">${view.title }</th>
					</tr>
				</thead>
				<tbody>
					<tr class="detail_th">
						<td colspan="2">
							<span class="tit1">분류</span><span class="line"></span>
							
							<c:set var="division" value=""/>
							<c:if test="${view.division == '1'}"><c:set var="division" value="영화관"/></c:if>
							<c:if test="${view.division == '2'}"><c:set var="division" value="영화"/></c:if>
							<c:if test="${view.division == '3'}"><c:set var="division" value="예매/결제"/></c:if>
							<c:if test="${view.division == '4'}"><c:set var="division" value="개인정보"/></c:if>
							
						
							<span>${division}</span>
							<span class="tit2">종류</span><span class="line"></span>
							<span>${view.kinds }</span>
							<span class="tit2">작성일</span><span class="line"></span>
							<span>${view.regDate}</span>
							<span class="tit2">답변여부</span><span class="line"></span>
							
							<c:choose>
								<c:when test="${existA == 'N' }">
									<span>N</span>
								</c:when>
								<c:otherwise>
									<span>Y</span>
								</c:otherwise>
							</c:choose>
							
						</td>
					<tr class="detail_con">
						<td colspan="2">
							<div class="detail_question_con">
							<p>
								${view.content}
							</p>
							</div>
						</td>
					</tr>
						<c:if test="${view.fileName != '파일 없음' }">
							<tr class="file_opt">
								<td colspan="2">
									<span class="tit2">첨부파일</span><span class="line"></span>
									<span class="fileDown" onclick="location.href='${root}download?fileName=${view.fileName}';">${view.fileName}</span>
								</td>
							</tr>
						</c:if>
						
					<c:choose>
						<c:when test="${existA == 'N' && loginInfo.id == 'admin'}">
							<tr class="answer_area">
								<td>
									<span class="tit2">A</span>
								</td>
								<td class="answer">
									<textarea name="answer" id="answer"></textarea> <input type="button" value="완료" onclick="answerUpdate(${view.questionNum});">
								</td>
							</tr>
						</c:when>
						<c:when test="${existA != 'N'}">
							<tr class="answer_area">
								<td>
									<span class="tit2">A</span>
								</td>
								<td class="answer">
									<span>
										${view.answer}
									</span>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr class="answer_area">
								<td>
									<span class="tit2">A</span>
								</td>
								<td class="answer">
									<span>
										아직 작성된 답변이 없습니다.
									</span>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					
					<tr class="question_btn_area" align="right">
						<td colspan="2">	
							<c:choose>
								<c:when test="${not empty loginInfo and loginInfo.id == 'admin'}">
									<input type="button" value="목록으로" onclick="location.href='question?currentPage=${cp}';">
								</c:when>
								
								<c:otherwise>
									<input type="button" value="목록으로" onclick="location.href='myQuestionList?currentPage=${cp}';">
								</c:otherwise>
							</c:choose> 							
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
	</div>

</center>
    