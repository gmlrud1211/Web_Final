package com.allhotplace.www.service.face.admin;

import java.util.List;

import com.allhotplace.www.dto.Chatroom;
import com.allhotplace.www.dto.Chattalk;
import com.allhotplace.www.util.Paging;

public interface ChatoneService {

	// 총 게시글 수 얻기
	public int selectCntChatroom();

	// 페이징 리스트 얻기
	public List<Chatroom> getPagingList(Paging paging);
	
	// 1대1 채팅리스트 불러오기
		public List<Chattalk> getChatlist(int chatroom_idx);



	
	
}
