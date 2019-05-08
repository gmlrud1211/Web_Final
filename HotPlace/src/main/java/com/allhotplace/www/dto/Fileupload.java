package com.allhotplace.www.dto;

import java.util.Date;

public class Fileupload {

	private int file_no;
	private int mapp_sType;
	private String file_name;
	private String file_storedName;
	private Date file_date;
	
	@Override
	public String toString() {
		return "Fileupload [file_no=" + file_no + ", mapp_sType=" + mapp_sType + ", file_name=" + file_name
				+ ", file_storedName=" + file_storedName + ", file_date=" + file_date + "]";
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getMapp_sType() {
		return mapp_sType;
	}
	public void setMapp_sType(int mapp_sType) {
		this.mapp_sType = mapp_sType;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_storedName() {
		return file_storedName;
	}
	public void setFile_storedName(String file_storedName) {
		this.file_storedName = file_storedName;
	}
	public Date getFile_date() {
		return file_date;
	}
	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}
	
	
}