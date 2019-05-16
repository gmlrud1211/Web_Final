package com.allhotplace.www.service.impl.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.main.MainDao;
import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.service.face.main.MainService;
import com.allhotplace.www.util.Paging;

@Service
public class MainServiceImpl implements MainService{

	@Autowired MainDao maindao;
	
	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Noticeboard> selectAll(Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List mainsearch() {
		List mainsearch = maindao.totalsearch();
		return mainsearch;
	}

}
