package com.allhotplace.www.service.impl.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.allhotplace.www.dao.face.user.UserDao;
import com.allhotplace.www.service.face.user.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired UserDao userDao;

	@Override
	public int login(Model model) {
		return userDao.login(model);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	
	
	
	

}
