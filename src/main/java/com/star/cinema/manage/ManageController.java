package com.star.cinema.manage;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.cinema.manage.service.IManageService;

@Controller
public class ManageController {
	@Autowired IManageService service;
	
	@RequestMapping(value = "cinemaListProc")
	public String cinemaList(Model model, @RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage , String search) {
		System.out.println(search);
		if(search == null || search == "") {
			service.cinemaList(model, currentPage);
		} else {
			service.cinemaSearch(model, search);
		}
		return "forward:/index?formpath=cinemaList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cinemaInsert")
	public void cinemaInsert(@RequestBody Map<String,String> map) {
		service.cinemaInsert(map.get("countryName"), map.get("cinemaName"));
	}
	
	@ResponseBody
	@RequestMapping(value = "/cinemaDelete")
	public void cinemaDelete(@RequestBody Map<String,String> map) {
		int cinemaNum = Integer.parseInt(map.get("id"));
		service.cinemaDelete(cinemaNum);
	}
	
	@RequestMapping(value = "timeInfoProc")
	public String timeInfoProc(Model model, String search) {
		if(search == null || search == "") {
			service.timeInfoList(model);
		}
		else {
			service.timeInfoSearch(model, search, "insert");
		}
		return "forward:/index?formpath=timeInfo";
	}
	
	@RequestMapping(value = "timeInfoDeleteProc")
	public String timeInfoDeleteProc(Model model, String hallName, int timeInfoNum) {
		service.timeInfoDeleteProc(hallName, timeInfoNum);
		return "redirect:/timeInfoProc";
	}
	
	@RequestMapping(value = "timeInsertProc")
	public String timeInsertProc(Model model, String countryName, String cinemaName, String movieName, String hallName, String ticketDate, String startTime) {
		service.timeInfoInsertProc(countryName, cinemaName, movieName, hallName, ticketDate, startTime);
		return "redirect:/timeInfoProc";
	}
}
