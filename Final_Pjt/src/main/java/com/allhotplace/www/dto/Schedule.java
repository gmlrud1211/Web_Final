package com.allhotplace.www.dto;

import java.util.Date;

public class Schedule {

	private int calendar_no;
	private int schedule_no;
	private int schedule_id;
	private String schedule_title;
	private String schedule_startTime;
	private String schedule_endTime;
	private String calendar_title;
	private String calendar_yesno;
	private Date calendar_date;
	
	
	@Override
	public String toString() {
		return "Schedule [calendar_no=" + calendar_no + ", schedule_no=" + schedule_no + ", schedule_id=" + schedule_id
				+ ", schedule_title=" + schedule_title + ", schedule_startTime=" + schedule_startTime
				+ ", schedule_endTime=" + schedule_endTime + ", calendar_title=" + calendar_title + ", calendar_yesno="
				+ calendar_yesno + ", calendar_date=" + calendar_date + "]";
	}
	public String getCalendar_title() {
		return calendar_title;
	}
	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}
	public String getCalendar_yesno() {
		return calendar_yesno;
	}
	public void setCalendar_yesno(String calendar_yesno) {
		this.calendar_yesno = calendar_yesno;
	}
	public Date getCalendar_date() {
		return calendar_date;
	}
	public void setCalendar_date(Date calendar_date) {
		this.calendar_date = calendar_date;
	}
	public int getCalendar_no() {
		return calendar_no;
	}
	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getSchedule_title() {
		return schedule_title;
	}
	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}
	public String getSchedule_startTime() {
		return schedule_startTime;
	}
	public void setSchedule_startTime(String schedule_startTime) {
		this.schedule_startTime = schedule_startTime;
	}
	public String getSchedule_endTime() {
		return schedule_endTime;
	}
	public void setSchedule_endTime(String schedule_endTime) {
		this.schedule_endTime = schedule_endTime;
	}

	
	
}