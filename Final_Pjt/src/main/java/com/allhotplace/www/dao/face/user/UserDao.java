package com.allhotplace.www.dao.face.user;

import org.springframework.ui.Model;

public interface UserDao {

	//로그인(id,pw조회)
	public int login(Model model);

}
