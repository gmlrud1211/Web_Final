package com.allhotplace.www.service.face.admin;

import java.util.List;
import java.util.Map;

import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.util.Paging;

public interface NoticeboardService {


	// 요청파라미터에서 curPage 반환
//	public int getCurPage(HttpServletRequest req);

	// 총 게시글 수 얻기
	public int selectCntNboard(String word);

	// 페이징 리스트 얻기
	public List<Noticeboard> getPagingList(Paging paging);
	
	// 게시글 상세보기 
	// 조회수 함께 업데이트
	public Noticeboard selectNboard(Noticeboard board);

	// 게시글 작성 
	public void writeNboard(Noticeboard board);
	
	// 게시글 수정
	public void updateNboard(Noticeboard updateBoard);
	
	// 게시글 삭제 
	public void deleteNboard(Noticeboard deleteBoard);
	
	// board정보 boardno으로 불러오기 
	public Noticeboard boardInfo(int boardno);
	


	
	
}
