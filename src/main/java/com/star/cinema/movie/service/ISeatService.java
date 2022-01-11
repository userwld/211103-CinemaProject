package com.star.cinema.movie.service;

import com.star.cinema.movie.dto.TicketingDTO;

public interface ISeatService {
	public boolean seatProc(TicketingDTO dto, String hallName);
	
}
   