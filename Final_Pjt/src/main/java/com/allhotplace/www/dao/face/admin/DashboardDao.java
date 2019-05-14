package com.allhotplace.www.dao.face.admin;

import java.util.List;

import com.allhotplace.www.dto.Banner;
import com.allhotplace.www.dto.Fileupload;
import com.allhotplace.www.util.Paging;


public interface DashboardDao {

	// 총 방문자수를 증가
	public void setTotalCount();
	
	// 총 방문자수 카운트
	public int getTotalCount();

	// 오늘 방문자수 카운트
	public int getTodayCount();
	
	//--------------------------------------------------
	
	// 일정 카운트 공개
	public int getCalendarYes();
	
	// 일정 카운트 비공개
	public int getCalendarNo();
	
    // 일주일동안 가입자 수 
    public int getNewUser();
	
}
