package com.naver.dlghdud740.entities;


import org.springframework.stereotype.Component;


@Component
public class Member {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_phone; 
	private String m_phone1;
	private String m_phone2;
	private String m_phone3;
	private String m_addr1;
	private String m_addr2;
	private String m_email;
	private int m_hobby1;
	private int m_hobby2;
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_phone1() {
		return m_phone1;
	}
	public void setM_phone1(String m_phone1) {
		this.m_phone1 = m_phone1;
	}
	public String getM_phone2() {
		return m_phone2;
	}
	public void setM_phone2(String m_phone2) {
		this.m_phone2 = m_phone2;
	}
	public String getM_phone3() {
		return m_phone3;
	}
	public void setM_phone3(String m_phone3) {
		this.m_phone3 = m_phone3;
	}
	public String getM_addr1() {
		return m_addr1;
	}
	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}
	public String getM_addr2() {
		return m_addr2;
	}
	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getM_hobby1() {
		return m_hobby1;
	}
	public void setM_hobby1(int m_hobby1) {
		this.m_hobby1 = m_hobby1;
	}
	public int getM_hobby2() {
		return m_hobby2;
	}
	public void setM_hobby2(int m_hobby2) {
		this.m_hobby2 = m_hobby2;
	}
	
	
}
