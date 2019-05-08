package com.allhotplace.www.dao.face.admin;

import java.util.List;

import com.allhotplace.www.dto.MChatbot;
import com.allhotplace.www.dto.SChatbot;
import com.allhotplace.www.dto.XChatbot;

public interface ChatbotDao {

	// 대분류 챗봇 리스트 조회
	public List<XChatbot> selectXchat();

	// 중분류 챗봇 리스트 조회
	public List<MChatbot> selectMchat();

	// 소분류 챗봇 리스트 조회
	public List<SChatbot> selectSchat();
	
	// 소분류 챗봇 상세조회
	public SChatbot viewSchat(SChatbot schat);

	
	// 소분류 등록
	public void InsertSchat(SChatbot schat);

	// 소분류 수정
	public void updateSchat(SChatbot schat);

	// 소분류 삭제
	public void delectSchat(SChatbot schat);
}
