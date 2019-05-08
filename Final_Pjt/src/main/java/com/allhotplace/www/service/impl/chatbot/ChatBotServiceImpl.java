package com.allhotplace.www.service.impl.chatbot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.chatbot.ChatBotDao;
import com.allhotplace.www.dto.JChatbot;
import com.allhotplace.www.service.face.chatbot.ChatBotService;

@Service
public class ChatBotServiceImpl implements ChatBotService{

	@Autowired ChatBotDao chatBotDao;

	@Override
	public List<JChatbot> reply(String content) {
		
		System.out.println("service: "+chatBotDao.replyByContent(content));
		return chatBotDao.replyByContent(content);
	}

//	@Override
//	public List answer() {
//		System.out.println("service: "+chatBotDao.selectAnswerListAll());
//		return chatBotDao.selectAnswerListAll();
//	}
}
