package com.allhotplace.www.dao.face.admin;

import java.util.List;

import com.allhotplace.www.dto.Banner;
import com.allhotplace.www.dto.Fileupload;
import com.allhotplace.www.dto.Users;
import com.allhotplace.www.util.Paging;


public interface AdminUserDao {

	// 회원 페이징 처리 게시글 반환
	public List<Users> selectPaginglist(Paging paging);
	// 총 회원 수 반환
	public int selectCntUser();
	
	// 회원 조회 
	public Users selectUser(Users user); 

	// 회원 삭제 
	public void deleteUser(Users user);


}
