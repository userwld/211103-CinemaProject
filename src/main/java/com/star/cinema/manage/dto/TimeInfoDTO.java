package com.star.cinema.manage.dto;

public class TimeInfoDTO {
	private int timeInfoNum;
	private String startTime;
	private int movieListNum;
	private int hallNum;
	private String ticketDate;
	private HallDTO hall;
	private CinemaDTO cinema;
	private int cinemaNum;
	private String movieName;
	
	public int getTimeInfoNum() {
		return timeInfoNum;
	}
	public void setTimeInfoNum(int timeInfoNum) {
		this.timeInfoNum = timeInfoNum;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public int getMovieListNum() {
		return movieListNum;
	}
	public void setMovieListNum(int movieListNum) {
		this.movieListNum = movieListNum;
	}
	public String getTicketDate() {
		return ticketDate;
	}
	public void setTicketDate(String ticketDate) {
		this.ticketDate = ticketDate;
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
	public int getCinemaNum() {
		return cinemaNum;
	}
	public void setCinemaNum(int cinemaNum) {
		this.cinemaNum = cinemaNum;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public int getHallNum() {
		return hallNum;
	}
	public void setHallNum(int hallNum) {
		this.hallNum = hallNum;
	}
	
	
	
	
	
}
