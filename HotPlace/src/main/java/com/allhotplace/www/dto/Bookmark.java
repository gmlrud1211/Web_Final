package com.allhotplace.www.dto;

import java.util.Date;

public class Bookmark {

	private int bookmark_no;
	private int schedule_id;
	private int user_no;
	private Date bookmark_date;
	
	public int getBookmark_no() {
		return bookmark_no;
	}
	public void setBookmark_no(int bookmark_no) {
		this.bookmark_no = bookmark_no;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getBookmark_date() {
		return bookmark_date;
	}
	public void setBookmark_date(Date bookmark_date) {
		this.bookmark_date = bookmark_date;
	}
	@Override
	public String toString() {
		return "Bookmark [bookmark_no=" + bookmark_no + ", schedule_id=" + schedule_id + ", user_no=" + user_no
				+ ", bookmark_date=" + bookmark_date + "]";
	}
	
	
	
}