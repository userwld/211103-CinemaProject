package com.star.cinema.manage.dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.star.cinema.manage.dao.IManageDAO;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.dto.TicketingDTO;

public class TicketingInfoDTO {
	
	private TimeInfoDTO time;
	private HallDTO hall;
	private CinemaDTO cinema;
	private MovieDTO movie;
	private int reservingSeat;
	
	
	public TimeInfoDTO getTime() {
		return time;
	}
	public void setTime(TimeInfoDTO time) {
		this.time = time;
	}
	public HallDTO getHall() {
		return hall;
	}
	public void setHall(HallDTO hall) {
		this.hall = hall;
	}
	public CinemaDTO getCinema() {
		return cinema;
	}
	public void setCinema(CinemaDTO cinema) {
		this.cinema = cinema;
	}
	public MovieDTO getMovie() {
		return movie;
	}
	public void setMovie(MovieDTO movie) {
		this.movie = movie;
	}
	
	public int getReservingSeat() {
		return reservingSeat;
	}
	public void setReservingSeat(int reservingSeat) {
		this.reservingSeat = reservingSeat;
	}
	public String endTime() {
		String[] date = time.getTicketDate().split("-");
		String[] date2 = time.getStartTime().split(":");
		Calendar cal = Calendar.getInstance();
		Date startTime = new Date(Integer.parseInt(date[0]) - 1900, Integer.parseInt(date[1]) - 1, Integer.parseInt(date[2]), Integer.parseInt(date2[0]), Integer.parseInt(date2[1]));
        cal.setTime(startTime);
        DateFormat df = new SimpleDateFormat("HH:mm");
        cal.add(Calendar.MINUTE, Integer.parseInt(movie.getMovieTime()));
		return df.format(cal.getTime());
	}
	
	
	

}
