package com.kh.pet.place.model.service;

import static com.kh.pet.common.JDBCTemplate.close;
import static com.kh.pet.common.JDBCTemplate.commit;
import static com.kh.pet.common.JDBCTemplate.getConnection;
import static com.kh.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.place.model.dao.PlaceDao;
import com.kh.pet.place.model.vo.LocalCategory;
import com.kh.pet.place.model.vo.Place;
import com.kh.pet.place.model.vo.PlaceCategory;
import com.kh.pet.place.model.vo.PlaceFile;
import com.kh.pet.place.model.vo.PlacePageInfo;

public class PlaceService {

	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new PlaceDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Place> selectPlaceContentList(PlacePageInfo ppi) {
		
		Connection conn = getConnection();
		
		ArrayList<Place> list = new PlaceDao().selectPlaceContentList(conn, ppi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<PlaceCategory> selectPlaceCategoryList() {
		Connection conn = getConnection();
		
		ArrayList<PlaceCategory> pllist = new PlaceDao().selectPlaceCategoryList(conn);
		
		close(conn);
		
		return pllist;
	}
	
	public ArrayList<LocalCategory> selectLoaclCategoryList() {
		Connection conn = getConnection();
		
		ArrayList<LocalCategory> lolist = new PlaceDao().selectLoaclCategoryList(conn);
		
		close(conn);
		
		return lolist;
	}
	
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
		
		close(conn);
		
		return list;
	}

	public int updatePlace(Place p, ArrayList<PlaceFile> list) {
		Connection conn = getConnection();
		
		int result1 = new PlaceDao().upadtePlace(conn, p);
		
		int result2 = 1;
		
		if(list != null) {
			
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getPlaceFileNo() != 0) {
					result2 = new PlaceDao().updatePlaceFile(conn, list);
				} else {
					result2 = new PlaceDao().insertNewPlaceFileList(conn, list);
				}
			}
		}
		
		if((result1 * result2) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
	}
	
	public int deletePlace(int placeNo) {
		Connection conn = getConnection();
		
		int result = new PlaceDao().deletePlace(conn, placeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public ArrayList<Place> searchPlace(String placeName) {
		Connection conn = getConnection();
		
		ArrayList<Place> list = new PlaceDao().searchPlace(conn, placeName);
		
		close(conn);
		
		return list;
	}




}
