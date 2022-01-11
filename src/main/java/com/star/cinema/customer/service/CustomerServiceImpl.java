package com.star.cinema.customer.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.star.cinema.customer.dao.ICustomerDAO;
import com.star.cinema.customer.dto.NoticeDTO;
import com.star.cinema.customer.dto.QuestionDTO;
import com.star.cinema.customer.dto.SearchDTO;
import com.star.cinema.member.config.PageConfig;
import com.star.cinema.member.dto.MemberDTO;

@Service
public class CustomerServiceImpl implements ICustomerService{
	final static Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);
	@Autowired HttpSession session;
	@Autowired ICustomerDAO dao;


	@Override
	public void customerList(Model model, int currentPage) {
		session.removeAttribute("search");
		int[] page = PageConfig.setPage(dao.customerCount(), currentPage);
	
		ArrayList<NoticeDTO> list = dao.customerList(page[0], page[1]);
		model.addAttribute("list", list);
		
		String url = "/cinema/customerList?currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, page[2], page[3], url));		
	}

	@Override
	public void customerSearch(Model model, int currentPage, SearchDTO dto) {
		session.setAttribute("search", dto);
		int[] page = PageConfig.setPage(dao.customerSearchCount(dto.getSearch(), dto.getSel()), currentPage);
				
		ArrayList<NoticeDTO> list = dao.customerSearch(page[0],page[1],dto.getSearch(), dto.getSel());
		model.addAttribute("list", list);
		
		String url = "/cinema/customerList?currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, page[2], page[3], url));
					
	}
	
	@Override
	public boolean insertNotice(String theater, String self_theater, String title, String content) {
		MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
		if(member == null || !member.getId().equals("admin")) return false;
		if((theater.equals("1") &&  self_theater == "") || title == "" || content == "") {
			return false;
		}
		
		String division = theater.equals("0") ? "전체" : self_theater;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		NoticeDTO dto = new NoticeDTO();
		
		dto.setDivision(division); dto.setTitle(title); dto.setContent(content);
		dto.setRegDate(sdf.format(new Date()));
		
		dao.insertNotice(dto);
				
		return true;
	}

	@Override
	public NoticeDTO noticeViewProc(String num) {
		if(num == null || num == "" ) {
			return null;
		}	
		
		int noticeNum = Integer.parseInt(num);
		
		dao.updateHit(noticeNum);
		return dao.selectNum(noticeNum);
	}

	@Override
	public void noticeModifyProc(NoticeDTO dto,String num) {
		MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
		if(member == null ||  !member.getId().equals("admin")) return;
		
		int noticeNum = Integer.parseInt(num);
		
		dto.setNoticeNum(noticeNum);
		dao.updateNotice(dto);		
	}

	@Override
	public void noticeDeleteProc(String num) {
		MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
		if(member == null || !member.getId().equals("admin")) return;
		
		int noticeNum = Integer.parseInt(num);		
		dao.deleteNotice(noticeNum);	
	}

	@Override
	public boolean questionWriteProc(MultipartHttpServletRequest req) {
			
		MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
		if(member == null) return false;
		
		String id = member.getId();
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String division = req.getParameter("division");
		String kinds = req.getParameter("kinds");
		
		if(title.isEmpty() == true || content.isEmpty() == true || division.isEmpty() == true || kinds.isEmpty() == true) {
			return false;
		}
		
		QuestionDTO dto = new QuestionDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dto.setId(id); dto.setTitle(title); dto.setContent(content);
		dto.setRegDate(sdf.format(new Date()));  dto.setAnswer("no");
		dto.setDivision(division); dto.setKinds(kinds);
		
		MultipartFile file = req.getFile("fileName");
		
		if(file.getSize() != 0) {	
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileName = sdf.format(new Date()) + file.getOriginalFilename(); 
			dto.setFileName(fileName);
			
			File save = new File(ICustomerService.FILE_LOCATION + "\\" + fileName);	
			
			try {
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}else {
			dto.setFileName("파일 없음");
		}
			dao.insertQuestion(dto);
			return true;
		}

	@Override
	public void questionList(Model model, int currentPage) {
		int[] page = PageConfig.setPage(dao.questionCount(), currentPage);
		ArrayList<QuestionDTO> list = dao.questionList(page[0], page[1]);
		model.addAttribute("list", list);
		
		String url = "/cinema/question?currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, page[2], page[3], url));	
	}

	@Override
	public QuestionDTO questionViewProc(String num) {
		
		if(num == null || num == "" ) {
			return null;
		}	
		
		int questionNum = Integer.parseInt(num);
		return dao.selectQuesion(questionNum);
	}

	@Override
	public void answerUpdate(String answer, String num) {
		if(answer == "" || num == "") return;
		
		int questionNum = Integer.parseInt(num);
		
		dao.answerUpdate(answer, questionNum);
		
	}
		
	
	

	
}



	

