package com.star.cinema.customer;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.star.cinema.customer.dto.NoticeDTO;
import com.star.cinema.customer.dto.QuestionDTO;
import com.star.cinema.customer.dto.SearchDTO;
import com.star.cinema.customer.service.ICustomerService;
import com.star.cinema.member.dto.MemberDTO;

@Controller
public class CustomerController {
	final static Logger logger = LoggerFactory.getLogger(CustomerController.class);
	@Autowired ICustomerService service;
		
	/* 공지사항 리스트 & 검색 */
	@RequestMapping("/customerList")
	public String customerList(Model model, @RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage, SearchDTO dto) {
	
		if(dto.getSearch() == null || dto.getSearch() == "") {
			service.customerList(model, currentPage);			
		}
		else {
			service.customerSearch(model,currentPage,dto);
		}			
		model.addAttribute("cp", currentPage);
		return "forward:index?formpath=customer";
	}
			
	/* 공지사항 작성 */
	@RequestMapping(value="/noticeWriteProc")
	public String noticeWriteProc(String theater, @RequestParam(value = "self_theater", required = false)String self_theater,
			String title, String content, Model model) {
		
		boolean check = service.insertNotice(theater,self_theater,title,content);
		if(check == false) model.addAttribute("msg", "권한이 없거나 빈 항목이 존재합니다.");
		
		return "forward:customerList";
	}
	
	/* 공지사항 보기*/
	@RequestMapping(value="/noticeViewProc")
	public String noticeViewProc(String num, String cp, Model model) {
		NoticeDTO dto = service.noticeViewProc(num);
		model.addAttribute("view", dto);
		int currentPage = Integer.parseInt(cp);
		model.addAttribute("currentPage",currentPage);
		
		return "forward:index?formpath=noticeView";
	}
	
	/* 공지사항 수정 폼 호출*/
	@RequestMapping(value="/noticeModifyForm")
	public String noticeModifyForm(String num, Model model) {
		
		NoticeDTO dto = service.noticeViewProc(num);
		if(dto != null) {
			model.addAttribute("view", dto);
			return "forward:index?formpath=noticeModify";
		}else {
			return "forward:customerList";
		} 

	}
	
	/* 공지사항 수정 */
	@RequestMapping(value="/noticeModifyProc")
	public String noticeModifyProc(NoticeDTO dto,RedirectAttributes ra,String num) {
		if(dto.getTitle() == "" || dto.getContent() == "") {
			ra.addFlashAttribute("msg", "빈 항목을 채워주세요.");
			return "redirect:noticeModifyForm?num="+num;
		}
		
		service.noticeModifyProc(dto,num);
		return "forward:customerList";
	}
	
	@RequestMapping(value="/noticeDeleteProc")
	public String noticeDeleteProc(String num) {
		service.noticeDeleteProc(num);
		return "forward:customerList";
	}
	
	
	@RequestMapping(value="/question")
	public String question(HttpSession session, @RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage, Model model) {
		MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");

		if(member == null) return "forward:index?formpath=login";
		if(member.getId().equals("admin")) {
			service.questionList(model, currentPage);
			model.addAttribute("cp",currentPage);
			return "forward:index?formpath=questionList";	
		}else {
			return "forward:index?formpath=questionWrite";	
		}
		
	}
	
	@RequestMapping(value="/questionWriteProc")
	public String questionWriteProc(MultipartHttpServletRequest req, Model model) {
		boolean check = service.questionWriteProc(req);
		
		if(check == false) {
			model.addAttribute("msg", "로그인 되어있지 않거나 빈 항목이 존재합니다.");
			return "forward:question";
		}else {
			model.addAttribute("msg", "글이 등록되었습니다.");
			return "forward:myQuestionList";
		}
	}
	
	
	@RequestMapping(value="/questionViewProc")
	public String questionViewProc(String num, String cp, Model model) {
		QuestionDTO dto = service.questionViewProc(num);
		
		if(dto.getAnswer().equals("no")) model.addAttribute("existA", "N");
		
		model.addAttribute("view", dto);

		int currentPage = Integer.parseInt(cp);
		model.addAttribute("cp",currentPage);
		
		return "forward:index?formpath=questionView";
	}
	
	/* 파일 다운로드 */
	@RequestMapping(value="/download")
	public void download(String fileName, HttpServletResponse res) throws IOException {
		if(fileName == "" || fileName.equals("파일 없음"))
			return;
		
		res.addHeader("Content-disposition", "attachment;fileName="+fileName);
		File file = new File(ICustomerService.FILE_LOCATION + "\\" + fileName);
		FileInputStream input = new FileInputStream(file);	
		FileCopyUtils.copy(input, res.getOutputStream());  
		input.close();
	}
	
	/* 관리자 답변 작성 */
	@RequestMapping(value = "/answerUpdate", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String,String> answerUpdate(@RequestBody Map<String,String> map) {
		
		String answer = map.get("answer");
		String num = map.get("num");
			
		service.answerUpdate(answer, num);
		
		return map;
	}
	
		
	
	
	
	
}