package com.allhotplace.www.dto;

public class JChatbot {

	int xChat_no;
	String xChat_name;
	int mChat_no;
	String mChat_name;
	int sChat_no;
	String sChat_name;
	String sChat_answer;
	
	@Override
	public String toString() {
		return "JChatbot [xChat_no=" + xChat_no + ", xChat_name=" + xChat_name + ", mChat_no=" + mChat_no
				+ ", mChat_name=" + mChat_name + ", sChat_no=" + sChat_no + ", sChat_name=" + sChat_name
				+ ", sChat_answer=" + sChat_answer + "]";
	}

	public int getxChat_no() {
		return xChat_no;
	}

	public void setxChat_no(int xChat_no) {
		this.xChat_no = xChat_no;
	}

	public String getxChat_name() {
		return xChat_name;
	}

	public void setxChat_name(String xChat_name) {
		this.xChat_name = xChat_name;
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
