package com.naver.dlghdud740.service;

import java.util.ArrayList;

import com.naver.dlghdud740.entities.Board;
import com.naver.dlghdud740.entities.BoardPaging;
import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.entities.MemberPaging;

public interface BoardDao {
//	public int selectCount(Boardpaging boardpaging);
	public int selectCountAll();
	public int insertcontent(Board board);
	public int insertreply(Board board);
	public ArrayList<Board> selectAll();
//	public ArrayList<Board> selectPageList(Boardpaging boardpaging);
	public Board selectOne(int b_seq);
	public int updateRow(Board board);
	public int deleteRow(int b_seq);
	public int updateHit(int b_seq);
}
