package com.star.cinema.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.cinema.member.dto.MemberDTO;
import com.star.cinema.member.service.IMemberService;

@Controller
public class LoginController {
	@Autowired IMemberService service;
	
	
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

}
