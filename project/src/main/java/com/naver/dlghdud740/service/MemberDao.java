package com.naver.dlghdud740.service;

import java.util.ArrayList;

import com.naver.dlghdud740.entities.Member;

public interface MemberDao {
	public int insertRow(Member member);
	public int selectCount(String m_id);
	public Member selectLogin(Member member);
	public Member selectOne(String m_id);
	public int deleteRow(String m_id);
	public int updateRow(Member member);
	
}
