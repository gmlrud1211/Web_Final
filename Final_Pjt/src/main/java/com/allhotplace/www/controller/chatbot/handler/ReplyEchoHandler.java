package com.allhotplace.www.controller.chatbot.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.allhotplace.www.controller.chatbot.ChatController;
import com.allhotplace.www.dao.face.chatbot.ChatroomDao;
import com.allhotplace.www.dao.face.chatbot.ChattalkDao;
import com.allhotplace.www.dao.face.user.UserDao;
import com.allhotplace.www.dto.Chattalk;
import com.allhotplace.www.dto.Users;

public class ReplyEchoHandler extends TextWebSocketHandler{
	
	@Autowired UserDao userDao;
	@Autowired ChatroomDao chatroomDao;
	@Autowired ChattalkDao chattalkDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	List<WebSocketSession> sessions = new ArrayList<>();
	public Map<String, WebSocketSession> userSessions = new HashMap<>(); 
	public Map<WebSocketSession, Integer> RoomSessions = new HashMap<>();
	
	//소켓이 접속했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		 System.out.println("afterConnectionEstablished: " + session);
		 sessions.add(session); //접속되는 유저들은 모두 sessions array에 들어간다.
		 
		 String senderId = getId(session);
		 System.out.println("senderId: "+senderId);
		 
		 userSessions.put(senderId, session);
		 
		 System.out.println("1..."+senderId);
		 System.out.println("2..."+session);
		
		 System.out.println("[TEST]sessions:"+sessions);
		 System.out.println("[TEST]userSessions:"+userSessions);
		 System.out.println("[TEST]userSessions.values():"+userSessions.values());
		 
//		chatroom.setChatroom_userIp(session.getRemoteAddress().getHostName());
		Map<String, Object> httpSession = session.getAttributes();
		int roomNo = Integer.parseInt((String)httpSession.get("chatroom_idx"));
		System.out.println("[TEST]roomno:"+roomNo);
		
		RoomSessions.put(session, roomNo);
		System.out.println("[TEST]RoomSessions:"+RoomSessions);
	};
	
	//소켓에다 메시지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage: " + session + " : " + message);
		
		//현재 세션의 id얻기
		String senderId = getId(session);
		//현재 세션의 방번호 얻기
		int roomNo = RoomSessions.get(session);
		
		//메세지 DB에 저장
		Users user = userDao.selectUserInfo(senderId);
		logger.info("메시지 저장용 유저정보: "+user.toString());
		
		Chattalk chattalk = new Chattalk();
		
		//user_no가 1이 아닐 때(유저일 때)
		if(user.getUser_no()!=1) {
			
			chattalk.setSender_no(user.getUser_no());
			chattalk.setChatroom_idx(roomNo);
			chattalk.setReceiver_no(1);
			chattalk.setChat_content(message.getPayload());
			chattalkDao.insertChatting(chattalk);
		} else {//user_no가 1일 때(관리자일 때)

			chattalk.setSender_no(user.getUser_no());
			chattalk.setChatroom_idx(roomNo);
			chattalk.setReceiver_no(1);
			chattalk.setChat_content(message.getPayload());
			chattalkDao.insertChatting(chattalk);
		}
		
		//메시지를 접속된 모두에게 보낸다.
		for(WebSocketSession sess: userSessions.values()) {
			
			if(roomNo==RoomSessions.get(sess)) {
				sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
			}
		}
	};
	
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		System.out.println("httpSession: "+httpSession);
		System.out.println("httpSession.get(\"user_id\"): "+httpSession.get("user_id"));
//		Users loginUser = (Users)httpSession.get("LoginInfo");
		String loginUser = (String)httpSession.get("user_id");
//		System.out.println("loginUser: "+loginUser);
		System.out.println("loginUser: "+loginUser);
		
		
		if(null == loginUser)
			return session.getId();
		else
			return loginUser;
		
	}
	
	//소켓이 닫혔을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionEstablished: " + session + " : " + status);
		System.out.println(session.getId() + " 연결 종료됨");
		sessions.remove(session);
		System.out.println("[TEST]sessions에서 session정보 지웠는지 확인:"+sessions);
		userSessions.remove(getId(session));
		System.out.println("[TEST]userSessions에서 session정보 지웠는지 확인:"+userSessions);
		RoomSessions.remove(session);
		System.out.println("[TEST]RoomSessions에서 session정보 지웠는지 확인:"+RoomSessions);
		
		
	};
	
	
}
