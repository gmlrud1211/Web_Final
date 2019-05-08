package com.allhotplace.www.dto;

public class XChatbot {

	private int xChat_no;
	private String xChat_name;
	
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
	@Override
	public String toString() {
		return "XChatbot [xChat_no=" + xChat_no + ", xChat_name=" + xChat_name + "]";
	}
	
	
}