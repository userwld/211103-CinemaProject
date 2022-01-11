package com.star.cinema.movie.dao;

import org.springframework.stereotype.Repository;

import com.star.cinema.movie.dto.TicketingDTO;

@Repository
public interface ITicketingDAO {
	public void seatProc(TicketingDTO dto);
	public int searchMovieListNum(String movieName);
	public int searchCinemaNum(String cinemaName);
	public boolean deleteSeat(String id);
	
}
    