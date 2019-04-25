package com.allhotplace.www.dto;

import java.util.Date;

public class Chattalk {
	private int chatroom_idx;
	private int receiver_no;
	private int sender_no;
	private String chat_content;
	private Date chat_date;
	
	@Override
	public String toString() {
		return "Chattalk [chatroom_idx=" + chatroom_idx + ", receiver_no=" + receiver_no + ", sender_no=" + sender_no
				+ ", chat_content=" + chat_content + ", chat_date=" + chat_date + "]";
	}
	public int getChatroom_idx() {
		return chatroom_idx;
	}
	public void setChatroom_idx(int chatroom_idx) {
		this.chatroom_idx = chatroom_idx;
	}
	public int getReceiver_no() {
		return receiver_no;
	}
	public void setReceiver_no(int receiver_no) {
		this.receiver_no = receiver_no;
	}
	public int getSender_no() {
		return sender_no;
	}
	public void setSender_no(int sender_no) {
		this.sender_no = sender_no;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public Date getChat_date() {
		return chat_date;
	}
	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}
	
	

}
