package com.naver.dlghdud740.entities;


import org.springframework.stereotype.Component;

//동호회 회원
@Component
public class Memberlist {
	private String m_id;
	private String m_name;
	private int m_level;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_level() {
		return m_level;
	}
	public void setM_level(int m_level) {
		this.m_level = m_level;
	}
	
	
	
}
