package com.naver.dlghdud740.service;

import java.util.ArrayList;

import com.naver.dlghdud740.entities.Memberlist;
import com.naver.dlghdud740.entities.Photo;
import com.naver.dlghdud740.entities.Society;

public interface PhotoDao {
	public ArrayList<Photo> selectPhoto();
	public int insertPhoto(Photo photo);
}
