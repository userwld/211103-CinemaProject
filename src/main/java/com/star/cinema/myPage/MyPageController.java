package com.star.cinema.myPage;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.cinema.myPage.service.IMyPageService;

@Controller
public class MyPageController {
	final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
	@Autowired IMyPageService service;
	
	@RequestMapping(value="/myQuestionList")
	public String myQuestionList(@RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage, Model model) {
		boolean check = service.myQuestionList(model, currentPage);
		if(check == false) return "forward:index?formpath=login";
		
		model.addAttribute("cp", currentPage);		
		return "forward:index?formpath=myQuestion";
	}
	
	@RequestMapping(value="/modifyProc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> modifyProc(String pw, String pwChk, String phone1, String phone2, String phone3, String zipcode, String addr1, String addr2) {
		Map<String,String> map = new HashMap<String,String>();
		boolean check = service.modifyProc(pw,pwChk,phone1,phone2,phone3,zipcode,addr1,addr2);
		
		if(check == false) {
			map.put("msg", "모든 항목을 만족해야 합니다.");
		}else {
			map.put("msg", "수정완료! 3초 후 로그아웃 됩니다.");
		}
		return map;
	}
	
	@RequestMapping(value="/deleteProc")
	public String deleteProc(String deleteCheck) {
		if(deleteCheck == null) return "forward:index?formpath=memberDelete";
		service.deleteProc();
		return "forward:logoutRequest";
	}
	
	@RequestMapping(value="/myLikeProc")
	public String myLikeProc(Model model) {
		boolean check = service.myLikeProc(model); 
		if(check == false) return "forward:index?formpath=login";	
		return "forward:index?formpath=myLike";	
	}

	@RequestMapping(value="/ticketingHistory")
	public String ticketingHistory(Model model) {
		String recent = "recent";
		boolean check = service.ticketingHistory(model, recent);
		if(check == false) return "forward:index?formpath=login";	
		return "forward:index?formpath=myPage";
	}
	
	@RequestMapping(value="/movieHistory")
	public String movieHistory(Model model) {
		String recent = "all";
		boolean check = service.ticketingHistory(model, recent);
		if(check == false) return "forward:index?formpath=login";	
		return "forward:index?formpath=myMovieHistory";
	}

}
	

