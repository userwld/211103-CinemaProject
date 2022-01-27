package com.star.cinema.movie;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.cinema.movie.dto.GradeDTO;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.service.IMovieDetailService;

@Controller
public class MovieDetailController {
	final static Logger logger = LoggerFactory.getLogger(MovieDetailController.class);
	@Autowired IMovieDetailService service;
	
	/* 영화상세정보 페이지*/
	@RequestMapping(value = "/movieDetailProc")
	public String movieDetailProc(int movieListNum, Model model) {
		
		MovieDTO movie = service.selectMovieNum(movieListNum);		
		ArrayList<GradeDTO> grade = service.selectGrade(movieListNum);
		double totalGrade = service.selectTotalGrade(movieListNum);
		int totalLike = service.totalLike(movieListNum);
		double[] prefer = service.preferGender(movieListNum);			// 해당 영화의 성별 선호도
		double[] ageList = service.preferAge(movieListNum);				// 해당 영화의 연령별 선호도
		double[] rank = service.movieRank(movieListNum);				// 해당 영화의 예매율 순위/예매율
		
		model.addAttribute("movie", movie);
		model.addAttribute("grade", grade);
		model.addAttribute("totalGrade", totalGrade);
		model.addAttribute("totalLike", totalLike);
		model.addAttribute("prefer", prefer);
		model.addAttribute("ageList", ageList);
		model.addAttribute("ticketingRank", rank);
		
		return "forward:index?formpath=movieDetail";
	}
	
	/* 영화상세페이지 - 리뷰작성 */
	@RequestMapping(value="/reivewWriteProc", produces = "application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> reivewWriteProc(@RequestBody Map<String,String> map) {
		
		map.put("msg",service.reviewWriteProc(map));
		return map;
	}
	
	/* 영화상세페이지 - 찜하기 */
	@RequestMapping(value="/likeCalcProc", produces = "application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> likeCalcProc(@RequestBody Map<String,String> map) {
		
		map.put("msg",service.likeCalcProc(map));
		return map;
	}
	
	/* 영화상세페이지 - 리뷰삭제 */
	@RequestMapping(value="/reviewDeleteProc", produces = "application/json; charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> reviewDeleteProc(@RequestBody Map<String,String> map) {
		map.put("msg", service.reviewDeleteProc(map));
		return map;
	}
	
}
