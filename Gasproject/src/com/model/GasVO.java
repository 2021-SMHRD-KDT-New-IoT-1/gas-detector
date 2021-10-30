package com.model;

public class GasVO {

	private String manager_no;
	private String admin_no;
	private String user_no;
	private String user_mid;
	private String gas_level;
	private String dec_time;
	private String alert_cnt;
	
	public GasVO(String manager_no, String admin_no, String user_no, String user_mid, String gas_level,
			String dec_time) {
		super();
		this.manager_no = manager_no;
		this.admin_no = admin_no;
		this.user_no = user_no;
		this.user_mid = user_mid;
		this.gas_level = gas_level;
		this.dec_time = dec_time;
	}
	
	

	public GasVO(String user_no, String user_mid, String alert_cnt) {
		super();
		this.user_no = user_no;
		this.user_mid = user_mid;
		this.alert_cnt = alert_cnt;
	}



	public String getManager_no() {
		return manager_no;
	}

	public void setManager_no(String manager_no) {
		this.manager_no = manager_no;
	}

	public String getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(String admin_no) {
		this.admin_no = admin_no;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getUser_mid() {
		return user_mid;
	}

	public void setUser_mid(String user_mid) {
		this.user_mid = user_mid;
	}

	public String getGas_level() {
		return gas_level;
	}

	public void setGas_level(String gas_level) {
		this.gas_level = gas_level;
	}

	public String getDec_time() {
		return dec_time;
	}

	public void setDec_time(String dec_time) {
		this.dec_time = dec_time;
	}



	public String getAlert_cnt() {
		return alert_cnt;
	}



	public void setAlert_cnt(String alert_cnt) {
		this.alert_cnt = alert_cnt;
	}
	
	
	
	
}
