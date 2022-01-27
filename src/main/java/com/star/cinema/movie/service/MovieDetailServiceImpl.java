package com.star.cinema.movie.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.star.cinema.member.dto.MemberDTO;
import com.star.cinema.movie.dao.IChartDAO;
import com.star.cinema.movie.dao.IGradeDAO;
import com.star.cinema.movie.dto.GradeDTO;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.dto.TicketingDTO;
import com.star.cinema.myPage.service.MyPageServiceImpl;

@Service
public class MovieDetailServiceImpl implements IMovieDetailService {
	@Autowired HttpSession session;
	@Autowired IGradeDAO dao;
	@Autowired IChartDAO chartDao;
	
	@Override	/* 영화번호로 영화정보(MovieDTO) 얻어옴*/
	public MovieDTO selectMovieNum(int movieListNum) {		
		return dao.selectMovieNum(movieListNum);
	}
	
	@Override	/* 영화번호로 해당 영화의 사용자 각각의 평점과 리뷰, 작성자를 리스트로 저장 -> movieDetail.jsp에서 각 사용자들의 평점과 리뷰 출력*/
	public ArrayList<GradeDTO> selectGrade(int movieListNum) {		
		return dao.selectGrade(movieListNum);
	}
	
	@Override	/* 해당 아이디가 해당 영화에 대한 예매내역이 있는지 확인 -> 예매내역 얻어오는데 예매일 오름차순으로 1개만 얻어옴 -> 동일 영화에 대한 예매내역이 있을 경우, 빠른 예매일의 리뷰가능시간에 충족하면 리뷰달수있게 */
	public TicketingDTO selectReserve(String id, int movieListNum) {		
		return dao.selectReserve(id, movieListNum);
	}
	
	@Override	/* 해당아이디가 해당영화에 남긴 평점과 리뷰 얻어옴*/
	public GradeDTO selectMyGrade(String id, int movieListNum) {		
		return dao.selectMyGrade(id, movieListNum);
	}
	
	@Override	/* 해당 영화의 평점의 평균(avg) */
	public double selectTotalGrade(int movieListNum) {
		return dao.selectTotalGrade(movieListNum);
	}

	@Override	/* 리뷰작성 */
	public String reviewWriteProc(Map<String, String> map) { 	// map에 영화번호(movieListNum), 평점(grade), 리뷰(review)가 key로 각각의 값이 value로 담겨서 전달
		if((MemberDTO)session.getAttribute("loginInfo") == null) return "로그인 후 이용가능합니다.";
		
		int movieListNum = Integer.parseInt(map.get("movieListNum"));
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		
		if(selectReserve(dto.getId(), movieListNum) == null) return "관람내역이 없습니다. 관람 후 작성해주세요.";
		if(enableReview(movieListNum, dto.getId()) == false) return "아직 관람하지 않은 영화입니다. 관람 후 작성해주세요";
				
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String regDate = sdf.format(new Date());
		
		StringBuilder sb = new StringBuilder(dto.getName());	// 작성자 이름의 1번 index *로 치환
		sb.setCharAt(1, '*');
				
		GradeDTO grade = selectMyGrade(dto.getId(), movieListNum);
		GradeDTO dataGrade = new GradeDTO();
		
		int myGrade = Integer.parseInt(map.get("grade"));
		dataGrade.setId(dto.getId()); dataGrade.setMovieListNum(movieListNum); dataGrade.setGrade(myGrade);
		dataGrade.setReview(map.get("review")); dataGrade.setRegDate(regDate); dataGrade.setName(sb.toString());
		
		if(grade!= null) {
			if(grade.getReview() != null ) return "이미 리뷰를 작성한 영화입니다.";		
			else dao.updateReview(dataGrade); // 찜을 해서 이미 db에 있지만 리뷰는 등록이 안된 경우 update
		}else {																	
			dao.insertReview(dataGrade);	  // db에 없는 상태면 insert
		}
				
		return "등록이 완료되었습니다.";
	}

	@Override	
	public String likeCalcProc(Map<String, String> map) {
		if((MemberDTO)session.getAttribute("loginInfo") == null) return "로그인 후 이용가능합니다.";
		
		int movieListNum = Integer.parseInt(map.get("movieListNum"));
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		
		GradeDTO grade = selectMyGrade(dto.getId(), movieListNum);
		if(grade == null) dao.insertLike(dto.getId(), movieListNum);
		else {
			if(grade.getLikeCheck() == 0) {
				dao.updateLike(movieListNum, dto.getId(), "in"); 
			}else{
				dao.updateLike(movieListNum, dto.getId(), "out"); return "좋아요가 취소되었습니다.";
			}
		}
		return "좋아요가 반영되었습니다.";
	}

	@Override	
	public int totalLike(int movieListNum) {
		return dao.selectTotalLike(movieListNum);
	}
	
	
	public boolean enableReview(int movieListNum, String id) {
		TicketingDTO ticket = selectReserve(id, movieListNum);
		MovieDTO movie = selectMovieNum(movieListNum);
		
		MyPageServiceImpl svc = new MyPageServiceImpl();
		String reviewTime = svc.reviewCalc(ticket.getOpenDate(), ticket.getOpenTime(), movie.getMovieTime());
		reviewTime = reviewTime.replaceAll("-", "");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String nowDate = sdf.format(new Date());

		if(Long.parseLong(nowDate) > Long.parseLong(reviewTime) ) {
			return true;
		}return false;

	}
	
	
	public double[] preferGender(int movieListNum) {
		ArrayList<String>idList = dao.ticketingIdList(movieListNum);
		double[] prefer = {0.0, 0.0};	// 첫번째 여자, 두번째 남자
		if(!idList.isEmpty()) {
			int total = idList.size();
			int w = 0;
			Set<String> woman = dao.isWoman();
			if(!woman.isEmpty()) {
				for(String id : idList) {
					if(woman.contains(id)) w++;
				}
			}
			prefer[0] = w/(double)total * 100;
			prefer[1] = (total-w)/(double)total * 100;
		
		}		
		return prefer;
	}	
	
	
	public double[] preferAge(int movieListNum) {
		double[] agePercent = {0.0,0.0,0.0,0.0};
		ArrayList<String>idList = dao.ticketingIdList(movieListNum);
		if(!idList.isEmpty()) {
			int total = idList.size();
				
			Calendar now = Calendar.getInstance();
			int nowYear = now.get(Calendar.YEAR);
			int t1=0, t2=0, t3=0, t4 =0;
			

			Set<String> teen = dao.preferYear(nowYear-(19-1)+"",nowYear-(10-1)+"");
			Set<String> twen = dao.preferYear(nowYear-(29-1)+"",nowYear-(20-1)+"");
			Set<String> thirty = dao.preferYear(nowYear-(39-1)+"",nowYear-(30-1)+"");
			Set<String> forty = dao.preferYear(nowYear-(100-1)+"",nowYear-(40-1)+"");
			
			for(String id : idList) {
				if(!teen.isEmpty() && teen.contains(id)) t1++;
				if(!twen.isEmpty() && twen.contains(id)) t2++;
				if(!thirty.isEmpty() && thirty.contains(id)) t3++;
				if(!forty.isEmpty() && forty.contains(id)) t4++;
			}
			
			agePercent[0] = t1/(double)total*100; agePercent[1] = t2/(double)total*100; agePercent[2] = t3/(double)total*100; agePercent[3] = t4/(double)total*100;
		}
		return agePercent;
	}
	
		
	public double[] movieRank(int movieListNum) {
		double[] rank = {0,0};
		ArrayList<Integer> gc = chartDao.groupCount();
		int mc = chartDao.moiveCount(movieListNum);
		int tc = chartDao.totalTicketCount();
		
		if(!gc.isEmpty())rank[0] = gc.indexOf(movieListNum) + 1;
		if(mc > 0 && tc > 0) rank[1] = mc/(double)tc * 100;
		
		return rank;
	}

	@Override	/* 영화상세페이지 - 리뷰삭제 */
	public String reviewDeleteProc(Map<String, String> map) {
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		if(dto == null) return "로그인 후 이용가능합니다.";
		
		int movieListNum = Integer.parseInt(map.get("movieListNum"));
		GradeDTO grade = dao.selectMyGrade(dto.getId(), movieListNum);
		
		if(grade.getLikeCheck() == 1) {						// 해당 영화가 해당 아이디의 찜목록에 있는 경우, 평점,리뷰,리뷰작성일,작성자만 초기화
			grade.setGrade(0); grade.setName(""); grade.setRegDate(""); grade.setReview("");
			dao.updateReview(grade);
		}else {
			dao.deleteReview(dto.getId(), movieListNum);	// 찜목록에 없는경우 리뷰 전체 삭제
		}
				
		return "리뷰 삭제 완료";
	}
	
	
}


