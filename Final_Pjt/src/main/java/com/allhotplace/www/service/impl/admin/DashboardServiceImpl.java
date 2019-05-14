package com.allhotplace.www.service.impl.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.admin.DashboardDao;
import com.allhotplace.www.service.face.admin.DashboardService;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	DashboardDao dboardDao;

	@Override
	public int getCalendarYes() {
		return dboardDao.getCalendarYes();
	}

	@Override
	public int getCalendarNo() {
		return dboardDao.getCalendarNo();
	}

	@Override
	public int getNewUser() {
		return dboardDao.getNewUser();
	}

	
	
}
