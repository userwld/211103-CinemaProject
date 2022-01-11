package com.star.cinema.movie.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.star.cinema.member.dto.MemberDTO;
import com.star.cinema.movie.dto.MovieDTO;

@Repository
public interface IMovieDAO {

	public List<MovieDTO> movieList();
	public void insertMovie(MovieDTO movie);
	public void deleteMovie(String movieName);
	public MovieDTO selectMovie(String movieName);
	public MovieDTO searchMovie(int movieListNum);
	public void changeMovie(MovieDTO movie);
	public ArrayList<String> selectDate();
	public int movieCount();
	public ArrayList<Integer> movieListNum();
	public ArrayList<Integer> selectMovieListNum(String movieOpen);
}
