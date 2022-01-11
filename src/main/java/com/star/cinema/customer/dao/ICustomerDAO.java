package com.star.cinema.customer.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.star.cinema.customer.dto.NoticeDTO;
import com.star.cinema.customer.dto.QuestionDTO;

@Repository
public interface ICustomerDAO {
	
	public int customerCount();
	public int customerSearchCount(@Param("search")String search,@Param("sel") String sel);
	public ArrayList<NoticeDTO> customerList(@Param("b")int begin, @Param("e")int end);
	public ArrayList<NoticeDTO> customerSearch(@Param("b")int begin, @Param("e")int end, @Param("search")String search, @Param("sel")String sel);

	public void insertNotice(NoticeDTO dto);
	public void updateHit(int noticeNum);
	public NoticeDTO selectNum(int noticeNum);
	public void updateNotice(NoticeDTO dto);
	public void deleteNotice(int noticeNum);
	
	
	public void insertQuestion(QuestionDTO dto);
	public int questionCount();
	public ArrayList<QuestionDTO> questionList(@Param("b")int begin, @Param("e")int end);
	public QuestionDTO selectQuesion(int questionNum);
	public void answerUpdate(@Param("answer") String answer, @Param("questionNum") int questionNum);

		
}
