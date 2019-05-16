package com.allhotplace.www.service.face.admin;

import java.util.List;
import java.util.Map;

import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.util.Paging;

public interface DashboardService {


	// 일정 카운트 공개
	public int getCalendarYes();
	
	// 일정 카운트 비공개
	public int getCalendarNo();
	
    // 일주일동안 가입자 수 
    public int getNewUser();

	
	
}
