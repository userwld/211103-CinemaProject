<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<body>
    <div id="contents" class="contents_full contents_member_comn">
        <div id="loginContents">
            <ul class="tab_wrap outer full">
                <li class="active">
                    <button type="button" class="tab_tit" style="left: 50%; width: 326.667px; margin-left: -490px;">
                        <span>회원</span>
                    </button>
                    <div class="tab_con">
                        <h3 class="hidden">회원</h3>
                        <div class="member_login_wrap">
                            <div class="contents_inner">
                                <div class="login_box">
                                    <p class="tip">롯지브이 회원가입 시 모든 기능 이용이 가능 합니다. </p>
                                    <div class="login_area">
                                        <input type="text" id="userId" maxlength="50" placeholder="아이디 또는 이메일을 입력해 주세요." title="입력태그">
                                        <input type="password" id="userPassword" maxlength="15" placeholder="비밀번호를 입력해 주세요." title="입력태그">
                                        <input type="hidden" name="hidLoginType" id="hidLoginType" value="">
                                        <button type="button" onclick="loginRequest()" class="btn_login">로그인</button>
                                    </div>
                                    <div class="login_bot_wrap">
                                        <div class="login_check">
                                            <input type="checkbox" name="loginCheck" id="checkSavedID">
                                            <label for="checkSavedID">아이디 저장</label>
                                        </div>
                                        <div class="login_menu"><a href="register1" title="페이지 이동">회원가입</a>
                                            <a href="findid" title="페이지 이동">아이디 찾기</a>
                                            <a href="findpw" title="페이지 이동">비밀번호 찾기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>
                </li>
			</ul>
        </div>
    </div>
</body>

	<script src="<c:url value="/resources/js/login.js" />"></script>

</html>