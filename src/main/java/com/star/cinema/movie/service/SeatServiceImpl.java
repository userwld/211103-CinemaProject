package com.star.cinema.movie.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.star.cinema.manage.dto.CinemaDTO;
import com.star.cinema.manage.dto.HallDTO;
import com.star.cinema.manage.dto.TicketingInfoDTO;
import com.star.cinema.member.dto.MemberDTO;
import com.star.cinema.movie.dao.ITicketingDAO;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.dto.TicketingDTO;

@Service
public class SeatServiceImpl implements ISeatService{
	@Autowired ITicketingDAO dao;
	@Autowired HttpSession session;
	
	@Override
	public boolean seatProc(TicketingDTO dto, String hallName) {
		if (session.getAttribute("selectTicket") == null) {
			return false;
		}
		
		MovieDTO movie = ((TicketingInfoDTO) session.getAttribute("selectTicket")).getMovie();
		CinemaDTO cinema = ((TicketingInfoDTO) session.getAttribute("selectTicket")).getCinema();
		HallDTO hall = ((TicketingInfoDTO) session.getAttribute("selectTicket")).getHall();
		
		int movieListNum = movie.getMovieListNum();
		int cinemaNum = cinema.getCinemaNum();
		
		dto.setMovieListNum(movieListNum);
		dto.setCinemaNum(cinemaNum);
		
		MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
		String id = member.getId();
		dto.setId(id);
		dto.setHallNum(hall.getHallNum());
		
		session.setAttribute("seatList", dto);
		
		return true;
	}    
	
}
