package com.allhotplace.www.service.face.admin;


import java.util.List;


import com.allhotplace.www.dto.Banner;
import com.allhotplace.www.util.Paging;



public interface BannerService {

	// 배너리스트  반환
	public List<Banner> selectBanerlist();
	
	// 총 게시글 수 얻기
	public int selectCntBanner();
	
	// 배너 페이징 해서 전체 조회
	public List<Banner> selectPaginglist(Paging paging);
	
	// 배너등록
	public void insertBanner(Banner bannersInsert);
	
	// 배너 삭제
	public void deleteBanner(Banner banner);

	// 배너 보기
	public Banner view(Banner bannerview);

	// 첨부파일이 있을경우 파일 업데이트
	public void updateFile(Banner fileupload);

	// 배너수정
	public void modifyBanner(Banner banner);

	

}
