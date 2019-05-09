package com.allhotplace.www.dao.face.admin;

import com.allhotplace.www.dto.Visitors;

public interface VisitorsDao {

	
	
	// 방문자 DB입력
	public void setVisitTotalCount();
//	public void setVisitTotalCount(Visitors visit);

	// 오늘 방문자수 반환
	public int getVisitTodayCount();

	// 총 방문자수 반환
	public int getVisitTotalCount();

}
