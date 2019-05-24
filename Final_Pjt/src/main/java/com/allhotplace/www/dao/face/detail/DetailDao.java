package com.allhotplace.www.dao.face.detail;

import java.util.List;
import java.util.Map;

import com.allhotplace.www.dto.Comments;
import com.allhotplace.www.dto.DetailCalendar;

public interface DetailDao {

	public List<DetailCalendar> getCalendar(String user_id);

	//public void addBookmark(String contentid,  String contenttypeid, String userid, String image);

	public void addBookmark(Map map);

	public int isBookmark(Map map);

	public void deleteBookmark(Map map);

	public List<Comments> getComment(String contentId);

	public void commentSubmit(Map map);

	public void addSchedule(Map map);

	public void commentDelete(String comment_no);

}
