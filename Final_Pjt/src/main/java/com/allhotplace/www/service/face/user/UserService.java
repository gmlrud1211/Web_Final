package com.allhotplace.www.service.face.user;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface UserService {

	//로그인처리
	public int login(Model model);

	//로그아웃
	public void logout(HttpSession session);

}
