package com.allhotplace.www.service.impl.detail;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.detail.DetailDao;
import com.allhotplace.www.dto.Calendar;
import com.allhotplace.www.dto.DetailCalendar;
import com.allhotplace.www.service.face.detail.DetailService;

@Service
public class DetailServiceImpl implements DetailService {
	
	@Autowired DetailDao detailDao;

	@Override
	public List<DetailCalendar> getCalendar(String user_id) {
		List<DetailCalendar> calList = new ArrayList<DetailCalendar>();
		calList	= detailDao.getCalendar(user_id);
		return calList;
	}

}
