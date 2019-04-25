package com.allhotplace.www.dto;

public class MChatbot {

	private int xChat_no;
	private int mChat_no;
	private String mChat_name;
	@Override
	public String toString() {
		return "MChatbot [xChat_no=" + xChat_no + ", mChat_no=" + mChat_no + ", mChat_name=" + mChat_name + "]";
	}
	public int getxChat_no() {
		return xChat_no;
	}
	public void setxChat_no(int xChat_no) {
		this.xChat_no = xChat_no;
	}
	public int getmChat_no() {
		return mChat_no;
	}
	public void setmChat_no(int mChat_no) {
		this.mChat_no = mChat_no;
	}
	public String getmChat_name() {
		return mChat_name;
	}
	public void setmChat_name(String mChat_name) {
		this.mChat_name = mChat_name;
	}
	
}
