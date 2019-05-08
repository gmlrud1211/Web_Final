package com.allhotplace.www.dao.face.chatbot;

import java.util.List;

import com.allhotplace.www.dto.JChatbot;
import com.allhotplace.www.dto.MChatbot;
import com.allhotplace.www.dto.SChatbot;
import com.allhotplace.www.dto.XChatbot;

public interface ChatBotDao {

	public List<JChatbot> replyByContent(String content);

	//대분류 자동질문 전부 불러오기
	public List<XChatbot> selectAnswerListAll();
	
	//중분류 자동질문 전부 불러오기
	public List<MChatbot> selectMAnswerListAll();
	
	//소분류 자동질문 전부 불러오기
	public List<SChatbot> selectSAnswerListAll();
	
	
	//대분류 넘버에 따른 특정 중분류 자동질문 불러오기
	public List<MChatbot> selectMAnswerListByXno(int a);
	
	//중분류 넘버에 따른 특정 소분류 자동질문 불러오기
	public List<SChatbot> selectSAnswerListByMno(int a);
	
	//소분류 넘버에 따른 해당 답변 불러오기
	public SChatbot selectSAnswerBySno(int a);

}
