package com.star.cinema.movie.service;

import java.util.ArrayList;
import java.util.Map;

import com.star.cinema.movie.dto.GradeDTO;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.dto.TicketingDTO;

public interface IMovieDetailService {

	public MovieDTO selectMovieNum(int movieListNum);

	public ArrayList<GradeDTO> selectGrade(int movieListNum);
	
	public TicketingDTO selectReserve(String id, int movieListNum);
	
	public GradeDTO selectMyGrade(String id, int movieListNum);

	public double selectTotalGrade(int movieListNum);
	
	public String reviewWriteProc(Map<String, String> map);

	public String likeCalcProc(Map<String, String> map);
	
	public int totalLike(int movieListNum);

	public double[] preferGender(int movieListNum);
	
	public double[] preferAge(int movieListNum);
	
	public double[] movieRank(int movieListNum);

}
