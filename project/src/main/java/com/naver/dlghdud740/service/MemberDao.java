package com.naver.dlghdud740.service;

import java.util.ArrayList;

import com.naver.dlghdud740.entities.Member;

public interface MemberDao {
	public int insertRow(Member member);
	public int selectCount(String id);

}
