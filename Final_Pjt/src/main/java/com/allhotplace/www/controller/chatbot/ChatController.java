package com.allhotplace.www.controller.chatbot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.dao.face.chatbot.ChatBotDao;
import com.allhotplace.www.dao.face.chatbot.ChatroomDao;
import com.allhotplace.www.dao.face.chatbot.ChattalkDao;
import com.allhotplace.www.dao.face.user.UserDao;
import com.allhotplace.www.dto.Chatroom;
import com.allhotplace.www.dto.Chattalk;
import com.allhotplace.www.dto.JChatbot;
import com.allhotplace.www.dto.MChatbot;
import com.allhotplace.www.dto.SChatbot;
import com.allhotplace.www.dto.Users;
import com.allhotplace.www.dto.XChatbot;
import com.allhotplace.www.service.face.chatbot.ChatBotService;

@Controller
public class ChatController {
	
	@Autowired ChatBotService chatBotService;
	@Autowired ChatBotDao chatBotDao;
	@Autowired UserDao userDao;
	@Autowired ChatroomDao chatroomDao;
	@Autowired ChattalkDao chattalkDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	

	//채팅ajax
	@RequestMapping(value="/chatAjax", method=RequestMethod.POST)
	public String chatAjax(Model model, String content1, HttpSession session) {
		
		logger.info(content1);
		
		//채팅입력값으로 질문목록 불러오기
		List<JChatbot> replyContent = chatBotService.reply(content1);
		logger.info(replyContent.toString());
		
		if(content1.isEmpty()) {
			model.addAttribute("reply", "올바른 메시지를 보내주세요!");
		} else if(!content1.isEmpty()){
			
			if(replyContent.isEmpty()) {
				model.addAttribute("reply", "조회된 결과가 없습니다.");
			} else {
				model.addAttribute("reply", replyContent);
			}
		}
		
		
		//세션으로 로그인한 아이디 가져옴
		String userid = (String) session.getAttribute("user_id");
		model.addAttribute("login", !userid.equals(null));
		
		//로그인했을때
		if(!userid.equals(null)) {
			model.addAttribute("userid", session.getAttribute("user_id"));
			model.addAttribute("content1", content1);
			
		//로그인 안했을떄
		}else {
			return "jsonView";
		}
		
//		model.addAttribute("reply", replyContent);
//		logger.info(replyContent.getsChat_answer());
		
		return "jsonView";
	}
	
	//질문리스트(대분류)ajax
	@RequestMapping(value="/chatAjax_ansList")
	public String chatAjax_ansList(Model model) {
		
		logger.info("AJAX 질문리스트 불러오기");
		
		
		List<XChatbot> xlist = chatBotDao.selectAnswerListAll();
		logger.info(xlist.toString());
		
		model.addAttribute("xlist", xlist);
		
		return "jsonView";
	}
	
	//질문입력(대분류) -> 하위질문출력(중분류) ajax
	@RequestMapping(value="/chatAjax_XChatList", method=RequestMethod.POST)
	public String chatAjax_XChatList(Model model, HttpSession session, int a) {
		
		logger.info("AJAX 대분류 버튼 클릭");
		
		model.addAttribute("userid", session.getAttribute("user_id"));
		
		List<XChatbot> xlist = chatBotDao.selectAnswerListAll();
		logger.info(xlist.toString());
		
		model.addAttribute("xlist", xlist);
		
		System.out.println("$(\"btnXChatList\") : "+a);
		
		List<MChatbot> mlist = chatBotDao.selectMAnswerListByXno(a);
		logger.info(mlist.toString());
		
		model.addAttribute("mlist", mlist);
		
		return "jsonView";
	}
	
	//질문입력(중분류) -> 하위질문출력(소분류) ajax
	@RequestMapping(value="/chatAjax_MChatList", method=RequestMethod.POST)
	public String chatAjax_MChatList(Model model, HttpSession session, int a) {
		
		logger.info("AJAX 중분류 버튼 클릭");
		
		model.addAttribute("userid", session.getAttribute("user_id"));
		
		List<MChatbot> mlist = chatBotDao.selectMAnswerListAll();
		logger.info(mlist.toString());
		
		model.addAttribute("mlist", mlist);
		
		System.out.println("$(\"btnMChatList\") : "+a);
		
		List<SChatbot> slist = chatBotDao.selectSAnswerListByMno(a);
		logger.info(slist.toString());
		
		model.addAttribute("slist", slist);
		
		return "jsonView";
	}
	
	//질문입력(소분류) -> 하위질문출력(소분류 답변) ajax
	@RequestMapping(value="/chatAjax_SChatList", method=RequestMethod.POST)
	public String chatAjax_SChatList(Model model, HttpSession session, int a) {
		
		logger.info("AJAX 소분류 버튼 클릭");
		
		model.addAttribute("userid", session.getAttribute("user_id"));
		
		List<SChatbot> slist = chatBotDao.selectSAnswerListAll();
		logger.info(slist.toString());
		
		model.addAttribute("slist", slist);
		
		SChatbot slistAnswer = chatBotDao.selectSAnswerBySno(a);
		logger.info(slistAnswer.toString());
		
		model.addAttribute("answer", slistAnswer);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/chat/read")
	public void chat1on1() {
		logger.info("1대1채팅");
	}
	
	@RequestMapping(value="/createChatRoom")
	public String createChatRoom(HttpSession session, HttpServletRequest request) {
		
		String user_id = (String)session.getAttribute("user_id");
		logger.info("createChatRoom 유저아이디: "+user_id);
		
		//세션에서 가져온 유저아이디로 유저정보 조회
		Users user = userDao.selectUserInfo(user_id);
		logger.info("조회한 유저정보: "+user.toString());
		
		logger.info("접속한 유저 ip: "+request.getRemoteAddr());
		
		//dto에 접속유저번호, 유저ip저장
		Chatroom chatroom = new Chatroom();
		
		System.out.println(user.getUser_no());
		chatroom.setUser_no(user.getUser_no());
		chatroom.setChatroom_userIp(request.getRemoteAddr());
		
		
		//채팅방이 존재하지 않을 때 해당 유저 전용 새로운 채팅방 생성
		if(chatroomDao.checkChatroom(user.getUser_no())==false) {
			logger.info("채팅방 생성");
			logger.info("채팅방 boolean: " + chatroomDao.checkChatroom(user.getUser_no()));
			chatroomDao.createChatroom(chatroom);
			logger.info("chatroom_idx: "+ chatroom.getChatroom_idx());
			chatroom.setChatroom_idx(chatroom.getChatroom_idx());
			
			session.setAttribute("chatroom_idx", Integer.toString(chatroom.getChatroom_idx()));
			logger.info("session_chatroom_idx: "+session.getAttribute("chatroom_idx"));
			logger.info("세션채팅방확인:"+session.getAttribute("chatroom_idx"));
			
			logger.info("만들어진 채팅방 조회" + chatroomDao.selectChatroomByUser_no(user.getUser_no()));
		} else {
			logger.info("채팅방 이미 존재");
			
			chatroom.setChatroom_idx(chatroomDao.selectChatroomByUser_no(user.getUser_no()).getChatroom_idx());
			logger.info("chatroom:"+chatroom);
			session.setAttribute("chatroom_idx", Integer.toString(chatroom.getChatroom_idx()));
			logger.info("세션채팅방확인:"+session.getAttribute("chatroom_idx"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/chatList")
	public String chatList(Model model, HttpSession session) {
		
		String idxxx= (String)session.getAttribute("chatroom_idx");
		int chatroom_idx1 = Integer.parseInt(idxxx);
		
		List<Chattalk> chatlist = 
				chattalkDao.selectChatListByChatroomIdx(chatroom_idx1);
		logger.info("chatlist: "+chatlist.toString());
		
		model.addAttribute("user_id", session.getAttribute("user_id"));
		model.addAttribute("chatlist", chatlist);
		
		return "jsonView";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
