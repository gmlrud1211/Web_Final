package com.allhotplace.www.service.impl.user;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.user.UserDao;
import com.allhotplace.www.dto.Users;
import com.allhotplace.www.service.face.user.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired UserDao userDao;

	@Override
	public int login(String user_id, String user_pw) {
		
		HashMap map = new HashMap();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		
		return userDao.login(map);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void join(Users user) {
		userDao.insertUser(user);
	}
	

}
