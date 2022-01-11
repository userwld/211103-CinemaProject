<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>롯지브이 : 회원가입 - 약관동의</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/main/icon/lotgv.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css" />

<script src="<c:url value="/resources/js/register.js" />"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:url var="root" value="/"/>

<!-- 약관동의페이지-->

<center>
<div class="logo">
	<a href="${root }"><img src="${pageContext.request.contextPath}/resources/images/lot.png" style="width:200px; height: auto;"></a>
</div>

    <div id="content">
    	<div class="divAgree" align="left">
	    	<form action="register2" id="agreeForm">
	 			<p class="terms_chk_all">		
					<span class="input_chk">
						<input type="checkbox" id="chk_all" name="chk_all" onclick="checkAll();">
						<label for="chk_all"><span class="chk_all_txt">롯지브이 이용약관, 개인정보 수집 및 이용 모두 동의합니다.</span></label>
		            </span>
	            </p>
	                  
	         	<ul class="terms_bx_list">
	                 <li class="terms_bx">
						<span class="input_chk">
							<input type="checkbox" id="termsService" name="check" value="yes" onclick="agreeChk();">
							<label for="termsService">롯지브이 이용약관 동의<span class="terms_necessary">(필수)</span></label>
						</span>
				
			            <div class="terms_box">      
							<div class="article">
							    <h3 class="article__title">여러분을 환영합니다.</h3>
							    <p class="article__text">
							        롯지브이 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
							        본 약관은 다양한 롯지브이 서비스의 이용과 관련하여 롯지브이 서비스를 제공하는 롯지브이 주식회사(이하 ‘롯지브이’)와
							        이를 이용하는 롯지브이 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,
							        아울러 여러분의 롯지브이 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
							    </p>
							    <p class="article__text">
							        롯지브이 서비스를 이용하시거나 롯지브이 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로,
							        잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
							    </p>
							</div>
						</div>
					 </li>
					 
	                 <li class="terms_bx">
						<span class="input_chk">
							<input type="checkbox" id="termsPrivacy" name="check" value="yes" onclick="agreeChk();">
							<label for="termsPrivacy">개인정보 수집 및 이용 동의<span class="terms_choice">(필수)</span></label>     
						</span>
					
			             <div class="terms_box">
			                  <div class="article">
			   	 				<p class="article__text">개인정보보호법에 따라 롯지브이에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
							 </div>
			           	</div>
	           		</li>
				</ul>
	           </form>
	           <label class="agree_chk"></label>
          </div> 
          
            <div class="agree_btn_area" align="right">
              <input type="button" id="agreeNo" value="취소" onclick="location.href='${root}';">
              <input type="button" id="agreeYes" value="확인" onclick="nextStep1();">
            </div>        
       
     </div>
   
</center>