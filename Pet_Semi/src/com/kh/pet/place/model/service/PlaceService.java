package com.kh.pet.place.model.service;

import static com.kh.pet.common.JDBCTemplate.*;

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

}