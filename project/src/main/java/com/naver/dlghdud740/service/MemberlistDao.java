package com.naver.dlghdud740.service;

import java.util.ArrayList;

import com.naver.dlghdud740.entities.Memberlist;
import com.naver.dlghdud740.entities.Society;
import com.naver.dlghdud740.entities.societylist;

public interface MemberlistDao {
	public ArrayList<Memberlist> selectAll(String societyname);
	public int joinMember(societylist list);
	public int selectMember(societylist list);
}
