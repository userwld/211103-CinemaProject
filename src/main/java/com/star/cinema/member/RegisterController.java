package com.star.cinema.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.cinema.member.dto.MemberDTO;
import com.star.cinema.member.service.IRegisterService;

@Controller
public class RegisterController {
	final static Logger logger = LoggerFactory.getLogger(RegisterController.class);
	@Autowired IRegisterService service;
	
	/* register1 에서 확인버튼 눌렀을 때 */
	@RequestMapping(value="/agreeCheck", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String,String> agreeCheck(@RequestBody Map<String,String[]> map) {
		Map<String,String> result = new HashMap<String,String>();
		
		if(map.get("agree").length == 0) {
			result.put("msg", "약관을 모두 동의해주세요.");
			return result;
		}
			
		String[] agree = (String[]) map.get("agree");
		result.put("msg", service.agreeCheck(agree));
					
		return result;
	}
	
	/* register2에서 메일발송 버튼 눌렀을 때 */
	@RequestMapping(value = "/sendAuth", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String,String> sendAuth(@RequestBody Map<String,String> map, HttpSession session) {
		
		String email = map.get("email");
		String name = map.get("name");	
		
		map.put("msg", service.sendAuth(email, name));

		return map;
	}
	
	/* register2에서 인증번호 확인 눌렀을 때 */
	@RequestMapping(value = "/authConfirm", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String,String> authConfirm(@RequestBody Map<String,String> map, HttpSession session) {
		
		String authNum = map.get("authNum");		
		map.put("msg", service.authConfirm(authNum));
		return map;
	}
	
	/* register2에서 확인버튼 눌렀을 때 최종확인 후 register_final로 */
	@RequestMapping(value = "/authProc", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String,String> authProc(@RequestBody Map<String,String> map, HttpSession session) {
		
		String name = map.get("name");
		String email = map.get("email");
	
		map.put("msg", service.authProc(name, email));
		
		return map;
	}
	
	/* register_final에서 중복확인 눌렀을 때 */
	@RequestMapping(value = "/isExistId", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String,String> isExistId(@RequestBody Map<String,String> map, HttpSession session) {
		
		String id = map.get("id");
		map.put("msg",service.isExistId(id));
				
		return map;
	}
	
	
	/* register_final에서 정보 입력 후 확인버튼 눌렀을 때 -> 서버에서 유효성 검사 다시 진행 후 db저장*/
	@RequestMapping(value="/registerProc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> registerProc(String id, String pw, String pwChk, String year, String month, String day, String gender, 
			String phone1, String phone2, String phone3, String zipcode, String addr1, String addr2, String name, String email,HttpSession session){
		
		Map<String,String> map = new HashMap<String,String>();
		
		if(session.getAttribute("useable").equals("no") || service.pwCheck(pw,pwChk) == false || 
				service.birthCheck(year,month,day) == false || service.phoneCheck(phone1,phone2,phone3) == false ||
				service.addrCheck(zipcode,addr1,addr2) == false) {

			map.put("msg", "모든 항목을 만족해야 합니다.");
		}
		
		MemberDTO dto = new MemberDTO();
				
		dto.setId(id); dto.setPw(pw); dto.setEmail(email); dto.setName(name); dto.setGender(gender);
		dto.setBirth(year+"-"+month+"-"+day); dto.setPhone(phone1+"-"+phone2+"-"+phone3); dto.setZipcode(zipcode);
		dto.setAddress(addr1+"&&"+addr2);
		
		service.insertMember(dto);
		map.put("msg","회원가입 성공");
		
		return map;
	}
	
}
