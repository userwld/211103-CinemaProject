package com.star.cinema.myPage.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.star.cinema.customer.dto.QuestionDTO;
import com.star.cinema.member.MemberCheck;
import com.star.cinema.member.config.PageConfig;
import com.star.cinema.member.dto.MemberDTO;
import com.star.cinema.movie.dao.IGradeDAO;
import com.star.cinema.movie.dto.GradeDTO;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.dto.TicketingDTO;
import com.star.cinema.movie.service.IMovieDetailService;
import com.star.cinema.myPage.dao.IMyPageDAO;

@Service
public class MyPageServiceImpl implements IMyPageService {
	final static Logger logger = LoggerFactory.getLogger(MyPageServiceImpl.class);
	@Autowired HttpSession session;
	@Autowired IMyPageDAO dao;
	@Autowired IGradeDAO gradeDao;
	@Autowired MemberCheck memChk;
	@Autowired IMovieDetailService movieSvc;

	@Override
	public boolean myQuestionList(Model model, int currentPage) {
		MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");		
		if(member == null) return false;
			
		int[] page = PageConfig.setPage(dao.myQuestionCount(member.getId()), currentPage);
		ArrayList<QuestionDTO> myList = dao.myQuestionList(member.getId(), page[0], page[1]);
		model.addAttribute("list", myList);
		
		String url = "/cinema/myQuestionList?currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, page[2], page[3], url));
		
		return true;
	}

	@Override
	public boolean modifyProc(String pw, String pwChk, String phone1, String phone2, String phone3, String zipcode,
			String addr1, String addr2) {
		
		if((MemberDTO)session.getAttribute("loginInfo") == null) return false;
		if(!pw.equals(pwChk) || memChk.pwCheck(pwChk)== false || memChk.phoneCheck(phone2, phone3)== false ||
				zipcode == "" || addr1 == "" || addr2 == "") {
			return false;
		}
		
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(pw);
		
		dto.setPw(securePw); dto.setPhone(phone1+"-"+phone2+"-"+phone3); dto.setZipcode(zipcode);
		dto.setAddress(addr1+"&&"+addr2);
		
		dao.modifyMember(dto);
		return true;
	}

	@Override
	public void deleteProc() {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		if(dto == null) return;	
		dao.deleteMember(dto);
	}

	@Override
	public boolean myLikeProc(Model model) {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		if(dto == null) return false;
		ArrayList<GradeDTO> myGrade = gradeDao.selectMyLike(dto.getId());
		Map<Integer,MovieDTO> myMovieInfo  = new HashMap<Integer,MovieDTO>();
		Map<Integer,Double> myMovieGrade = new HashMap<Integer,Double>();
		Map<Integer,String> recentReview = new HashMap<Integer,String>();
		Map<Integer,Double> movieRate = new HashMap<Integer,Double>();
		
		if(!myGrade.isEmpty()) {
			for(GradeDTO g : myGrade) {
				MovieDTO movie = gradeDao.selectMovieNum(g.getMovieListNum());
				Double totalGrade = gradeDao.selectTotalGrade(g.getMovieListNum());
				String recent = gradeDao.selectRecentReview(g.getMovieListNum());
				double[] rate = movieSvc.movieRank(g.getMovieListNum());
				
				
				myMovieInfo.put(g.getMovieListNum(), movie);
				myMovieGrade.put(g.getMovieListNum(), totalGrade);
				recentReview.put(g.getMovieListNum(),recent);
				movieRate.put(g.getMovieListNum(),rate[1]);

			}	
		}
		
		model.addAttribute("myGrade", myGrade);
		model.addAttribute("myMovieInfo", myMovieInfo);
		model.addAttribute("myMovieGrade", myMovieGrade);
		model.addAttribute("recentReview", recentReview);
		model.addAttribute("movieRate", movieRate);
		
		return true;
	}

	@Override
	public boolean ticketingHistory(Model model, String recent) {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		if(dto == null) return false;
		
		ArrayList<TicketingDTO> myTicketing = new ArrayList<TicketingDTO>();
		Map<Integer,MovieDTO> myMovieInfo  = new LinkedHashMap<Integer,MovieDTO>();
		Map<Integer,String> myReview = new LinkedHashMap<Integer,String>();
		Map<Integer,String> cinemaName = new LinkedHashMap<Integer,String>();
		Map<Integer,String> hallName = new LinkedHashMap<Integer,String>();
		Map<Integer,String> btnTime = new LinkedHashMap<Integer,String>();
		
		if(recent.equals("recent")) {
			myTicketing = gradeDao.selectRecentTicketing(dto.getId());
		}else {
			 myTicketing = gradeDao.selectMyTickting(dto.getId());
		}
	
		if(!myTicketing.isEmpty()) {
			for(TicketingDTO t : myTicketing) {
				MovieDTO movie = gradeDao.selectMovieNum(t.getMovieListNum());
				String cinema = gradeDao.selectCinemaName(t.getCinemaNum());
				String hall = gradeDao.selectHallName(t.getHallNum());
				if(!recent.equals("recent")) {
					String review = gradeDao.selectMyReview(t.getMovieListNum(), dto.getId());
					if(review != null) myReview.put(t.getMovieListNum(), review);
				}
				btnTime.put(t.getMovieListNum(),timeCalc(t.getOpenDate(),t.getOpenTime(),movie.getMovieTime()));
				myMovieInfo.put(t.getMovieListNum(), movie);				
				if(cinema != null) cinemaName.put(t.getCinemaNum(), cinema);
				if(hall != null) hallName.put(t.getHallNum(), hall);
			}
		}
					
		model.addAttribute("myTicketing", myTicketing);
		model.addAttribute("myMovieInfo", myMovieInfo);
		model.addAttribute("cinemaName", cinemaName);
		model.addAttribute("hallName", hallName);
		if(!recent.equals("recent")) {
			model.addAttribute("myReview", myReview);
		}
		model.addAttribute("btnTime", btnTime);
		
		return true;
	}	
	
	// 리뷰 작성을 위한 시간계산 -> 영화관람시간(+러닝타임)보다 현재시각이 늦어야 리뷰작성 가능 
	// 220121 Calendar 라이브러리 사용하는 걸로 메소드 수정 
	public String timeCalc(String day, String oldTime, String runningTime) {
		int year = Integer.parseInt(day.substring(0,4));
		int month = Integer.parseInt(day.substring(5,7));
		int date = Integer.parseInt(day.substring(8));
		int hour = Integer.parseInt(oldTime.substring(0,2));
		int min = Integer.parseInt(oldTime.substring(3));						
		int plusM = Integer.parseInt(runningTime);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm");

		Calendar cal = Calendar.getInstance();		
		cal.set(year, month-1, date, hour, min);
		cal.add(Calendar.MINUTE, plusM);
		
//		System.out.println(sdf.format(cal.getTime()));
		return sdf.format(cal.getTime());		
	}
}