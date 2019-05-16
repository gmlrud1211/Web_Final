package com.allhotplace.www.dto;

import java.sql.Date;

public class Calendar {

	private int calendar_no;
	private String calendar_title;
	private Date calendar_scheduleDate;
	private Date calendar_date;
	private int user_no;
	private String calendar_yesno;
	
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
	@Override
	public String toString() {
		return "Calendar [calendar_no=" + calendar_no + ", calendar_title=" + calendar_title
				+ ", calendar_scheduleDate=" + calendar_scheduleDate + ", calendar_date=" + calendar_date + ", user_no="
				+ user_no + ", calendar_yesno=" + calendar_yesno + "]";
	}

	
	
}