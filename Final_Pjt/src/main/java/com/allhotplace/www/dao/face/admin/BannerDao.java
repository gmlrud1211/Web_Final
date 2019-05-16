package com.allhotplace.www.dao.face.admin;

import java.util.List;

import com.allhotplace.www.dto.Banner;
import com.allhotplace.www.dto.Fileupload;
import com.allhotplace.www.util.Paging;


public interface BannerDao {

	// 페이징 처리 게시글 반환
	public List<Banner> selectBanerlist();
	
	// 페이징 처리 게시글 반환
	public List<Banner> selectPaginglist(Paging paging);
	// 총 배너 수 반환
	public int selectCntBanner();
	
	// 배너 조회 
	public Banner view(Banner banner); 

	// 파일등록 
	public void insertFile(Fileupload Fileupload);
	// 배너등록
	public void insertBanner(Banner bannersInsert);
	
	// 파일 업데이트
	public void updateFile(Fileupload fileupload);


	// 배너 삭제 반환
	public void deleteBanner(Banner bannerdel);


	// 배너수정
	public void modifyBanner(Banner banner);
	
	

}
