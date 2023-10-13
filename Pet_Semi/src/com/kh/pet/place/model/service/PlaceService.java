package com.kh.pet.place.model.service;

import static com.kh.pet.common.JDBCTemplate.close;
import static com.kh.pet.common.JDBCTemplate.commit;
import static com.kh.pet.common.JDBCTemplate.getConnection;
import static com.kh.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.place.model.dao.PlaceDao;
import com.kh.pet.place.model.vo.Place;
import com.kh.pet.place.model.vo.PlaceFile;

public class PlaceService {

	public int insertPlaceContent(Place p, ArrayList<PlaceFile> list) {
		
		Connection conn = getConnection();
		
		int result1 = new PlaceDao().insertPlaceContent(conn, p);
		
		int result2 = new PlaceDao().insertPlaceFileList(conn, list);
		
		if((result1 * result2) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
	}

	public ArrayList<Place> selectPlaceContentList() {
		
		Connection conn = getConnection();
		
		ArrayList<Place> list = new PlaceDao().selectPlaceContentList(conn);
		
		close(conn);
		
		return list;
	}

	public Place selectPlace(int placeNo) {
		
		Connection conn = getConnection();
		
		Place p = new PlaceDao().selectPlace(conn, placeNo);
		
		close(conn);
		
		return p;
	}
	
	public PlaceFile selectPlaceFile(int placeNo) {
		
		Connection conn = getConnection();
		
		PlaceFile pl = new PlaceDao().selectPlaceFile(conn, placeNo);
		
		close(conn);
		
		return pl;
	}

	public ArrayList<PlaceFile> selectPlaceFileList(int placeNo) {
			
		Connection conn = getConnection();
		
		ArrayList<PlaceFile> list = new PlaceDao().selectPlaceFileList(conn, placeNo);
		return list;
	}




}
