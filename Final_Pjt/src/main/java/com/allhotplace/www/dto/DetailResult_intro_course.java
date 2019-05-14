package com.allhotplace.www.dto;

public class DetailResult_intro_course {
	
	
//	검색결과 페이지에서 API 호출 시 값 전달을 위한 DTO

	private String distance;
	private String infocentertourcourse;
	private String schedule;
	private String taketime;
	private String theme;
	private String accomcountleports;
	public String getDistance() {
		return distance;
	}
	public String getInfocentertourcourse() {
		return infocentertourcourse;
	}
	public String getSchedule() {
		return schedule;
	}
	public String getTaketime() {
		return taketime;
	}
	public String getTheme() {
		return theme;
	}
	public String getAccomcountleports() {
		return accomcountleports;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public void setInfocentertourcourse(String infocentertourcourse) {
		this.infocentertourcourse = infocentertourcourse;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public void setTaketime(String taketime) {
		this.taketime = taketime;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public void setAccomcountleports(String accomcountleports) {
		this.accomcountleports = accomcountleports;
	}
	@Override
	public String toString() {
		return "DetailResult_intro_course [distance=" + distance + ", infocentertourcourse=" + infocentertourcourse
				+ ", schedule=" + schedule + ", taketime=" + taketime + ", theme=" + theme + ", accomcountleports="
				+ accomcountleports + "]";
	}   

}
