package com.star.cinema.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.cinema.member.dto.MemberDTO;
import com.star.cinema.member.service.IMemberService;

@Controller
public class MemberController {
	@Autowired IMemberService service;
	
	@RequestMapping(value = "memberListProc")
	public String memberList(Model model, @RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage, String search) {
		if(search == null || search == "") {
			service.memberList(model, currentPage);
		}
		else {
			service.memberSearch(model, search);
		}
		return "forward:/index?formpath=memberList";
	}
	
	@RequestMapping(value = "modifyMemberProc", method = RequestMethod.POST)
	public String modifyMemberProc(Model model, String id, String pw, MemberDTO dto) {
		dto.setId(id);
		dto.setPw(pw);
		
		boolean check = service.memberModify(dto, "find");
		if(check == false)
			model.addAttribute("msg", "수정에 실패하였습니다.");
		else 
			model.addAttribute("msg", "수정에 성공하였습니다.");
		return "forward:memberListProc";
	}
	
	@RequestMapping(value = "userInfoProc")
	public String userInfoProc(Model model, String id) {
		service.userInfo(model, id);
		return "forward:/index?formpath=managerModify";
	}

	
	@RequestMapping(value = "deleteMemberProc")
	public String deleteMemberProc(Model model, String id) {
		boolean check = service.memberDelete(id);
		if(check == false)
			model.addAttribute("msg", "삭제에 실패하였습니다.");
		else 
			model.addAttribute("msg", "삭제에 성공하였습니다.");
		return "forward:memberListProc";
	}
	
	@ResponseBody
	@RequestMapping(value = "findMemberId", method = RequestMethod.POST)
	public boolean findMemberId(Model model, @RequestBody Map<String,String> map)  {
		return service.searchWithEmailMember(map.get("searchId"), map.get("searchEmail"));
	}
	
	@ResponseBody
	@RequestMapping(value = "findIdCheck")
	public boolean loginIdCheck(@RequestBody Map<String,String> map) {
		return service.checkId(map.get("id"), "find");
	}
	
	
	@ResponseBody
	@RequestMapping(value = "sendEmailCode")
	public void sendEmailCode(HttpSession session) {
		String email = ((MemberDTO) session.getAttribute("memberInfo")).getEmail();
		service.sendEmailCode(email);
	}
	
	@ResponseBody
	@RequestMapping(value = "checkEmailCode", method = RequestMethod.POST)
	public boolean checkEmailCode(@RequestBody Map<String,String> map)  {
		return service.checkEmailCode(map.get("code"));
	}
	
	@ResponseBody
	@RequestMapping(value = "changePw", method = RequestMethod.POST)
	public boolean changePw(@RequestBody Map<String,String> map)  {
		MemberDTO member = new MemberDTO();
		member.setId(map.get("id"));
		member.setPw(map.get("pw"));
		
		return service.memberModify(member, "change");
	}


}
