package com.allhotplace.www.service.impl.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.community.CommunityDao;
import com.allhotplace.www.dto.Calendar;
import com.allhotplace.www.dto.Comments;
import com.allhotplace.www.dto.Schedule;
import com.allhotplace.www.service.face.community.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired CommunityDao communitydao;
	
	@Override
	public List<Calendar> getCalendarList() {
		return communitydao.getCalendarList();
	}

	@Override
	public List<Calendar> getbestCalList() {
		return communitydao.getbestCalList();
	}

	@Override
	public List<Schedule> getSchedule(String calNo) {
		return communitydao.getSchedule(calNo);
	}

	@Override
	public Calendar getCalendar(String calNo) {
		return communitydao.getCalendar(calNo);
	}

	@Override
	public void viewCntadd(String calNo) {
		communitydao.viewCntadd(calNo);
	}

	@Override
	public boolean isRecommend(Map map) {
		int count = communitydao.isRecommend(map);
		System.out.println(count);
		if (count>0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int recommend(Map map) {
		communitydao.recommend(map);
		communitydao.calRecommend(map);
		return communitydao.getRecommend(map);
	}

	@Override
	public int recommendCancel(Map map) {
		communitydao.recommendCancel(map);
		communitydao.calRecommendCencel(map);
		return communitydao.getRecommend(map);
	}

	@Override
	public void commentSubmit(Map map) {
		communitydao.commentSubmit(map);
	}

	@Override
	public List<Comments> getComment(String calNo) {
		return communitydao.getComment(calNo);
	}

	@Override
	public void commentDelete(String comment_no) {
		communitydao.commentDelete(comment_no);
	}
}
