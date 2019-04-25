package com.allhotplace.www.dto;

public class SChatbot {

	private int xChat_no;
	private int mChat_no;
	private int sChat_no;
	private String sChat_name;
	private String sChat_answer;
	@Override
	public String toString() {
		return "SChatbot [xChat_no=" + xChat_no + ", mChat_no=" + mChat_no + ", sChat_no=" + sChat_no + ", sChat_name="
				+ sChat_name + ", sChat_answer=" + sChat_answer + "]";
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
	public int getsChat_no() {
		return sChat_no;
	}
	public void setsChat_no(int sChat_no) {
		this.sChat_no = sChat_no;
	}
	public String getsChat_name() {
		return sChat_name;
	}
	public void setsChat_name(String sChat_name) {
		this.sChat_name = sChat_name;
	}
	public String getsChat_answer() {
		return sChat_answer;
	}
	public void setsChat_answer(String sChat_answer) {
		this.sChat_answer = sChat_answer;
	}
	
	
}
