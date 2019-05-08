package com.allhotplace.www.dto;

import java.util.Date;

public class Schedule {

	private int calendar_no;
	private int schedule_no;
	private int schedule_id;
	private String schedule_title;
	private Date schedule_startTime;
	private Date schedule_endTime;
	@Override
	public String toString() {
		return "Schedule [calendar_no=" + calendar_no + ", schedule_no=" + schedule_no + ", schedule_id=" + schedule_id
				+ ", schedule_title=" + schedule_title + ", schedule_startTime=" + schedule_startTime
				+ ", schedule_endTime=" + schedule_endTime + "]";
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
	public Date getSchedule_startTime() {
		return schedule_startTime;
	}
	public void setSchedule_startTime(Date schedule_startTime) {
		this.schedule_startTime = schedule_startTime;
	}
	public Date getSchedule_endTime() {
		return schedule_endTime;
	}
	public void setSchedule_endTime(Date schedule_endTime) {
		this.schedule_endTime = schedule_endTime;
	}
	
	
	
}