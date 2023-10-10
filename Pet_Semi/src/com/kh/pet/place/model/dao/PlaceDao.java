package com.kh.pet.place.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pet.place.model.vo.Place;
import com.kh.pet.place.model.vo.PlaceFile;

import static com.kh.pet.common.JDBCTemplate.*;

public class PlaceDao {
	
	private Properties prop = new Properties();
	
	public PlaceDao() {
		String filePath = PlaceDao.class.getResource("/sql/board/board-mapper.xml").getPath();

	
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
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, p.getPlaceCategoryNo());
			pstmt.setInt(2, p.getLocalCategoryNo());
			pstmt.setString(3, p.getPlaceName());
			pstmt.setString(4, p.getPlaceInfo());
			pstmt.setString(5, p.getPlacePhone());
			pstmt.setString(6, p.getPlaceTimes());
			pstmt.setString(7, p.getPlaceUrl());
			pstmt.setString(8, p.getPlaceInfo());
			pstmt.setString(9, p.getPlaceAround());
			pstmt.setString(10, p.getPlacePrice());
			pstmt.setString(11, p.getPlaceCaution());
			pstmt.setString(12, p.getPlaceMap());
			pstmt.setInt(13, p.getMemberNo());
			
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

}
