package com.allhotplace.www.dto;

public class DetailResult_image {
	
	
//	검색결과 페이지에서 API 호출 시 값 전달을 위한 DTO

	// image
	private String originimgurl;
	private String smallimageurl;
	
	
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
	@Override
	public String toString() {
		return "DetailResult_image [originimgurl=" + originimgurl + ", smallimageurl=" + smallimageurl + "]";
	}
	
}
