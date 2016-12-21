package com.naver.dlghdud740.service;

import java.util.ArrayList;
import java.util.Map;

import com.naver.dlghdud740.entities.Board;
import com.naver.dlghdud740.entities.BoardPaging;
import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.entities.MemberPaging;
import com.naver.dlghdud740.entities.Reply;
import com.naver.dlghdud740.entities.Society_Board;
import com.naver.dlghdud740.entities.Society_Reply;

public interface Society_BoardDao {
	public int selectCount(BoardPaging boardpaging);
	public int insertcontent(Society_Board board);
	public int selectCountAll(Map params);
	public ArrayList<Society_Board> selectAll(Map params);
	public ArrayList<Society_Board> selectPageList2(BoardPaging boardpaging);
	public Society_Board selectOne(int b_seq);
	public int updateRow(Society_Board board);
	public int deleteRow(int b_seq);
	public int updateHit(int b_seq);
	public int reply_deleteRow(int b_seq);
	public int insertReply(Society_Reply reply);
	public ArrayList<Society_Reply> replySelectAll(int b_seq);
	public int delete_replyRow(Map params);
	
	
}
