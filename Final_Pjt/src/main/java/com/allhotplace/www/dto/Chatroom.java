package com.allhotplace.www.dto;

import java.util.Date;

public class Chatroom {

	private int chatroom_idx;
	private int user_no;
	private String user_name;
	

	private String chatroom_userIp;
	private Date chatroom_date;
	private String chatroom_flag;

	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public int getChatroom_idx() {
		return chatroom_idx;
	}
	public void setChatroom_idx(int chatroom_idx) {
		this.chatroom_idx = chatroom_idx;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public Date getChatroom_date() {
		return chatroom_date;
	}
	public void setChatroom_date(Date chatroom_date) {
		this.chatroom_date = chatroom_date;
	}
	public String getChatroom_flag() {
		return chatroom_flag;
	}
	public void setChatroom_flag(String chatroom_flag) {
		this.chatroom_flag = chatroom_flag;
	}
	public String getChatroom_userIp() {
		return chatroom_userIp;
	}
	public void setChatroom_userIp(String chatroom_userIp) {
		this.chatroom_userIp = chatroom_userIp;
	}
	
	@Override
	public String toString() {
		return "Chatroom [chatroom_idx=" + chatroom_idx + ", user_no=" + user_no + ", user_name=" + user_name
				+ ", chatroom_userIp=" + chatroom_userIp + ", chatroom_date=" + chatroom_date + ", chatroom_flag="
				+ chatroom_flag + "]";
	}

	
}