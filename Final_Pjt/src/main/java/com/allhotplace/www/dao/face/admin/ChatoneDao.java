package com.allhotplace.www.dao.face.admin;



import java.util.List;

import com.allhotplace.www.dto.Chatroom;
import com.allhotplace.www.util.Paging;

public interface ChatoneDao {

	// 총 게시글 수 반환
	public int selectCntChatroom();

	// 페이징 처리 게시글 반환
	public List<Chatroom> getPaginglist(Paging paging);
	
	
}
	

