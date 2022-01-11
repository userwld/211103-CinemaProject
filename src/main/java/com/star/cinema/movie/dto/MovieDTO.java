package com.star.cinema.movie.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 	CREATE TABLE MovieList(
	movieListNum number not null,
	movieName varchar2(50),
	movieGenre varchar2(100),
	movieDetail varchar2(2000),
	movieOpen varchar2(15),
	movieDirector varchar2(50),
	movieActors varchar2(500),
	movieAge varchar2(10),
	moviePoster varchar2(50),
	movieCountry varchar2(50),
	movieTime varchar2(10),
	primary key(movieListNum));
	
	CREATE SEQUENCE movie_list_seq INCREMENT BY 1 START WITH 1;

 */

public class MovieDTO {
	private int movieListNum;
	private String movieName, movieGenre, movieDetail, movieOpen, movieDirector, movieActors, movieAge, moviePoster, movieCountry, movieTime;
	
	public int getMovieListNum() {
		return movieListNum;
	}
	public void setMovieListNum(int movieListNum) {
		this.movieListNum = movieListNum;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieGenre() {
		return movieGenre;
	}
	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}
	public String getMovieDetail() {
		return movieDetail;
	}
	public void setMovieDetail(String movieDetail) {
		this.movieDetail = movieDetail;
	}
	public String getMovieOpen() {
		return movieOpen;
	}
	public void setMovieOpen(String movieOpen) {
		this.movieOpen = movieOpen;
	}
	public String getMovieDirector() {
		return movieDirector;
	}
	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}
	public String getMovieActors() {
		return movieActors;
	}
	public void setMovieActors(String movieActors) {
		this.movieActors = movieActors;
	}
	public String getMoviePoster() {
		return moviePoster;
	}
	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}
	public String getMovieCountry() {
		return movieCountry;
	}
	public void setMovieCountry(String movieCountry) {
		this.movieCountry = movieCountry;
	}
	public String getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(String movieTime) {
		this.movieTime = movieTime;
	}
	public String getMovieAge() {
		return movieAge;
	}
	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}
	
	public long getDday() {
	    Date d = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	    
	    String strStartDate = sdf.format(d);
        String strEndDate = getMovieOpen().replaceAll("-", "");
        long diffDay = 0;
        
        try {
	        Date startDate = sdf.parse(strStartDate);
	        Date endDate = sdf.parse(strEndDate);
	        
	        diffDay = (startDate.getTime() - endDate.getTime()) / (24*60*60*1000);
        } catch (Exception e) {
        	
        }

		return diffDay;
	}
	
	

	
	

}
