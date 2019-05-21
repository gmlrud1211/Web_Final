package com.allhotplace.www.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.admin.ChatoneDao;
import com.allhotplace.www.dto.Chatroom;
import com.allhotplace.www.service.face.admin.ChatoneService;
import com.allhotplace.www.util.Paging;

@Service
public class ChatoneServiceImpl implements ChatoneService {

	@Autowired
	ChatoneDao chatoneDao;

	// 총 게시글 수 얻기
	@Override
	public int selectCntChatroom() {
		return chatoneDao.selectCntChatroom();
	}

	// 게시글 페이징 리스트 처리 반환
	@Override
	public List<Chatroom> getPagingList(Paging paging) {
		return chatoneDao.getPaginglist(paging);
	}


}
