package com.allhotplace.www.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.admin.ChatbotDao;
import com.allhotplace.www.dto.MChatbot;
import com.allhotplace.www.dto.SChatbot;
import com.allhotplace.www.dto.XChatbot;
import com.allhotplace.www.service.face.admin.ChatbotService;

@Service
public class ChatbotServiceImpl implements ChatbotService {

	@Autowired ChatbotDao chatbotDao;
	
	@Override
	public List<XChatbot> selectXchat() {
		return chatbotDao.selectXchat();
	}

	@Override
	public List<MChatbot> selectMchat() {
		return chatbotDao.selectMchat();
	}

	@Override
	public List<SChatbot> selectSchat() {
		return chatbotDao.selectSchat();
	}

	@Override
	public void InsertSchat(SChatbot schat) {
		chatbotDao.InsertSchat(schat);		
	}

	@Override
	public void updateSchat(SChatbot schat) {
		chatbotDao.updateSchat(schat);		
	}

	@Override
	public void delectSchat(SChatbot schat) {
		chatbotDao.delectSchat(schat);
	}

	@Override
	public SChatbot viewSchat(SChatbot schat) {
		return chatbotDao.viewSchat(schat);
	}

}

















