package com.allhotplace.www.dao.face.admin;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.util.Paging;

public interface NoticeboardDao {

	// 총 게시글 수 반환
	public int selectCntNboard(String word);

	// 페이징 처리 게시글 반환
	public List<Noticeboard> selectPaginglist(@Param("paging")Paging paging, @Param("search") String search,  @Param("word") String word);
	
	// 게시글 상세보기 
	public Noticeboard selectNboard(Noticeboard board);
	
	//게시글 조회수 증가
	public void countup(Noticeboard hit);
	
	// 게시글 작성 
	public void writeNboard(Noticeboard board);
	
	// id로 정보 가져오기
//	public Member selectByUserid(String valueOf);
	
	// 게시글 수정 
	public void updateNboard(Noticeboard updateBoard);
	
	// 게시글 삭제 
	public void deleteNboard(Noticeboard deleteBoard);
	
	// 게시글 검색
	public List<Noticeboard> search(String search);
	
}
	

