package com.allhotplace.www.service.face.admin;


import java.util.List;

import com.allhotplace.www.dto.Banner;
import com.allhotplace.www.dto.Users;
import com.allhotplace.www.util.Paging;



public interface AdminUserService {

	// 총 회원 수 얻기
	public int selectCntUser();
	
	// 배너 페이징 해서 전체 조회
	public List<Users> selectPaginglist(Paging paging);
	
	// 배너 삭제
	public void deleteUser(Users user);

	// 배너 보기
	public Users selectUser(Users user);




	

}
