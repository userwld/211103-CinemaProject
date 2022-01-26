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

	
	@Override	/* 마이페이지 - 찜목록 */
	public boolean myLikeProc(Model model) {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		if(dto == null) return false;
		ArrayList<GradeDTO> myGrade = gradeDao.selectMyLike(dto.getId());		// 로그인 아이디, likeCheck = 1인 것의 리스트 얻어옴
		Map<Integer,MovieDTO> myMovieInfo  = new HashMap<Integer,MovieDTO>();	// 각각의 키를 영화번호로 설정(movieListNum) / 순서유지 상관없으므로 HashMap사용
		Map<Integer,Double> myMovieGrade = new HashMap<Integer,Double>();
		Map<Integer,String> recentReview = new HashMap<Integer,String>();
		Map<Integer,Double> movieRate = new HashMap<Integer,Double>();
		
		if(!myGrade.isEmpty()) {
			for(GradeDTO g : myGrade) {
				MovieDTO movie = gradeDao.selectMovieNum(g.getMovieListNum());
				Double totalGrade = gradeDao.selectTotalGrade(g.getMovieListNum());
				String recent = gradeDao.selectRecentReview(g.getMovieListNum());
				double[] rate = movieSvc.movieRank(g.getMovieListNum());
				
																				// 아래의 정보들을 값으로, 키를 영화번호로 Map으로 각각담음(해당 아이디가 좋아요 누른 영화만큼 반복으로 돌림)
				myMovieInfo.put(g.getMovieListNum(), movie);					// 해당 아이디가 좋아요 누른 영화의 정보(제목, 관람등급, 포스터 출력)
				myMovieGrade.put(g.getMovieListNum(), totalGrade);				// 해당 아이디가 좋아요 누른 영화의 평점
				recentReview.put(g.getMovieListNum(),recent);					// 해당 아이디가 좋아요 누른 영화의 가장 최신 리뷰
				movieRate.put(g.getMovieListNum(),rate[1]);						// 해당 아이디가 좋아요 누른 영화의 예매율 rank[0] - 순위 / rank[1] - 예매율

			}	
		}
		
		model.addAttribute("myGrade", myGrade);									// 반복끝난 후 model에 담아 view에 전달 / myLike.jsp에서 영화번호로 필요한 정보 추출
		model.addAttribute("myMovieInfo", myMovieInfo);
		model.addAttribute("myMovieGrade", myMovieGrade);
		model.addAttribute("recentReview", recentReview);
		model.addAttribute("movieRate", movieRate);
		
		return true;
	}

	@Override	/* 마이페이지 - 예매내역/관람내역 - recent 매개변수로 페이지 구분 */
	public boolean ticketingHistory(Model model, String recent) {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		if(dto == null) return false;
		
		ArrayList<TicketingDTO> myTicketing = new ArrayList<TicketingDTO>();			// 매개변수 recent에 따라 아래에서 다르게 담김	
		Map<Integer,MovieDTO> myMovieInfo  = new LinkedHashMap<Integer,MovieDTO>();		// 찜목록과 같은 형태로 movieListNum을 키로 사용 / 날짜 순 정렬 유지하기 위해 LinkedHashMap사용
		Map<Integer,String> myReview = new LinkedHashMap<Integer,String>();
		Map<Integer,String> cinemaName = new LinkedHashMap<Integer,String>();
		Map<Integer,String> hallName = new LinkedHashMap<Integer,String>();
		Map<Integer,String> btnTime = new LinkedHashMap<Integer,String>();				// 리뷰작성버튼/예매취소버튼 활성화를 위한 시간을 담음 -> 이때는 key를 ticketingNum으로 사용, 같은 영화 예매했을 경우 각각 계산위해
		
		if(recent.equals("recent")) {
			myTicketing = gradeDao.selectRecentTicketing(dto.getId());					// 매개변수 recent의 값이 recent일 경우 -> 예매내역(오늘 기준 한달전 ~ 오늘 기준 일주일 후)
		}else {
			 myTicketing = gradeDao.selectMyTickting(dto.getId());						// recent의 값이 recent가 아닐 경우 -> 관람내역(예매한 기록 전부)
		}
	
		if(!myTicketing.isEmpty()) {
			for(TicketingDTO t : myTicketing) {
				MovieDTO movie = gradeDao.selectMovieNum(t.getMovieListNum());
				String cinema = gradeDao.selectCinemaName(t.getCinemaNum());
				String hall = gradeDao.selectHallName(t.getHallNum());
				if(!recent.equals("recent")) {											// 관람내역일 경우 - 내가 쓴 리뷰 출력
					String review = gradeDao.selectMyReview(t.getMovieListNum(), dto.getId());
					if(review != null) myReview.put(t.getMovieListNum(), review);	
					btnTime.put(t.getTicketingNum(),reviewCalc(t.getOpenDate(),t.getOpenTime(),movie.getMovieTime()));	// 관람내역일 경우, 리뷰작성가능시간 계산해서 버튼 활성화
				}else {
					btnTime.put(t.getTicketingNum(),cancelCalc(t.getOpenDate(),t.getOpenTime()));						// 예매내역일 경우, 예매취소가능시간 계산해서 버튼 활성화
				}					
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
	public String reviewCalc(String day, String oldTime, String runningTime) {	// 예매날짜, 상영시간, 러닝타임
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
	
	// 예매취소를 위한 시간계산 -> 영화상영시간 -10분전까지만 가능 // 220126 추가
	public String cancelCalc(String day, String time) {		// 예매날짜, 상영시간
		int year = Integer.parseInt(day.substring(0,4));
		int month = Integer.parseInt(day.substring(5,7));
		int date = Integer.parseInt(day.substring(8));
		int hour = Integer.parseInt(time.substring(0,2));
		int min = Integer.parseInt(time.substring(3));		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
		Calendar cal = Calendar.getInstance();		
		cal.set(year, month-1, date, hour, min);
		cal.add(Calendar.MINUTE, -10);
		
		return sdf.format(cal.getTime());	
		
	}
	
}