package com.allhotplace.www.service.impl.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.admin.NoticeboardDao;
import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.service.face.admin.NoticeboardService;
import com.allhotplace.www.util.Paging;

@Service
public class NoticeboardServiceImpl implements NoticeboardService {

	@Autowired
	NoticeboardDao boardDao;

	// 작은 것중 제일 큰 값
	public Noticeboard getMinNo(int boardno) {
		return boardDao.getMinNo(boardno);
	}

	// 큰 것중 제일 작은 값
	public Noticeboard getMaxNo(int boardno) {
		return boardDao.getMaxNo(boardno);
	}
	
	// 총 게시글 수 얻기
	@Override
	public int selectCntNboard(String word) {
		return boardDao.selectCntNboard(word);
	}

	// 게시글 페이징 리스트 처리 반환
	@Override
	public List<Noticeboard> getPagingList(Paging paging, String search, String word) {
		return boardDao.selectPaginglist(paging,search,word);
	}

	@Override
	public Noticeboard selectNboard(Noticeboard board) {
		// 게시글 조회수 증가
		boardDao.countup(board);
		return boardDao.selectNboard(board);
	}

	@Override
	public void writeNboard(Noticeboard board) {
		boardDao.writeNboard(board);

	}

	@Override
	public void updateNboard(Noticeboard updateBoard) {
		boardDao.updateNboard(updateBoard);
	}

	@Override
	public void deleteNboard(Noticeboard deleteBoard) {
		boardDao.deleteNboard(deleteBoard);
		
	}

	@Override
	public Noticeboard boardInfo(int boardno) {
		return null;
	}

}
