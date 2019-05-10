package com.allhotplace.www.dto;

public class Mapping {

	private int mapp_xType;
	private String mapp_xTypeName;
	private int mapp_sType;
	private String mapp_sTypeName;
	
	public int getMapp_xType() {
		return mapp_xType;
	}
	public void setMapp_xType(int mapp_xType) {
		this.mapp_xType = mapp_xType;
	}
	public String getMapp_xTypeName() {
		return mapp_xTypeName;
	}
	public void setMapp_xTypeName(String mapp_xTypeName) {
		this.mapp_xTypeName = mapp_xTypeName;
	}
	public int getMapp_sType() {
		return mapp_sType;
	}
	public void setMapp_sType(int mapp_sType) {
		this.mapp_sType = mapp_sType;
	}
	public String getMapp_sTypeName() {
		return mapp_sTypeName;
	}
	public void setMapp_sTypeName(String mapp_sTypeName) {
		this.mapp_sTypeName = mapp_sTypeName;
	}
	@Override
	public String toString() {
		return "Mapping [mapp_xType=" + mapp_xType + ", mapp_xTypeName=" + mapp_xTypeName + ", mapp_sType=" + mapp_sType
				+ ", mapp_sTypeName=" + mapp_sTypeName + "]";
	}
	

	
}