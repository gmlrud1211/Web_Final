package com.allhotplace.www.dto;

import java.util.Date;

public class Noticeboard {

	private int notice_no;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_count;
	
	private String min_title;
	private int min_no;
	
	private String max_title;
	private int max_no;
	
	
	@Override
	public String toString() {
		return "Noticeboard [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + ", notice_count=" + notice_count + ", min_title="
				+ min_title + ", min_no=" + min_no + ", max_title=" + max_title + ", max_no=" + max_no + "]";
	}
	
	public String getMin_title() {
		return min_title;
	}
	public void setMin_title(String min_title) {
		this.min_title = min_title;
	}
	public int getMin_no() {
		return min_no;
	}
	public void setMin_no(int min_no) {
		this.min_no = min_no;
	}
	public String getMax_title() {
		return max_title;
	}
	public void setMax_title(String max_title) {
		this.max_title = max_title;
	}
	public int getMax_no() {
		return max_no;
	}
	public void setMax_no(int max_no) {
		this.max_no = max_no;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}
	
	
}