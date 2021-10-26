package com.model;

public class localVO {

	private String loc_no;
	private String loc_name;
	
	public localVO(String loc_no, String loc_name) {
		super();
		this.loc_no = loc_no;
		this.loc_name = loc_name;
	}

	public String getLoc_no() {
		return loc_no;
	}

	public void setLoc_no(String loc_no) {
		this.loc_no = loc_no;
	}

	public String getLoc_name() {
		return loc_name;
	}

	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	
	
}
