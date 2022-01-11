package com.star.cinema.movie.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.star.cinema.movie.dao.ITicketingDAO;
import com.star.cinema.movie.dto.TicketingDTO;

@Service
public class PayServiceImpl implements IPayService{
	@Autowired ITicketingDAO dao;
	@Autowired HttpSession session;

	@Override
	public boolean checkPay() {
		TicketingDTO dto = (TicketingDTO)session.getAttribute("seatList");
		dao.seatProc(dto);
		return true;
	}
	
	
	
}
