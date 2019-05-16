package com.allhotplace.www.controller.chatbot.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.allhotplace.www.dto.Users;

public class ReplyEchoHandler extends TextWebSocketHandler{

	List<WebSocketSession> sessions = new ArrayList<>();
	public Map<String, WebSocketSession> userSessions = new HashMap<>(); 
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
	};
	
	//소켓에다 메시지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage: " + session + " : " + message);
		String senderId = getId(session);
		
		//메시지를 접속된 모두에게 보낸다.
		for(WebSocketSession sess: userSessions.values()) {
			sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
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
		
		
	};
	
	
}
