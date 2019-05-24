package com.allhotplace.www.service.impl.detail;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.detail.DetailDao;
import com.allhotplace.www.dto.Calendar;
import com.allhotplace.www.dto.Comments;
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


	@Override
	public void addBookmark(Map map) {
		detailDao.addBookmark(map);	
	}

	@Override
	public int isBookmark(Map map) {
		return detailDao.isBookmark(map);
	}


	@Override
	public void deleteBookmark(Map map) {
		detailDao.deleteBookmark(map);	
	}


	@Override
	public List<Comments> getComment(String contentId) {
		return detailDao.getComment(contentId);
	}


	@Override
	public void commentSubmit(Map map) {
		detailDao.commentSubmit(map);
	}


	@Override
	public void addSchedule(Map map) {
		detailDao.addSchedule(map);
	}


	@Override
	public void commentDelete(String comment_no) {
		detailDao.commentDelete(comment_no);
	}
}
