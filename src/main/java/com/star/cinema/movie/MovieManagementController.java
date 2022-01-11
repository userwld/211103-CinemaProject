package com.star.cinema.movie;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.cinema.manage.service.IManageService;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.service.IMovieDetailService;
import com.star.cinema.movie.service.IMovieService;

@Controller
public class MovieManagementController {
	@Autowired IMovieService service;
	@Autowired IManageService manage;
	
	@RequestMapping(value="/movieManagement")
	public String movieManagement(ModelMap model, HttpSession session) {
		List<MovieDTO> movielist = service.movieList();
		model.addAttribute("movieList", movielist);
		return "manage/movieManagement";
	}
	
	@ResponseBody
	@RequestMapping(value = "movieInfoInsert", method = RequestMethod.POST)
	public void MovieInfoInsert(@RequestBody Map<String,String> map) {
		MovieDTO movie = new MovieDTO();
		movie.setMovieName(map.get("name"));
		movie.setMoviePoster(map.get("poster"));
		movie.setMovieGenre(map.get("genre"));
		movie.setMovieDirector(map.get("director"));
		movie.setMovieAge(map.get("age"));
		movie.setMovieCountry(map.get("country"));
		movie.setMovieTime(map.get("time"));
		movie.setMovieActors(map.get("actors"));
		movie.setMovieOpen(map.get("open"));
		movie.setMovieDetail(map.get("detail"));
		
		service.insertMovie(movie);
		
	}
	
	@RequestMapping(value = "movieInfoDelete", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
	public String MovieInfoDelete(@RequestBody Map<String,String> map) {
		String movieName = (String) map.get("name");
		
		service.deleteMovie(movieName);
		
		return "redirect:index?formpath=movieManagement";
	}
	
	@RequestMapping(value = "movieInfoSelect", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
	public String MovieInfoSelect(HttpSession session, @RequestBody Map<String,String> map) {
		String movieName = (String) map.get("name");
		MovieDTO movie = service.selectMovie(movieName);
		session.setAttribute("movieSelect", service.selectMovie(movieName));
		return "redirect:index?formpath=movieManagement";
	}
	
	@RequestMapping(value = "movieInfoChangeCancel")
	public String MovieInfoChangeCancel(HttpSession session) {
		if (session.getAttribute("movieSelect") != null) {
			session.removeAttribute("movieSelect");
		}
		
		return "redirect:index?formpath=movieManagement";
	}
	
	@ResponseBody
	@RequestMapping(value = "movieInfoChange")
	public void MovieInfoChange(HttpSession session, @RequestBody Map<String,String> map) {
		MovieDTO movie = (MovieDTO) session.getAttribute("movieSelect");
		movie.setMovieName(map.get("name"));
		movie.setMoviePoster(map.get("poster"));
		movie.setMovieGenre(map.get("genre"));
		movie.setMovieDirector(map.get("director"));
		movie.setMovieAge(map.get("age"));
		movie.setMovieCountry(map.get("country"));
		movie.setMovieTime(map.get("time"));
		movie.setMovieActors(map.get("actors"));
		movie.setMovieOpen(map.get("open"));
		movie.setMovieDetail(map.get("detail"));
		
		service.changeMovie(movie);
		
		if (session.getAttribute("movieSelect") != null) {
			session.removeAttribute("movieSelect");
		}
	}
	
	@RequestMapping(value = "movieListProc")
	public String MovieListProc(Model model) {
		service.movieListProc(model);
		manage.moviePoster(model);
		return "forward:/index?formpath=movie";
	}
	
	@RequestMapping(value = "movieInfoListProc")
	public String MovieInfoListProc(Model model) {
		service.movieInfoListProc(model);
		manage.moviePoster(model);
		return "forward:/index?formpath=movieInfoList";
	}
}