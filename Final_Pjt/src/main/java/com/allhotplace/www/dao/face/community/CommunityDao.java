package com.allhotplace.www.dao.face.community;

import java.util.List;
import java.util.Map;

import com.allhotplace.www.dto.Calendar;
import com.allhotplace.www.dto.Comments;
import com.allhotplace.www.dto.Schedule;

public interface CommunityDao {

	List<Calendar> getCalendarList();

	List<Calendar> getbestCalList();

	List<Schedule> getSchedule(String calNo);

	Calendar getCalendar(String calNo);

	void viewCntadd(String calNo);

	int isRecommend(Map map);

	int recommend(Map map);

	int getRecommend(Map map);

	int getCalRecommend(Map map);

	void calRecommend(Map map);

	void recommendCancel(Map map);

	void calRecommendCencel(Map map);

	void commentSubmit(Map map);

	List<Comments> getComment(String calNo);

	void commentDelete(String comment_no);

}
