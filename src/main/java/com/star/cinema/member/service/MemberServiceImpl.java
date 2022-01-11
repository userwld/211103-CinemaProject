package com.star.cinema.member.service;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.star.cinema.member.config.PageConfig;
import com.star.cinema.member.dao.IMemberDAO;
import com.star.cinema.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements IMemberService{
	final static Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired IMemberDAO dao;
	@Autowired HttpSession session;
	@Autowired MailService mailService;
	
	
	@Override
	public void memberList(Model model, int currentPage) {
		int pageBlock = 10;
		int totalCount = dao.memberCount();
		int end = currentPage * pageBlock;
		int begin = end + 1 - pageBlock;
		ArrayList<MemberDTO> list = dao.memberList(begin, end);
		model.addAttribute("memberList", list);
		
		String url = "/cinema/memberListProc?currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
	}
	
	@Override
	public void memberSearch(Model model, String search) {
		ArrayList<MemberDTO> list = dao.memberSearch(search);
		model.addAttribute("memberList", list);
	}

	@Override
	public boolean memberDelete(String id) {
		if(dao.deleteMember(id)) {
			return true;
		}
		return false;
	}

	@Override
	public boolean memberModify(MemberDTO dto, String type) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if (type.equals("change")) {
			MemberDTO saveDto = dto;
			dto = dao.selectMember(dto.getId());
			dto.setPw(saveDto.getPw());
		}
		String securePw = encoder.encode(dto.getPw());
		dto.setPw(securePw);

		return dao.modifyMember(dto);
	}

	@Override
	public void userInfo(Model model, String id) {
		MemberDTO past = dao.selectMember(id);
		model.addAttribute("past", past);
	}
	
	@Override
	public boolean checkId(String id, String type) {
		MemberDTO member = dao.selectMember(id);
		if (member == null) {
			return false;
		}
		if (type.equals("find")) { // 체크 타입이 아이디 찾기면 model에 값 추가
			session.setAttribute("memberInfo", member);
		}
		return true;
	}
	
	@Override
	public boolean checkPw(String id, String pw) {
		MemberDTO member = dao.selectMember(id);
		if (member == null) {
			return false;
		}
		boolean suc = new BCryptPasswordEncoder().matches(pw, member.getPw());
		if(suc) {
			session.setAttribute("loginInfo", member);
		}
		return suc;
	}
	
	@Override
	public boolean searchWithEmailMember(String searchId, String searchEmail) {
		MemberDTO member = dao.searchWithEmailMember(searchId, searchEmail);
		if (member != null) {
			session.setAttribute("memberInfo", member);
			return true;
		}
		return false;
	}
	
	@Override
	public void sendEmailCode(String email) {
		Random random = new Random();
		String authNum = String.format("%06d", random.nextInt(1000000));
		mailService.sendMail(email, "[인증번호]", authNum);
		session.setAttribute("code", authNum);
		session.setMaxInactiveInterval(60);	
		logger.warn(authNum);	
	}
	
	@Override
	public boolean checkEmailCode(String code) {
		String saveAuthNum = (String)session.getAttribute("code");
		session.removeAttribute("code");
		return saveAuthNum.equals(code);
	}
	
}