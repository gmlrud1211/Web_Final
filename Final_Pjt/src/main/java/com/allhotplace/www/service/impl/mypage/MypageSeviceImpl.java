package com.allhotplace.www.service.impl.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.mypage.MypageDao;
import com.allhotplace.www.dto.Users;
import com.allhotplace.www.service.face.mypage.MypageService;

@Service
public class MypageSeviceImpl implements MypageService{

	@Autowired MypageDao mypageDao;

	@Override
	public Users viewUserInfo(String user_id) {
		return mypageDao.selectUserInfo(user_id);
	}

	@Override
	public void updateInfo(Users user) {
		mypageDao.updateUser(user);
	}

}
