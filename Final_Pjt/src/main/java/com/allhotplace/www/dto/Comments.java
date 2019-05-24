package com.allhotplace.www.dto;

import java.util.Date;

public class Comments {

	private int comment_no;
	private int mapp_sType;
	private String comment_content;
	private int user_no;
	private String user_id;
	private String contentid;
	private Date comment_date;
	

	public int getMapp_sType() {
		return mapp_sType;
	}
	public void setMapp_sType(int mapp_sType) {
		this.mapp_sType = mapp_sType;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "Comments [comment_no=" + comment_no + ", mapp_sType=" + mapp_sType + ", comment_content="
				+ comment_content + ", user_no=" + user_no + ", user_id=" + user_id + ", contentid=" + contentid
				+ ", comment_date=" + comment_date + "]";
	}
}