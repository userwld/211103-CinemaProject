package com.star.cinema.manage.service;

import java.util.Map;

import org.springframework.ui.Model;

import com.star.cinema.manage.dto.TicketingInfoDTO;

public interface IManageService {
	public void cinemaList(Model model, int currentPage);
	public void cinemaSearch(Model model, String search);
	public void cinemaInsert(String countryName, String cinemaName);
	public void cinemaDelete(int id);
	
	public boolean timeInfoDeleteProc(String hallName, int timeInfoNum);
	public boolean timeInfoInsertProc(String countryName, String cinemaName, String movieName, String hallName, String ticketDate, String startTime);
	public void timeInfoSearch(Model model, String search, String type);
	public void selectMovie(Model model, String movie);
	public void selectDate(Model model, String date);
	public boolean selectTime(Model model, Map<String, String> map);
	public void moviePoster(Model model);
	public void movieSeatList(TicketingInfoDTO ticket);
	
	public void timeInfoList(Model model);
}
