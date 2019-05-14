package com.allhotplace.www.dto;

public class SerarchResult_common {
	
	
//	검색결과 페이지에서 API 호출 시 값 전달을 위한 DTO

	private String contentid;
	private String title;
	private String firstimage;
	private String firstimage1;
	private String firstimage2;
	private String addr1;
	private String addr2;
	private int totalCnt;
	private int contenttypeid;
	
	@Override
	public String toString() {
		return "SerarchResult_common [contentid=" + contentid + ", title=" + title + ", firstimage=" + firstimage
				+ ", firstimage1=" + firstimage1 + ", firstimage2=" + firstimage2 + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", totalCnt=" + totalCnt + ", contenttypeid=" + contenttypeid + "]";
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getFirstimage1() {
		return firstimage1;
	}
	public void setFirstimage1(String firstimage1) {
		this.firstimage1 = firstimage1;
	}
	public String getFirstimage2() {
		return firstimage2;
	}
	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(int contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	
	
	
}
