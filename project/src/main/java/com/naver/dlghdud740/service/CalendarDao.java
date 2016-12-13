package com.naver.dlghdud740.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.dlghdud740.entities.Calendar;
import com.naver.dlghdud740.entities.Photo;
import com.naver.dlghdud740.entities.Society;
import com.naver.dlghdud740.entities.SocietyPage;
import com.naver.dlghdud740.entities.deletelist;

public interface CalendarDao {
	public ArrayList<Calendar> selectSchedule(String societyname);
	public int insertSchedule(Calendar calendar);
	public int deleteSchedule(HashMap<String, String> map);
	public ArrayList<Calendar> selectSchedules(String societyname);
	public ArrayList<Calendar> upcomming(String societyname);
	public Calendar searchjuso(int c_seq);
}
