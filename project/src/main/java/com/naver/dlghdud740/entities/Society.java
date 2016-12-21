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
	private String s_createdate;
	private int s_joinpeople;
	private String s_photo;
	private String s_photoname;
	private int s_dept;
	
	public int getS_dept() {
		return s_dept;
	}
	public void setS_dept(int s_dept) {
		this.s_dept = s_dept;
	}
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
	public String getS_createdate() {
		return s_createdate;
	}
	public void setS_createdate(String s_createdate) {
		this.s_createdate = s_createdate;
	}
	public int getS_joinpeople() {
		return s_joinpeople;
	}
	public void setS_joinpeople(int s_joinpeople) {
		this.s_joinpeople = s_joinpeople;
	}
	public String getS_photo() {
		return s_photo;
	}
	public void setS_photo(String s_photo) {
		this.s_photo = s_photo;
	}
	public String getS_photoname() {
		return s_photoname;
	}
	public void setS_photoname(String s_photoname) {
		this.s_photoname = s_photoname;
	}
	
}