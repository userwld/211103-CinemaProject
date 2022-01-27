package com.star.cinema.movie.dao;

import java.util.ArrayList;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.star.cinema.movie.dto.GradeDTO;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.dto.TicketingDTO;

@Repository
public interface IGradeDAO {
	
	public MovieDTO selectMovieNum(int movieListNum);
	
	public ArrayList<GradeDTO> selectGrade(int movieListNum);
	
	public TicketingDTO selectReserve(@Param("id") String id, @Param("n") int movieListNum);
	
	public GradeDTO selectMyGrade(@Param("id") String id, @Param("n") int movieListNum);
	
	public double selectTotalGrade(int movieListNum);
	
	public void insertReview(GradeDTO dataGrade);

	public int selectTotalLike(int movieListNum);
	
	public void updateLike(@Param("movieListNum")int movieListNum, @Param("id")String id, @Param("condition")String condition);

	public void updateReview(GradeDTO dataGrade);

	public void insertLike(@Param("id")String id, @Param("movieListNum") int movieListNum);

	public ArrayList<GradeDTO> selectMyLike(String id);

	public String selectRecentReview(int movieListNum);

	public ArrayList<TicketingDTO> selectMyTickting(String id);
	// 오늘 기준 한달전 ~ 오늘 기준 일주일 후 기간내에 예매한 정보 리스트로 가져옴
	public ArrayList<TicketingDTO> selectRecentTicketing(String id);

	public String selectMyReview(@Param("movieListNum")int movieListNum, @Param("id")String id);

	public String selectCinemaName(int cinemaNum);

	public String selectHallName(int hallNum);

	public ArrayList<String> ticketingIdList(int movieListNum);
	
	public Set<String> isWoman();
	
	public Set<String> preferYear(@Param("start") String start, @Param("end")String end);

	public void deleteReview(@Param("id")String id, @Param("movieListNum") int movieListNum);
	

}
