package com.kh.pet.place.model.dao;

import static com.kh.pet.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pet.place.model.vo.Place;
import com.kh.pet.place.model.vo.PlaceFile;

public class PlaceDao {
	
	private Properties prop = new Properties();
	
	public PlaceDao() {
		String filePath = PlaceDao.class.getResource("/sql/place/place-mapper.xml").getPath();

	
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertPlaceContent(Connection conn, Place p) {

		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPlaceContent");
		/*System.out.println(sql);
		System.out.println(p.getPlaceName());
		System.out.println(p.getPlaceInfo());
		System.out.println(p.getPlacePhone());
		System.out.println(p.getPlaceTimes());
		System.out.println(p.getPlaceUrl());
		System.out.println(p.getPlaceInfo());
		System.out.println(p.getPlaceAround());
		System.out.println(p.getPlacePrice());
		System.out.println(p.getPlaceCaution());
		System.out.println(p.getPlaceMap());
		System.out.println(Integer.parseInt(p.getMemberNo()));
		System.out.println(p.getPlaceCategoryNo());
		System.out.println(p.getLocalCategoryNo());*/
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPlaceName());
			pstmt.setString(2, p.getPlaceInfo());
			pstmt.setString(3, p.getPlacePhone());
			pstmt.setString(4, p.getPlaceTimes());
			pstmt.setString(5, p.getPlaceUrl());
			pstmt.setString(6, p.getPlaceInfo());
			pstmt.setString(7, p.getPlaceAround());
			pstmt.setString(8, p.getPlacePrice());
			pstmt.setString(9, p.getPlaceCaution());
			pstmt.setString(10, p.getPlaceMap());
			pstmt.setInt(11, Integer.parseInt(p.getMemberNo()));
			pstmt.setInt(12, p.getPlaceCategoryNo());
			pstmt.setInt(13, p.getLocalCategoryNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertPlaceFileList(Connection conn, ArrayList<PlaceFile> list) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPlaceFileList");
		
		try {
			for(PlaceFile pl : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, pl.getPlaceFileOriginName());
				pstmt.setString(2, pl.getPlaceFileChangeName());
				pstmt.setString(3, pl.getPlaceFilePath());
				pstmt.setInt(4, pl.getPlaceFileLevel());
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list.size() == result ? 1 : 0;
	}

	public ArrayList<Place> selectPlaceContentList(Connection conn) {

		ArrayList<Place> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlaceContentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Place p = new Place();
				p.setPlaceCategoryName(rset.getString("PLACE_CATEGORY_NAME"));
				p.setLocalCategoryName(rset.getString("LOCAL_CATEGORY_NAME"));
				p.setPlaceName(rset.getString("PLACE_NAME"));
				
				p.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}

