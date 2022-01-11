package com.star.cinema;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.star.cinema.manage.dao.IManageDAO;
import com.star.cinema.manage.dto.CinemaDTO;
import com.star.cinema.manage.dto.HallDTO;
import com.star.cinema.manage.dto.TicketingInfoDTO;
import com.star.cinema.manage.dto.TimeInfoDTO;
import com.star.cinema.manage.service.IManageService;
import com.star.cinema.movie.dto.MovieDTO;

@Controller
public class HomeController {
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   @Autowired IManageDAO dao;
   @Autowired IManageService service;
	
	public static List<CinemaDTO> cinemaList = new ArrayList<>();
	
   @RequestMapping(value = "/")
   public String main(Model model, HttpSession session) {
      session.removeAttribute("authState");
      headerCinemaAdd(model);
      model.addAttribute("formpath", "main");
      model.addAttribute("page","1");
      
      service.moviePoster(model);
      return "index";
   }
   @RequestMapping(value = "/main")
   public void main() {}
   
   @RequestMapping(value = "/index")
   public String index(Model model, HttpSession session, String formpath) {
      if(formpath == null) {
    	  formpath = "main";
    	  service.moviePoster(model);
      }
      model.addAttribute("formpath", formpath);
      headerCinemaAdd(model);
      logger.warn("formpath : " + formpath);
      return "index";
   }
   
   @RequestMapping(value = "/register1")
   public String register1() {
      return "member/register1";
   }
   @RequestMapping(value = "/register2")
   public String register2() {
      return "member/register2";
   }
   @RequestMapping(value="/register_final", method=RequestMethod.POST)
   public String register_final() {
      return "member/register_final";
   }
   
   @RequestMapping(value = "/memberList")
   public String memberList() {
      return "member/memberList";
   }
   
   @RequestMapping(value = "/managerModify")
   public String managerModify() {
      return "member/managerModify";
   }
   
   @RequestMapping(value = "/login")
   public String login() {
      return "member/login";
   }
   
   @RequestMapping(value = "/seat")
   public String seat(HttpSession session) {
	   if (session.getAttribute("selectTicket") != null) {
		   TicketingInfoDTO ticket = (TicketingInfoDTO) session.getAttribute("selectTicket"); 
		   service.movieSeatList(ticket);
	   } 

       return "movie/seat";
   }
   
   @RequestMapping(value = "/pay")
   public String pay() {
      return "movie/pay";
   }

   @RequestMapping(value="/movie")
   public String movie() {
      return "movie/movie";
   }

   @RequestMapping(value = "/movieInfoList")
   public String movieInfoList(Model model, String page) {
      model.addAttribute("page", page);
      return "movie/movieInfoList";
   }
   
   @RequestMapping(value="/myPage")
   public String myPage() {
      return "myPage/myPage";
   }
   @RequestMapping(value="/myMovieHistory")
   public String myMovieHistory() {
      return "myPage/myMovieHistory";
   }
   
   @RequestMapping(value="/myQuestion")
   public String myQuestion() {
      return "myPage/myQuestion";
   }
   @RequestMapping(value="/questionView")
   public String questionView() {
      return "myPage/questionView";
   }
   
   @RequestMapping(value="/myLike")
   public String myLike() {
      return "myPage/myLike";
   }
   
   @RequestMapping(value="/memberModify")
   public String memberModify() {
      return "myPage/memberModify";
   }
   
   @RequestMapping(value="/memberDelete")
   public String memberDelete() {
      return "myPage/memberDelete";
   }
      
   @RequestMapping(value="/customer")
   public String customer() {
      return "customer/customer";
   }
      
   @RequestMapping(value="/questionList")
   public String questionList() {
      return "customer/questionList";
   }
   
   @RequestMapping(value="/questionWrite")
   public String questionWrite() {
      return "customer/questionWrite";
   }

   @RequestMapping(value="/noticeView")
   public String noticeView() {
      return "customer/noticeView";
   }
   
   @RequestMapping(value="/noticeWrite")
   public String noticeWrite() {
      return "customer/noticeWrite";
   }   
   
   @RequestMapping(value="/noticeModify")
   public String noticeModify() {
      return "customer/noticeModify";
   }   

   @RequestMapping(value="/findid")
   public String findid() {
      return "manage/findid";
   }
   
   @RequestMapping(value="/findid2")
   public String findid2() {
      return "manage/findid_2";
   }
   
   @RequestMapping(value="/findpw")
   public String findpw() {
      return "manage/findpw";
   }
   
   @RequestMapping(value="/findpw2")
   public String findpw2() {
      return "manage/findpw_2";
   }
   
   @RequestMapping(value="/findpw3")
   public String findpw3() {
      return "manage/findpw_3";
   }
   
   @RequestMapping(value="/cinemaList")
   public String cinemaList() {
      return "manage/cinemaList";
   }
   
   @RequestMapping(value="/timeInfo")
   public String timeInfo() {
      return "manage/timeInfo";
   }
   
   @RequestMapping(value="/timeInfoInsert")
   public String timeInfoInsert() {
      return "manage/timeInfoInsert";
   }
   
   @RequestMapping(value="/movieDetail")
   public String movieDetail() {
      return "movie/movieDetail";
   }
   
   public void headerCinemaAdd(Model model) {
		cinemaList = dao.AllCinemaList();
		
		List<String> countryList = new ArrayList<>();
		for (CinemaDTO info : this.cinemaList) {
			boolean insert = true;
			for (String check : countryList) {
				if (check.equals(info.getCountryName())) {
					insert = false;
					break;
				}
			}
			if (insert) {
				countryList.add(info.getCountryName());
			}
		}
		
		
		model.addAttribute("countryList", countryList);
		model.addAttribute("cinemaList", cinemaList);
	}
   
   
}