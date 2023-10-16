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

import com.kh.pet.place.model.vo.LocalCategory;
import com.kh.pet.place.model.vo.Place;
import com.kh.pet.place.model.vo.PlaceCategory;
import com.kh.pet.place.model.vo.PlaceFile;
import com.kh.pet.place.model.vo.PlacePageInfo;

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

	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return listCount;
	}
	
	public ArrayList<Place> selectPlaceContentList(Connection conn, PlacePageInfo ppi) {

		ArrayList<Place> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlaceContentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (ppi.getCurrentPage()-1) * ppi.getPlaceLimit()+1;
			int endRow = startRow + ppi.getPlaceLimit()-1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Place p = new Place();
				p.setPlaceCategory(rset.getString("PLACE_CATEGORY_NAME"));
				p.setLocalCategory(rset.getString("LOCAL_CATEGORY_NAME"));
				p.setPlaceName(rset.getString("PLACE_NAME"));
				p.setPlaceNo(rset.getInt("PLACE_NO"));
				
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
	
	public ArrayList<PlaceCategory> selectPlaceCategoryList(Connection conn) {
		ArrayList<PlaceCategory> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlaceCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(
						new PlaceCategory(
								rset.getInt("PLACE_CATEGORY_NO"), 
								rset.getString("PLACE_CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public ArrayList<LocalCategory> selectLoaclCategoryList(Connection conn) {
		ArrayList<LocalCategory> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLoaclCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(
						new LocalCategory(
								rset.getInt("LOCAL_CATEGORY_NO"),
								rset.getString("LOCAL_CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	public int insertPlaceContent(Connection conn, Place p) {

		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPlaceContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPlaceName());
			pstmt.setString(2, p.getPlaceAddress());
			pstmt.setString(3, p.getPlacePhone());
			pstmt.setString(4, p.getPlaceTimes());
			pstmt.setString(5, p.getPlaceUrl());
			pstmt.setString(6, p.getPlaceInfo());
			pstmt.setString(7, p.getPlaceAround());
			pstmt.setString(8, p.getPlacePrice());
			pstmt.setString(9, p.getPlaceCaution());
			pstmt.setString(10, p.getPlaceMap());
			pstmt.setInt(11, Integer.parseInt(p.getMemberNo()));
			pstmt.setInt(12, Integer.parseInt(p.getPlaceCategory()));
			pstmt.setInt(13, Integer.parseInt(p.getLocalCategory()));
			
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
	
	public int insertNewPlaceFileList(Connection conn, ArrayList<PlaceFile> list) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewPlaceFileList");
		
		try {
			for(PlaceFile pl : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, pl.getPlaceFileOriginName());
				pstmt.setString(2, pl.getPlaceFileChangeName());
				pstmt.setString(3, pl.getPlaceFilePath());
				pstmt.setInt(4, pl.getPlaceFileLevel());
				pstmt.setInt(5, pl.getPlaceNo());
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list.size() == result ? 1 : 0;
	}

	

	public Place selectPlace(Connection conn, int placeNo) {
		Place p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Place();
				p.setPlaceNo(rset.getInt("PLACE_NO"));
				p.setPlaceName(rset.getString("PLACE_NAME"));
				p.setPlaceAddress(rset.getString("PLACE_ADDRESS"));
				p.setPlacePhone(rset.getString("PLACE_PHONE"));
				p.setPlaceTimes(rset.getString("PLACE_TIMES"));
				p.setPlaceUrl(rset.getString("PLACE_URL"));
				p.setPlaceInfo(rset.getString("PLACE_INFO"));
				p.setPlaceAround(rset.getString("PLACE_AROUND"));
				p.setPlacePrice(rset.getString("PLACE_PRICE"));
				p.setPlaceCaution(rset.getString("PLACE_CAUTION"));
				p.setPlaceMap(rset.getString("PLACE_MAP"));
				p.setPlaceCategory(rset.getString("PLACE_CATEGORY_NAME"));
				p.setLocalCategory(rset.getString("LOCAL_CATEGORY_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public PlaceFile selectPlaceFile(Connection conn, int placeNo) {
		PlaceFile pl = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlaceFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, placeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pl = new PlaceFile();
				pl.setPlaceFileNo(rset.getInt("PLACE_FILE_NO"));
				pl.setPlaceFileOriginName(rset.getString("PLACE_FILE_ORIGIN_NAME"));
				pl.setPlaceFileChangeName(rset.getString("PLACE_FILE_CHANGE_NAME"));
				pl.setPlaceFilePath(rset.getString("PLACE_FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pl;
	}
	
	public ArrayList<PlaceFile> selectPlaceFileList(Connection conn, int placeNo) {
		
		ArrayList<PlaceFile> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPlaceFileList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, placeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PlaceFile pl = new PlaceFile();
				pl.setPlaceFileNo(rset.getInt("PLACE_FILE_NO"));
				pl.setPlaceFileOriginName(rset.getString("PLACE_FILE_ORIGIN_NAME"));
				pl.setPlaceFileChangeName(rset.getString("PLACE_FILE_CHANGE_NAME"));
				pl.setPlaceFilePath(rset.getString("PLACE_FILE_PATH"));
				list.add(pl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int upadtePlace(Connection conn, Place p) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePlace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getPlaceName());
			pstmt.setString(2, p.getPlaceAddress());
			pstmt.setString(3, p.getPlacePhone());
			pstmt.setString(4, p.getPlaceTimes());
			pstmt.setString(5, p.getPlaceUrl());
			pstmt.setString(6, p.getPlaceInfo());
			pstmt.setString(7, p.getPlaceAround());
			pstmt.setString(8, p.getPlacePrice());
			pstmt.setString(9, p.getPlaceCaution());
			pstmt.setString(10, p.getPlaceMap());
			pstmt.setInt(11, Integer.parseInt(p.getPlaceCategory()));
			pstmt.setInt(12, Integer.parseInt(p.getLocalCategory()));
			pstmt.setInt(13, p.getPlaceNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int updatePlaceFile(Connection conn, ArrayList<PlaceFile> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePlaceFile");
		
		try {
			for(PlaceFile pl : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, pl.getPlaceFileOriginName());
				pstmt.setString(2, pl.getPlaceFileChangeName());
				pstmt.setString(3, pl.getPlaceFilePath());
				pstmt.setInt(4, pl.getPlaceFileNo());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list.size() == result ? 1 : 0;
	}

	public int deletePlace(Connection conn, int placeNo) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletePlace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, placeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Place> searchPlace(Connection conn, String placeName) {
		
		ArrayList<Place> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchPlace");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, placeName);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Place p = new Place();
				p.setPlaceCategory(rset.getString("PLACE_CATEGORY_NAME"));
				p.setLocalCategory(rset.getString("LOCAL_CATEGORY_NAME"));
				p.setPlaceName(rset.getString("PLACE_NAME"));
				p.setPlaceNo(rset.getInt("PLACE_NO"));
				
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

