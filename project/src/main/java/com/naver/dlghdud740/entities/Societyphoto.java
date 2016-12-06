package com.naver.dlghdud740.entities;


import org.springframework.stereotype.Component;


//대문사진
@Component
public class Societyphoto {
	private String s_photo;
	private String societyname;

	public String getS_photo() {
		return s_photo;
	}

	public void setS_photo(String s_photo) {
		this.s_photo = s_photo;
	}

	public String getSocietyname() {
		return societyname;
	}

	public void setSocietyname(String societyname) {
		this.societyname = societyname;
	}
	
	
	
}