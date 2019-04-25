package com.allhotplace.www.dao.face.user;

import org.springframework.ui.Model;

import com.allhotplace.www.dto.Users;

public interface UserDao {

	//로그인(id,pw조회)
	public int login(Model model);

	//회원가입
	public void insertUser(Users user);

}
