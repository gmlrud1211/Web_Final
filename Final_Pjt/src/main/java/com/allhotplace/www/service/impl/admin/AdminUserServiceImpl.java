package com.allhotplace.www.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.admin.AdminUserDao;
import com.allhotplace.www.dto.Users;
import com.allhotplace.www.service.face.admin.AdminUserService;
import com.allhotplace.www.util.Paging;

@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired AdminUserDao aduserDao;

	@Override
	public int selectCntUser(String word) {
		return aduserDao.selectCntUser(word);
	}

	@Override
	public List<Users> selectPaginglist(Paging paging, String search, String word) {
		return aduserDao.selectPaginglist(paging, search, word);
	}

	@Override
	public void deleteUser(Users user) {
		aduserDao.deleteUser(user);
		
	}

	@Override
	public Users selectUser(Users user) {
		return aduserDao.selectUser(user);
	}


	

	
}

















