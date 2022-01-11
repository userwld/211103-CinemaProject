package com.star.cinema.movie.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.star.cinema.movie.dao.IMovieDAO;
import com.star.cinema.movie.dto.MovieDTO;

@Service
public class MovieServiceImpl implements IMovieService{
   @Autowired HttpSession session;
   @Autowired IMovieDAO dao;
   @Autowired IMovieDetailService detail;
   
   @Override
   public void movieListProc(Model model) {
      List<MovieDTO> movieList = dao.movieList();
      Map<Integer,Double> totalLike = new HashMap<Integer, Double>();
      
      for (MovieDTO movie : movieList) {
    	  totalLike.put(movie.getMovieListNum(), detail.selectTotalGrade(movie.getMovieListNum()));
      }
      
      model.addAttribute("totalLike", totalLike);
      model.addAttribute("movieList", movieList);
   }
   
   @Override
   public void insertMovie(MovieDTO movie) {
      dao.insertMovie(movie);
   }
   
   @Override
   public void deleteMovie(String movieName) {
      dao.deleteMovie(movieName);
   }
   
   @Override
   public MovieDTO selectMovie(String movieName) {
      return dao.selectMovie(movieName);
   }
   
   @Override
   public void changeMovie(MovieDTO movie) {
      dao.changeMovie(movie);
      
   }

   @Override
   public void movieInfoListProc(Model model) {
      List<MovieDTO> movieList = dao.movieList();
      ArrayList<MovieDTO> nowMovie = new ArrayList<MovieDTO>();
      ArrayList<MovieDTO> laterMovie = new ArrayList<MovieDTO>();

      for(MovieDTO m : movieList) {
         if (m.getDday() < 0) {
            laterMovie.add(m);
         } else {
            nowMovie.add(m);
         }
      }

      movieListProc(model);
      
      if (!laterMovie.isEmpty()) {
         model.addAttribute("laterMovie", laterMovie);         
      } 
      if (!nowMovie.isEmpty()) {
         model.addAttribute("nowMovie", nowMovie);         
      }
   }

   @Override
   public List<MovieDTO> movieList() {
      return dao.movieList();
   }
}