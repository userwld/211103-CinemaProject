package com.star.cinema.movie.dto;

public class TicketingDTO {
	private int ticketingNum;
	private String id;
	private String seatName;
	private String openDate;
	private String openTime;
	private String people;
	private String totalPrice;
	private int movieListNum;
	private int cinemaNum;
	private int hallNum;
	private String moiveName;
	
	public int getTicketingNum() {
		return ticketingNum;
	}
	public void setTicketingNum(int ticketingNum) {
		this.ticketingNum = ticketingNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getMovieListNum() {
		return movieListNum;
	}
	public void setMovieListNum(int movieListNum) {
		this.movieListNum = movieListNum;
	}
	public int getCinemaNum() {
		return cinemaNum;
	}
	public void setCinemaNum(int cinemaNum) {
		this.cinemaNum = cinemaNum;
	}
	public int getHallNum() {
		return hallNum;
	}
	public void setHallNum(int hallNum) {
		this.hallNum = hallNum;
	}
	public String getMoiveName() {
		return moiveName;
	}
	public void setMoiveName(String moiveName) {
		this.moiveName = moiveName;
	}
	
}
