package com.allhotplace.www.dto;

import java.util.Date;

public class Recommand {

	private int rec_no;
	private int calendar_no;
	private int user_no;
	private Date rec_date;
	
	public int getRec_no() {
		return rec_no;
	}
	public void setRec_no(int rec_no) {
		this.rec_no = rec_no;
	}
	public int getCalendar_no() {
		return calendar_no;
	}
	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getRec_date() {
		return rec_date;
	}
	public void setRec_date(Date rec_date) {
		this.rec_date = rec_date;
	}
	@Override
	public String toString() {
		return "Recommand [rec_no=" + rec_no + ", calendar_no=" + calendar_no + ", user_no=" + user_no + ", rec_date="
				+ rec_date + "]";
	}
	
	
}
