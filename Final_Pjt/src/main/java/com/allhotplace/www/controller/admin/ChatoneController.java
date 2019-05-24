package com.allhotplace.www.controller.admin;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.allhotplace.www.dao.face.user.UserDao;
import com.allhotplace.www.dto.Chatroom;
import com.allhotplace.www.dto.Chattalk;
import com.allhotplace.www.dto.Users;
import com.allhotplace.www.service.face.admin.ChatoneService;
import com.allhotplace.www.service.face.chatbot.ChatBotService;
import com.allhotplace.www.util.Paging;

@Controller
public class ChatoneController {

	@Autowired
	ChatoneService chatoneService;

	@Autowired
	ChatBotService chatBotService;
	@Autowired
	ChatBotDao chatBotDao;
	@Autowired
	UserDao userDao;
	@Autowired
	ChatroomDao chatroomDao;

	private static final Logger logger = LoggerFactory.getLogger(ChatoneController.class);

	@RequestMapping(value = "/admin/chatone/list", method = RequestMethod.GET)
	public void boardList(Model model, HttpServletRequest req, String curPage1, HttpSession session) {

		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		// 요청파라미터 curPage 받기
		String param = curPage1;
		int curPage = 0;

//		// 검색요청파라미터 받기
//		String param1 = word;

		// null이나 ""이 아니면 int로 리턴
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
//		if (param1 != null && !"".equals(param1)) {
//			param1 = word;
//		} else {
//			param1 = "";
//		}
		// 총 게시글 수 얻기
		int totalCount = chatoneService.selectCntChatroom();

		// 페이지 객체 생성
		Paging paging = new Paging(totalCount, curPage);
//		paging.setSearch(param1);

		List<Chatroom> chatonelist = chatoneService.getPagingList(paging);

//		model.addAttribute("search", param1);

		model.addAttribute("paging", paging);
		model.addAttribute("chatonelist", chatonelist);

		logger.info(chatonelist.toString());

	}

	@RequestMapping(value = "/resultChatList", method = RequestMethod.GET)
	public String resultChatList(HttpSession session, Model model, HttpServletRequest request, int chatroom_idx123) {

		String user_id = (String) session.getAttribute("user_id");
		logger.info("createChatRoom 유저아이디: " + user_id);

		// 세션에서 가져온 유저아이디로 유저정보 조회
		Users user = userDao.selectUserInfo(user_id);
		logger.info("조회한 유저정보: " + user.toString());

		logger.info("접속한 유저 ip: " + request.getRemoteAddr());

		// dto에 접속유저번호, 유저ip저장
		Chatroom chatroom = new Chatroom();
		System.out.println("cjatttttttttttttroom"+chatroom);
		System.out.println(user.getUser_no());
		chatroom.setUser_no(user.getUser_no());
		chatroom.setChatroom_userIp(request.getRemoteAddr());
		
		System.out.println("cjatttttttttttttroom1"+chatroom);

		// 채팅방이 존재하지 않을 때 해당 유저 전용 새로운 채팅방 생성
		if (chatroomDao.checkChatroom(user.getUser_no()) == false) {
			logger.info("채팅방 생성");
			logger.info("채팅방 boolean: " + chatroomDao.checkChatroom(user.getUser_no()));
			System.out.println("cjatttttttttttttroom2"+chatroom);
			chatroomDao.createChatroom(chatroom);
			System.out.println("cjatttttttttttttroom3"+chatroom);
			logger.info("chatroom_idx: " + chatroom.getChatroom_idx());
			System.out.println("cjatttttttttttttroom4"+chatroom);
			chatroom.setChatroom_idx(chatroom.getChatroom_idx());

			session.setAttribute("chatroom_idx", Integer.toString(chatroom.getChatroom_idx()));
			logger.info("session_chatroom_idx: " + session.getAttribute("chatroom_idx"));
			logger.info("세션채팅방확인:" + session.getAttribute("chatroom_idx"));

			logger.info("새로만들어진 만들어진 채팅방 조회" + chatroomDao.selectChatroomByUser_no(user.getUser_no()));
		} else {
			logger.info("채팅방 이미 존재");

			chatroom.setChatroom_idx(chatroomDao.selectChatroomByUser_no(user.getUser_no()).getChatroom_idx());
			logger.info("chatroom:" + chatroom);
			session.setAttribute("chatroom_idx", Integer.toString(chatroom.getChatroom_idx()));
			logger.info("이미존재 세션채팅방확인:" + session.getAttribute("chatroom_idx"));
		}
		
		String idxxx= (String)session.getAttribute("chatroom_idx");
		int chatroom_idx1 = Integer.parseInt(idxxx);
		
		List<Chattalk> chatoneList = 
				chatoneService.getChatlist(chatroom_idx123);
		logger.info(chatoneList.toString());
		
		System.out.println("리스트출력      " + chatoneList);
		model.addAttribute("user_id", session.getAttribute("user_id"));
		model.addAttribute("chatoneList", chatoneList);

		return "jsonView";
	}

	@RequestMapping(value = "/connectFunc", method = RequestMethod.GET)
	public String connectFunc(HttpSession session, Model model, String chatroom_idx, HttpServletRequest request) {
		System.out.println(chatroom_idx);
		session.setAttribute("chatroom_idx", chatroom_idx);

		return "jsonView";

	}
}
