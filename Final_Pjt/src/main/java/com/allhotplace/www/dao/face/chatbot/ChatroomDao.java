package com.allhotplace.www.dao.face.chatbot;

import com.allhotplace.www.dto.Chatroom;

public interface ChatroomDao {

	//해당 유저 아이디 넘버로 생성된 채팅방이 있는지 조회
	public boolean checkChatroom(int user_no);
	
	//채팅방 생성
	public void createChatroom(Chatroom chatroom);
	
	//접속한 유저의 user_no로 조회
	public Chatroom selectChatroomByUser_no(int user_no);
}
