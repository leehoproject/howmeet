package com.naver.dlghdud740.entities;


import org.springframework.stereotype.Component;


//동호회
@Component
public class Society {
	private String s_hobby;
	private String s_name;
	private String s_content;
	private String s_area;
	private String s_peoplenum;
	
	public String getS_area() {
		return s_area;
	}
	public void setS_area(String s_area) {
		this.s_area = s_area;
	}
	public String getS_hobby() {
		return s_hobby;
	}
	public void setS_hobby(String s_hobby) {
		this.s_hobby = s_hobby;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public String getS_peoplenum() {
		return s_peoplenum;
	}
	public void setS_peoplenum(String s_peoplenum) {
		this.s_peoplenum = s_peoplenum;
	}
	
}