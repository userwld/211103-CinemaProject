package com.star.cinema.movie;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.cinema.manage.service.IManageService;
import com.star.cinema.movie.dto.MovieDTO;
import com.star.cinema.movie.dto.TicketingDTO;
import com.star.cinema.movie.service.IMovieService;
import com.star.cinema.movie.service.IPayService;
import com.star.cinema.movie.service.ISeatService;

@Controller
public class TicketingController {
	@Autowired ISeatService seatService;
	@Autowired IPayService payService;
	@Autowired IMovieService movieService;
	@Autowired IManageService manageService;
	
	@RequestMapping(value = "/ticketing")
	public String ticketing(Model model, HttpSession session) {
		if (session.getAttribute("loginInfo") == null) {
			return "member/login";
		}
		List<MovieDTO> movieList = movieService.movieList();
		model.addAttribute("movieList", movieList);
		

		if (session.getAttribute("selectDate") == null) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			session.setAttribute("selectDate", df.format(new Date()));
		}
		
		return "movie/ticketing";
	}
	
	@ResponseBody
	@RequestMapping(value = "selectCinema")
	public void selectCinema(Model model, @RequestBody Map<String, String> map) {
		manageService.timeInfoSearch(model, map.get("name"), "search");
	}
	
	@ResponseBody
	@RequestMapping(value = "selectMovie")
	public void selectMovie(Model model, HttpSession session, @RequestBody Map<String, String> map) {
		if (session.getAttribute("selectCinema") != null) {
			manageService.selectMovie(model, map.get("movieName"));
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "selectTime")
	public boolean selectTime(Model model, @RequestBody Map<String, String> map) {
		return manageService.selectTime(model, map);
	}
	
	@ResponseBody
	@RequestMapping(value = "selectDate")
	public void selectDate(Model model, HttpSession session, @RequestBody Map<String, String> map) {
		session.setAttribute("selectDate", map.get("date"));
		if (session.getAttribute("selectCinema") != null) {
			manageService.selectDate(model, map.get("date"));
		}
	}

	
	@RequestMapping (value = "seatProc")
	public String seatInsert(Model model, String title, String reserveDate, String runningTime, String totalPrice,
		   String ticketNumber, String selectedSeat, String movieListName, String cinemaName, String hallName) {
		TicketingDTO dto = new TicketingDTO();
		dto.setMoiveName(title);
		dto.setOpenDate(reserveDate);
		dto.setOpenTime(runningTime);
		dto.setTotalPrice(totalPrice.replaceAll("원", ""));
		dto.setPeople(ticketNumber);
		dto.setSeatName(selectedSeat);
		
		boolean check = seatService.seatProc(dto, hallName);
		if(check) {
			return "forward:/index?formpath=pay";
		} else {
			return "forward:/index?formpath=seat";
		}
	}
	
	@RequestMapping (value = "payProc")
	public String payProc(Model model) {
		boolean check = payService.checkPay();
		if(check) {     
			model.addAttribute("msg", "결제에 성공하였습니다.");
		}
		else {
			model.addAttribute("msg", "결제에 실패하였습니다.");
		}
		return "forward:ticketingHistory";
	}
	
	


}