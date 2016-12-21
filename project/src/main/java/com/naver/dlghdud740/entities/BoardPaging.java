package com.naver.dlghdud740.entities;

import org.springframework.stereotype.Component;

@Component
public class BoardPaging {
	private String find;
	private String selectbox;
	private int startrow;
	private int endrow;
	private String b_dept1;
	private int b_dept2;
	
	public String getB_dept1() {
		return b_dept1;
	}
	public void setB_dept1(String b_dept1) {
		this.b_dept1 = b_dept1;
	}
	public int getB_dept2() {
		return b_dept2;
	}
	public void setB_dept2(int b_dept2) {
		this.b_dept2 = b_dept2;
	}
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
	
}
