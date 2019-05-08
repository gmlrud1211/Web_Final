package com.allhotplace.www.dto;

import java.util.Date;

public class Visitors {

	private Date visit_date;
	private int visit_count;
	private int visit_totCount;
	
	@Override
	public String toString() {
		return "Visitors [visit_date=" + visit_date + ", visit_count=" + visit_count + ", visit_totCount="
				+ visit_totCount + "]";
	}
	public Date getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(Date visit_date) {
		this.visit_date = visit_date;
	}
	public int getVisit_count() {
		return visit_count;
	}
	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}
	public int getVisit_totCount() {
		return visit_totCount;
	}
	public void setVisit_totCount(int visit_totCount) {
		this.visit_totCount = visit_totCount;
	}
	
	
}