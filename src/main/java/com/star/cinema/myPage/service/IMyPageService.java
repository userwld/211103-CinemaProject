package com.star.cinema.myPage.service;

import org.springframework.ui.Model;

public interface IMyPageService {

	public boolean myQuestionList(Model model, int currentPage);

	public boolean modifyProc(String pw, String pwChk, String phone1, String phone2, String phone3, String zipcode,
			String addr1, String addr2);

	public void deleteProc();

	public boolean myLikeProc(Model model);

	public boolean ticketingHistory(Model model, String recent);
	
	public String timeCalc(String day, String oldTime, String runningTime);
	
}
