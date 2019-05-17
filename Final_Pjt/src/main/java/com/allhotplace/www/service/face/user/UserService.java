package com.allhotplace.www.service.face.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.allhotplace.www.dto.Users;

public interface UserService {

	//로그인처리
	public int login(String user_id, String user_pw);

	//로그아웃
	public void logout(HttpSession session);

	//회원가입
	public void join(Users user);

}
