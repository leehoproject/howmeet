package com.naver.dlghdud740.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.dlghdud740.entities.Memberlist;
import com.naver.dlghdud740.entities.Society;
import com.naver.dlghdud740.entities.ids;
import com.naver.dlghdud740.entities.societylist;

public interface MemberlistDao {
	public ArrayList<Memberlist> selectAll(String societyname);
	public String selectMaster(String societyname);
	public String selectmasterid(String societyname);
	public int joinMember(societylist list);
	public int selectMember(societylist list);
	public int memberCount(String societyname);
	public int memberDown(String societyname);
	public int deleteRow(ids list);
	public int memberlevelup(ids list);
	public int memberleveldown(ids list);
	public int joinMaster(societylist list);
	
}
