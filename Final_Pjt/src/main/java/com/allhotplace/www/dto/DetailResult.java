package com.allhotplace.www.dto;

public class DetailResult {
	
	
//	검색결과 페이지에서 API 호출 시 값 전달을 위한 DTO

	// image
	private String originimgurl;
	private String smallimageurl;
	
	// common
	private String addr1;
	private String addr2;
	private String title;
	private String tel;
	private String telname;
	private String zipcode;
	private String homepage;
	private String overview;
	
	// intro
	private String playtime;
	private String sponsor1;
	private String eventplace;
	
	
	// info 
	private String infocenter;
	private String usetimefestival;
	private String sponsor1tel;
	private String bookingplace;
	private String placeinfo;
	private String agelimit;
	private String discountinfofestival;
	private String spendtimefestival;
	

	
	public String getOriginimgurl() {
		return originimgurl;
	}
	public void setOriginimgurl(String originimgurl) {
		this.originimgurl = originimgurl;
	}
	public String getSmallimageurl() {
		return smallimageurl;
	}
	public void setSmallimageurl(String smallimageurl) {
		this.smallimageurl = smallimageurl;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTelname() {
		return telname;
	}
	public void setTelname(String telname) {
		this.telname = telname;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getPlaytime() {
		return playtime;
	}
	public void setPlaytime(String playtime) {
		this.playtime = playtime;
	}
	public String getSponsor1() {
		return sponsor1;
	}
	public void setSponsor1(String sponsor1) {
		this.sponsor1 = sponsor1;
	}
	public String getEventplace() {
		return eventplace;
	}
	public void setEventplace(String eventplace) {
		this.eventplace = eventplace;
	}
	@Override
	public String toString() {
		return "DetailResult [originimgurl=" + originimgurl + ", smallimageurl=" + smallimageurl + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", title=" + title + ", tel=" + tel + ", telname=" + telname + ", zipcode="
				+ zipcode + ", homepage=" + homepage + ", overview=" + overview + ", playtime=" + playtime
				+ ", sponsor1=" + sponsor1 + ", eventplace=" + eventplace + "]";
	}
}
