package com.naver.dlghdud740.entities;

import org.springframework.stereotype.Component;

@Component
public class Society_Reply {
	private int r_seq;
	private String r_id;
	private String r_name;
	private String r_date;
	private String r_content;
	private int r_no;
	private String r_dept;
	
	public String getR_dept() {
		return r_dept;
	}
	public void setR_dept(String r_dept) {
		this.r_dept = r_dept;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getR_seq() {
		return r_seq;
	}
	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Byte getR_photo() {
		return r_photo;
	}
	public void setR_photo(Byte r_photo) {
		this.r_photo = r_photo;
	}
	private Byte r_photo;
	

}
