package com.allhotplace.www.service.face.mypage;


import com.allhotplace.www.dto.Users;

public interface MypageService {

	//로그인 한 회원정보 조회
	public Users viewUserInfo(String user_id);

	//회원정보 업뎃
	public void updateInfo(Users user);
}
