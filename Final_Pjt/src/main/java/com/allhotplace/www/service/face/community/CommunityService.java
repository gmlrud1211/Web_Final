package com.allhotplace.www.service.face.community;

import java.util.List;
import java.util.Map;

import com.allhotplace.www.dto.Calendar;
import com.allhotplace.www.dto.Schedule;

public interface CommunityService {

	public List<Calendar> getCalendarList();

	public List<Calendar> getbestCalList();

	public List<Schedule> getSchedule(String calNo);

	public Calendar getCalendar(String calNo);

	public void viewCntadd(String calNo);

	public boolean isRecommend(Map map);

	public int recommend(Map map);

	public int recommendCancel(Map map);

}
