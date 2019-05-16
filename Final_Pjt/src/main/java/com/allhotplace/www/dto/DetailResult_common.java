package com.allhotplace.www.dto;

public class DetailResult_common {
	
	
//	상세 페이지에서 API 호출 시 값 전달을 위한 DTO (common)

	// common
	private String addr1;
	private String addr2;
	private String title;
	private String tel;
	private String telname;
	private String zipcode;
	private String homepage;
	private String overview;
	private String mapx;
	private String mapy;
	private String mlevel;

	
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
	public String getMapx() {
		return mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public String getMlevel() {
		return mlevel;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}
	@Override
	public String toString() {
		return "DetailResult_common [addr1=" + addr1 + ", addr2=" + addr2 + ", title=" + title + ", tel=" + tel
				+ ", telname=" + telname + ", zipcode=" + zipcode + ", homepage=" + homepage + ", overview=" + overview
				+ ", mapx=" + mapx + ", mapy=" + mapy + ", mlevel=" + mlevel + "]";
	}
	

}
