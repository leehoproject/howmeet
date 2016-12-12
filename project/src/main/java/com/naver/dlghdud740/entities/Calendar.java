package com.naver.dlghdud740.entities;


import org.springframework.stereotype.Component;


//동호회
@Component
public class Calendar {
	private String c_date;
	private int c_peoplenum;
	private String c_content;
	private String c_spot1;
	private String c_spot2;
	private String c_date1;
	private String c_date2;
	private String c_date3;
	private String c_societyname;
	private String c_name;
	private String c_photo;
	private String c_zipcode;
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public int getC_peoplenum() {
		return c_peoplenum;
	}
	public void setC_peoplenum(int c_peoplenum) {
		this.c_peoplenum = c_peoplenum;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_societyname() {
		return c_societyname;
	}
	public void setC_societyname(String c_societyname) {
		this.c_societyname = c_societyname;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_photo() {
		return c_photo;
	}
	public void setC_photo(String c_photo) {
		this.c_photo = c_photo;
	}
	public String getC_spot1() {
		return c_spot1;
	}
	public void setC_spot1(String c_spot1) {
		this.c_spot1 = c_spot1;
	}
	public String getC_spot2() {
		return c_spot2;
	}
	public void setC_spot2(String c_spot2) {
		this.c_spot2 = c_spot2;
	}
	public String getC_date1() {
		return c_date1;
	}
	public void setC_date1(String c_date1) {
		this.c_date1 = c_date1;
	}
	public String getC_date2() {
		return c_date2;
	}
	public void setC_date2(String c_date2) {
		this.c_date2 = c_date2;
	}
	public String getC_date3() {
		return c_date3;
	}
	public void setC_date3(String c_date3) {
		this.c_date3 = c_date3;
	}
	public String getC_zipcode() {
		return c_zipcode;
	}
	public void setC_zipcode(String c_zipcode) {
		this.c_zipcode = c_zipcode;
	}
	
}