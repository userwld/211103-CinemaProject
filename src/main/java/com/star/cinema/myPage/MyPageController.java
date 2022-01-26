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
	
	/* 마이페이지 - 1:1문의내역 또는 하위 1:1문의리스트 클릭시*/
	@RequestMapping(value="/myQuestionList")
	public String myQuestionList(@RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage, Model model) {
		boolean check = service.myQuestionList(model, currentPage);
		if(check == false) return "forward:index?formpath=login";
		
		model.addAttribute("cp", currentPage);		
		return "forward:index?formpath=myQuestion";
	}
	
	/* 마이페이지 - 정보관리 - 정보수정*/
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
	
	/* 마이페이지 - 정보관리 - 회원탈퇴 */
	@RequestMapping(value="/deleteProc")
	public String deleteProc(String deleteCheck) {
		if(deleteCheck == null) return "forward:index?formpath=memberDelete";
		service.deleteProc();
		return "forward:logoutRequest";
	}
	
	/* 마이페이지 - 찜목록 */
	@RequestMapping(value="/myLikeProc")
	public String myLikeProc(Model model) {
		boolean check = service.myLikeProc(model); 
		if(check == false) return "forward:index?formpath=login";	
		return "forward:index?formpath=myLike";	
	}
	
	/* 마이페이지 - 예매내역(최근 한달 내 예매내역만 출력 - recent로 구분) */
	@RequestMapping(value="/ticketingHistory")
	public String ticketingHistory(Model model) {
		String recent = "recent";
		boolean check = service.ticketingHistory(model, recent);
		if(check == false) return "forward:index?formpath=login";	
		return "forward:index?formpath=myPage";
	}
	
	/* 마이페이지 - 관람내역(전체 관람내역 출력) */
	@RequestMapping(value="/movieHistory")
	public String movieHistory(Model model) {
		String recent = "all";
		boolean check = service.ticketingHistory(model, recent);
		if(check == false) return "forward:index?formpath=login";	
		return "forward:index?formpath=myMovieHistory";
	}

}
	

