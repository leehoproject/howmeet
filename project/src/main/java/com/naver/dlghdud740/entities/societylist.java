package com.naver.dlghdud740.entities;


import org.springframework.stereotype.Component;


//동호회
@Component
public class societylist {
	private String sessionid;
	private String societyname;

	public String getSessionid() {
		return sessionid;
	}
	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}
	public String getSocietyname() {
		return societyname;
	}
	public void setSocietyname(String societyname) {
		this.societyname = societyname;
	}

	
}