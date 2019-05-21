package com.allhotplace.www.service.face.admin;

import java.util.List;

import com.allhotplace.www.dto.Chatroom;
import com.allhotplace.www.util.Paging;

public interface ChatoneService {

	// 총 게시글 수 얻기
	public int selectCntChatroom();

	// 페이징 리스트 얻기
	public List<Chatroom> getPagingList(Paging paging);
	
	
//	// 게시글 삭제 
//	public void deleteNboard(Noticeboard deleteBoard);
//	
//	// board정보 boardno으로 불러오기 
//	public Noticeboard boardInfo(int boardno);
	


	
	
}
