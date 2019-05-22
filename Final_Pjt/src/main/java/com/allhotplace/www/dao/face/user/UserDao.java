package com.allhotplace.www.dao.face.user;


import java.util.HashMap;

import com.allhotplace.www.dto.Users;

public interface UserDao {

	//로그인(id,pw조회)
	public int login(HashMap map);

	//회원가입
	public void insertUser(Users user);

	//유저정보조회
	public Users selectUserInfo(String user_id);

}
