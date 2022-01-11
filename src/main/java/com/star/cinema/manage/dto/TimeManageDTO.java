package com.star.cinema.manage.dto;

public class TimeManageDTO {
	private int timeInfoNum;
	private String countryName;
	private String cinemaName;
	private String movieName;
	private String hallName;	
	private String ticketDate;
	private String startTime;
	
	public int getTimeInfoNum() {
		return timeInfoNum;
	}
	public void setTimeInfoNum(int timeInfoNum) {
		this.timeInfoNum = timeInfoNum;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	public String getCinemaName() {
		return cinemaName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	public String getTicketDate() {
		return ticketDate;
	}
	public void setTicketDate(String ticketDate) {
		this.ticketDate = ticketDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	
	
}
