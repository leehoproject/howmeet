package com.naver.dlghdud740.entities;

import org.springframework.stereotype.Component;

@Component
public class SocietyPage {
	private String find;
	private String selectbox;
	private int startrow;
	private int endrow;
	private int pagevalue;
	
	public String getFind() {
		return find;
	}
	
	public void setFind(String find) {
		this.find = find;
	}
	
	public String getSelectbox() {
		return selectbox;
	}
	
	public void setSelectbox(String selectbox) {
		this.selectbox = selectbox;
	}
	
	public int getStartrow() {
		return startrow;
	}
	
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	
	public int getEndrow() {
		return endrow;
	}
	
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	
	public int getPagevalue() {
		return pagevalue;
	}
	
	public void setPagevalue(int pagevalue) {
		this.pagevalue = pagevalue;
	}
	
}
