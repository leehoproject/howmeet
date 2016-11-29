package com.naver.dlghdud740.entities;


import org.springframework.stereotype.Component;


@Component
public class deletelist {
	private String p_seq;
	private String societyname;
	public String getP_seq() {
		return p_seq;
	}
	public void setP_seq(String p_seq) {
		this.p_seq = p_seq;
	}
	public String getSocietyname() {
		return societyname;
	}
	public void setSocietyname(String societyname) {
		this.societyname = societyname;
	}



	
}