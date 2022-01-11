package com.star.cinema.myPage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.star.cinema.customer.dto.QuestionDTO;
import com.star.cinema.member.dto.MemberDTO;

@Repository
public interface IMyPageDAO {
	public int myQuestionCount(String id);

	public ArrayList<QuestionDTO> myQuestionList(@Param("id")String id, @Param("b")int begin, @Param("e")int end);

	public void modifyMember(MemberDTO dto);

	public void deleteMember(MemberDTO dto);
		
	
}
