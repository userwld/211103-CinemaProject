package com.star.cinema.manage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.star.cinema.manage.dto.CinemaDTO;
import com.star.cinema.manage.dto.HallDTO;
import com.star.cinema.manage.dto.TimeInfoDTO;
import com.star.cinema.manage.dto.TimeManageDTO;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.dto.TicketingDTO;

@Repository
public interface IManageDAO {
	public int cinemaCount();
	public int timeInfoCount();
	
	public ArrayList<TimeInfoDTO> timeInfoList();
	public ArrayList<HallDTO> hallList();
	public void cinemaInsert(CinemaDTO cinema);
	public ArrayList<CinemaDTO> cinemaList(@Param("b")int begin, @Param("e")int end);
	public ArrayList<MovieDTO> movieList(@Param("b")int begin, @Param("e")int end);
	public ArrayList<CinemaDTO> cinemaSearchForName(@Param("search") String search);
	public ArrayList<CinemaDTO> AllCinemaList();
	public boolean cinemaDelete(int cinemaNum);
	public int cinemaName(String search);
	public boolean timeInfoDelete(int timeInfoNum);
	public boolean hallDelete(int num);
	public void timeInfoInsert(TimeInfoDTO timeInfo);
	public void hallInsert(HallDTO hall);
	public TimeInfoDTO timeSelect(@Param("cinemaNum")int cinemaNum, @Param("movieListNum")int movieListNum,  @Param("hallNum")int hallNum);
	public ArrayList<TimeInfoDTO> timeSearch(int cinemaNum);
	public HallDTO hallSelect(@Param("cinemaNum")int cinemaNum, @Param("hallNum")int hallNum);
	public ArrayList<HallDTO> hallSearch(int cinemaName);
	public ArrayList<CinemaDTO> cinemaSearch(int cinemaNum);
	
	public ArrayList<TicketingDTO> movieSeatList(@Param("movieListNum")int movieListNum, @Param("hallNum")int hallNum, @Param("cinemaNum")int cinemaNum, @Param("OpenDate")String OpenDate, @Param("OpenTime")String OpenTime);
	public ArrayList<MovieDTO> movieInfo();

	public ArrayList<Integer>groupCount();
	public int moiveCount(int movieListNum);
	public int totalTicketCount();
	public int hallNum(String hallName);
	public ArrayList<Integer> movieCount();
	
	
}
