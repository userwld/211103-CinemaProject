package com.star.cinema.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.cinema.member.config.KakaoConfig;
import com.star.cinema.member.dto.MemberDTO;
import com.star.cinema.member.service.IMemberService;

@Controller
public class LoginController {
	@Autowired IMemberService service;
	@Autowired KakaoConfig kakao;
	
	
	@ResponseBody
	@RequestMapping(value = "loginIdCheck")
	public boolean loginIdCheck(@RequestBody Map<String,String> map) {
		return service.checkId(map.get("id"), "login");
	}
	
	@ResponseBody
	@RequestMapping(value = "loginPwCheck")
	public boolean loginPwCheck(@RequestBody Map<String,String> map) {
		return service.checkPw(map.get("id"), map.get("pw"));
	}
	
	@RequestMapping(value = "logoutRequest")
	public String logoutRequest(HttpSession session) {
		if (session.getAttribute("loginInfo") != null) {
			session.removeAttribute("loginInfo");
		}
		return "forward:index";
	}
	
	@RequestMapping(value = "kakaoLogin")	
	public String kakaoLogin(String code, HttpSession session) {
		String state = "login";
		String accessToken = kakao.getAccessToken(code, state);	
		HashMap<String, Object> userInfo = kakao.getUserInfo(accessToken); 
		
		session.setAttribute("id", userInfo.get("nickname"));	
		session.setAttribute("accessToken", accessToken);	
				
		return "forward:index";
	}


	@RequestMapping(value="kakaoLogout")
	public String kakaoLogout(HttpSession session) {		
		
		String accessToken = (String)session.getAttribute("accessToken");
		if(accessToken != null) {
			kakao.logout(accessToken);
		}
		
		session.removeAttribute(accessToken);
		session.removeAttribute("id");
		session.removeAttribute("userInfo");
		
		return "forward:index";
	}
	
	@RequestMapping(value="kakaoReserve")	// 예매시, 성별과 나이대 정보를 추가로 얻기 위해 정보 동의 요청 -> 토큰 다시얻음
	public String kakaoReserve(String code, HttpSession session) {
		
		if(session.getAttribute("userInfo") == null) {
			String state = "info";			// 로그인인지, 예매시 추가 정보동의를 위한 것인지 구분하기 위한 파라미터(이걸로 redirectUri구분)
			String accessToken = kakao.getAccessToken(code,state);
			HashMap<String, Object> userInfo = kakao.getUserInfo(accessToken); 
			
			session.setAttribute("accessToken", accessToken);	
			session.setAttribute("userInfo", userInfo);
		}
	
		return "forward:index?formpath=ticketing";
	}
	

	
}
