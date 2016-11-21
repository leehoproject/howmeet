package com.naver.dlghdud740.service;

import java.util.ArrayList;

import com.naver.dlghdud740.entities.Society;
import com.naver.dlghdud740.entities.SocietyPage;

public interface SocietyDao {
	public int insertRow(Society society);
	public ArrayList<Society> selectAll();
	public int selectCount(SocietyPage societypage);
	public ArrayList<Society> selectPageList(SocietyPage societypage);
}
