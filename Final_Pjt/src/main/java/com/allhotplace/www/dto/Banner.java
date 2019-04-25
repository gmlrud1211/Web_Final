package com.allhotplace.www.dto;

import java.util.Date;

public class Banner {
	private int banner_no;
	private String banner_name;
	private int file_no;
	private Date banner_date;
	
	public int getBanner_no() {
		return banner_no;
	}
	public void setBanner_no(int banner_no) {
		this.banner_no = banner_no;
	}
	public String getBanner_name() {
		return banner_name;
	}
	public void setBanner_name(String banner_name) {
		this.banner_name = banner_name;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public Date getBanner_date() {
		return banner_date;
	}
	public void setBanner_date(Date banner_date) {
		this.banner_date = banner_date;
	}
	@Override
	public String toString() {
		return "Banner [banner_no=" + banner_no + ", banner_name=" + banner_name + ", file_no=" + file_no
				+ ", banner_date=" + banner_date + "]";
	}
}
