package com.star.cinema.movie.service;

import java.util.List;

import org.springframework.ui.Model;

import com.star.cinema.movie.dto.MovieDTO;

public interface IMovieService {
	public List<MovieDTO> movieList();
	public void movieListProc(Model model);
	public void insertMovie(MovieDTO dto);
	public void deleteMovie(String movieName);
	public MovieDTO selectMovie(String movieName);
	public void changeMovie(MovieDTO movie);
	public void movieInfoListProc(Model model);
	
}
