package com.model;

public class UserMemberVO {
	
	//유저필드
	private String user_no;
	private String user_name;
	private String user_tel;
	private String user_add;
	private String user_mid;
	
	
	public UserMemberVO(String user_no, String user_name, String user_tel, String user_add, String user_mid) {
		super();
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.user_add = user_add;
		this.user_mid = user_mid;
	}


	public UserMemberVO(String user_name, String user_tel, String user_add) {
		super();
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.user_add = user_add;
	}


	public String getUser_no() {
		return user_no;
	}


	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_tel() {
		return user_tel;
	}


	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}


	public String getUser_add() {
		return user_add;
	}


	public void setUser_add(String user_add) {
		this.user_add = user_add;
	}


	public String getUser_mid() {
		return user_mid;
	}


	public void setUser_mid(String user_mid) {
		this.user_mid = user_mid;
	}
	
	
	
	
	

	
	
	
	
	
}
