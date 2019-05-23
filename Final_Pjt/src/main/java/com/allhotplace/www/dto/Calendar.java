package com.allhotplace.www.dto;

import java.sql.Date;

public class Calendar {

	private int calendar_no;
	private String calendar_title;
	private Date calendar_scheduleDate;
	private Date calendar_date;
	private int user_no;
	private String user_id;
	private String calendar_yesno;
	private int up_count;
	private int view_count;
	
	public int getCalendar_no() {
		return calendar_no;
	}
	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}
	public String getCalendar_title() {
		return calendar_title;
	}
	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}
	public Date getCalendar_scheduleDate() {
		return calendar_scheduleDate;
	}
	public void setCalendar_scheduleDate(Date calendar_scheduleDate) {
		this.calendar_scheduleDate = calendar_scheduleDate;
	}
	public Date getCalendar_date() {
		return calendar_date;
	}
	public void setCalendar_date(Date calendar_date) {
		this.calendar_date = calendar_date;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getCalendar_yesno() {
		return calendar_yesno;
	}
	public void setCalendar_yesno(String calendar_yesno) {
		this.calendar_yesno = calendar_yesno;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getUp_count() {
		return up_count;
	}
	public int getView_count() {
		return view_count;
	}
	public void setUp_count(int up_count) {
		this.up_count = up_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	@Override
	public String toString() {
		return "Calendar [calendar_no=" + calendar_no + ", calendar_title=" + calendar_title
				+ ", calendar_scheduleDate=" + calendar_scheduleDate + ", calendar_date=" + calendar_date + ", user_no="
				+ user_no + ", user_id=" + user_id + ", calendar_yesno=" + calendar_yesno + ", up_count=" + up_count
				+ ", view_count=" + view_count + "]";
	}

	
	
}