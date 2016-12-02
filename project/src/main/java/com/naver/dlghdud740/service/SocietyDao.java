package com.naver.dlghdud740.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.dlghdud740.entities.Society;
import com.naver.dlghdud740.entities.SocietyPage;
import com.naver.dlghdud740.entities.deletelist;

public interface SocietyDao {
	public int insertRow(Society society);
	public ArrayList<Society> selectAll(String category);
	public ArrayList<Society> findGroup(String namefind);
	public int selectCount(SocietyPage societypage);
	public ArrayList<Society> selectPageList(SocietyPage societypage);
	public Society selectSociety(String societyname);
	public int updatesociety(Society society);
	public int deletesociety(String societyname);
}
