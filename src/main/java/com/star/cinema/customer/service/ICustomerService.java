package com.star.cinema.customer.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.star.cinema.customer.dto.NoticeDTO;
import com.star.cinema.customer.dto.QuestionDTO;
import com.star.cinema.customer.dto.SearchDTO;

public interface ICustomerService {
	
	public void customerList(Model model, int currentPage);
	public void customerSearch(Model model,int currentPage, SearchDTO dto);
	public boolean insertNotice(String theater, String self_theater, String title, String content);
	public NoticeDTO noticeViewProc(String num);
	public void noticeModifyProc(NoticeDTO dto,String num);
	public void noticeDeleteProc(String num);
	
	String FILE_LOCATION ="C:\\java_folder\\upload";
	public boolean questionWriteProc(MultipartHttpServletRequest req);
	public void questionList(Model model, int currentPage);
	public QuestionDTO questionViewProc(String num);
	public void answerUpdate(String answer, String num);

	

		

}
