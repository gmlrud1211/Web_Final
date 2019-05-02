package com.allhotplace.www.dao.face.mypage;

import java.util.List;

import com.allhotplace.www.dto.Users;

public interface MypageDao {

	//회원정보조회
	public Users selectUserInfo(String user_id);


}
