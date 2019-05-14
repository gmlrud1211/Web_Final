package com.allhotplace.www.dto;

public class DetailResult_intro_tour {
	
	
//	검색결과 페이지에서 API 호출 시 값 전달을 위한 DTO

	//	Detailintro
	//	contentTypeId=12(관광지)

	// intro
	private String accomcount;
	private String chkbabycarriage;
	private String chkcreditcard;
	private String chkpet;
	private String expagerange;
	private String expguide;
	private String heritage1;
	private String heritage2;
	private String heritage3;
	private String infocenter;
	private String opendate;
	private String parking;
	private String restdate;
	private String useseason;
	private String usetime;
	
	@Override
	public String toString() {
		return "DetailResult_intro_tour [accomcount=" + accomcount + ", chkbabycarriage=" + chkbabycarriage
				+ ", chkcreditcard=" + chkcreditcard + ", chkpet=" + chkpet + ", expagerange=" + expagerange
				+ ", expguide=" + expguide + ", heritage1=" + heritage1 + ", heritage2=" + heritage2 + ", heritage3="
				+ heritage3 + ", infocenter=" + infocenter + ", opendate=" + opendate + ", parking=" + parking
				+ ", restdate=" + restdate + ", useseason=" + useseason + ", usetime=" + usetime + "]";
	}

	public String getAccomcount() {
		return accomcount;
	}

	public String getChkbabycarriage() {
		return chkbabycarriage;
	}

	public String getChkcreditcard() {
		return chkcreditcard;
	}

	public String getChkpet() {
		return chkpet;
	}

	public String getExpagerange() {
		return expagerange;
	}

	public String getExpguide() {
		return expguide;
	}

	public String getHeritage1() {
		return heritage1;
	}

	public String getHeritage2() {
		return heritage2;
	}

	public String getHeritage3() {
		return heritage3;
	}

	public String getInfocenter() {
		return infocenter;
	}

	public String getOpendate() {
		return opendate;
	}

	public String getParking() {
		return parking;
	}

	public String getRestdate() {
		return restdate;
	}

	public String getUseseason() {
		return useseason;
	}

	public String getUsetime() {
		return usetime;
	}

	public void setAccomcount(String accomcount) {
		this.accomcount = accomcount;
	}

	public void setChkbabycarriage(String chkbabycarriage) {
		this.chkbabycarriage = chkbabycarriage;
	}

	public void setChkcreditcard(String chkcreditcard) {
		this.chkcreditcard = chkcreditcard;
	}

	public void setChkpet(String chkpet) {
		this.chkpet = chkpet;
	}

	public void setExpagerange(String expagerange) {
		this.expagerange = expagerange;
	}

	public void setExpguide(String expguide) {
		this.expguide = expguide;
	}

	public void setHeritage1(String heritage1) {
		this.heritage1 = heritage1;
	}

	public void setHeritage2(String heritage2) {
		this.heritage2 = heritage2;
	}

	public void setHeritage3(String heritage3) {
		this.heritage3 = heritage3;
	}

	public void setInfocenter(String infocenter) {
		this.infocenter = infocenter;
	}

	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public void setRestdate(String restdate) {
		this.restdate = restdate;
	}

	public void setUseseason(String useseason) {
		this.useseason = useseason;
	}

	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}
}
