package com.star.cinema.member.service;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.star.cinema.member.MemberCheck;
import com.star.cinema.member.dao.IMemberDAO;
import com.star.cinema.member.dto.MemberDTO;

@Service
public class RegisterServiceImpl implements IRegisterService {
	final static Logger logger = LoggerFactory.getLogger(RegisterServiceImpl.class);
	@Autowired MailService mailService;
	@Autowired HttpSession session;
	@Autowired MemberCheck memCheck;
	@Autowired IMemberDAO dao;
	
	@Override
	public String agreeCheck(String[] agree) {
		String msg = "";
		int agreeCnt = 0;
		for(int i=0; i < agree.length; i++) {
			if(agree[i].equals("yes")) {
				agreeCnt++;
			}
		}
		
		if(agreeCnt != 2) msg = "약관을 모두 동의해주세요.";
		else msg = "";
		
		return msg;
	}
	
	@Override
	public String sendAuth(String email, String name) {
		
		if(email == "" || name == "") {
			return "이메일과 이름을 모두 입력해주세요";
		}else if(memCheck.nameCheck(name) == false) {
			return "이름은 한글 또는 영문만 가능합니다.";
		}else if(memCheck.emailCheck(email) == false) {
			return "이메일 형식이 올바르지 않습니다.";
		}else {
			Random random = new Random();
			String authNum = String.format("%06d", random.nextInt(1000000));
			mailService.sendMail(email, "[인증번호]", authNum);
			session.setAttribute("authNum", authNum);
			session.setMaxInactiveInterval(60);	
			logger.warn(authNum);	
			return "이메일을 확인해주세요";
		}
	
	}

	@Override
	public String authConfirm(String authNum) {
		if(authNum == "") return "인증번호를 입력해주세요";
		
		String saveAuthNum = (String)session.getAttribute("authNum");
		String msg = "";
		if(saveAuthNum == null) {
			msg = "메일 발송을 눌러주세요.";
		}else if(!saveAuthNum.equals(authNum)){
			msg = "인증 실패";
			session.setAttribute("authState", "no");	
		}else {
			msg = "인증 성공";
			session.setAttribute("authState", "yes");
		}		
		return msg;
	}
	
	@Override
	public String authProc(String name, String email) {
		String authState = (String)session.getAttribute("authState");
		String msg = "";
		
		if(name != "" && email != "" && (authState != null && authState.equals("yes"))) {
			msg = "인증 성공";
		}else if(name == "" || email == "") {
			msg = "빈 항목이 존재합니다.";
		}else {
			msg = "이메일 인증을 해주세요.";
		}		

		return msg;
	}

	@Override
	public String isExistId(String id) {
		String msg = "";
		MemberDTO dto = dao.isExistId(id);
		
		if(memCheck.idCheck(id) == false) {
			msg = "소문자로 시작하며 소문자, 숫자, -_기호만 가능합니다.(5~12자)";
			session.setAttribute("useable", "no");
			return msg;
		}
		
		if(dto != null) {
			msg = "중복 아이디 입니다.";
			session.setAttribute("useable", "no");
		}else{
			msg = "사용 가능한 아이디 입니다.";
			session.setAttribute("useable", "yes");
		}
		
		return msg;
	}

	@Override
	public boolean pwCheck(String pw, String pwChk) {		
		if(memCheck.pwCheck(pw) && pw.equals(pwChk)) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean birthCheck(String y, String m, String d) {
		if(y == "" || m == "" || d == "" || y == null || m == null || d == null) {
			return false;
		}
		
		if(memCheck.numCheck(m) == false || memCheck.numCheck(d) == false) {
			return false;
		}
		
		String[] birth = {y,m,d};
		if(memCheck.birthCheck(birth) == false) return false;

		
		return true;
	}

	@Override
	public boolean phoneCheck(String phone1, String phone2, String phone3) {

		if(phone1 == "" || phone2 == "" || phone3 == "" || phone1 == null || phone2 == null || phone3 == null) {
			return false;
		}
		
		if(memCheck.phoneCheck(phone2, phone3) == false) {
			return false;
		}
		
		return true;
	}

	@Override
	public boolean addrCheck(String zip, String addr2, String addr3) {
		if(zip == "" || addr2 == "" || addr3 == "") return false;
		return true;
	}

	@Override
	public void insertMember(MemberDTO dto) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(dto.getPw());
		dto.setPw(securePw);
				
		dao.insertMember(dto);
		session.invalidate();		// 회원가입 다되면 세션삭제
	}

}
