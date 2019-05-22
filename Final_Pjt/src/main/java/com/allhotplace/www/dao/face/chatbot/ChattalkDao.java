package com.allhotplace.www.dao.face.chatbot;

import java.util.List;

import com.allhotplace.www.dto.Chattalk;

public interface ChattalkDao {

	//채팅 insert
	public void insertChatting(Chattalk chattalk);

  //채팅방 index로 채팅리스트 불러오기
	public List<Chattalk> selectChatListByChatroomIdx(int chatroom_idx);
}
