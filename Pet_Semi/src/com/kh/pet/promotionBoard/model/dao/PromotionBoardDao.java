package com.kh.pet.promotionBoard.model.dao;

import static com.kh.pet.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pet.promotionBoard.model.vo.PromotionBoard;
import com.kh.pet.promotionBoard.model.vo.PromotionFile;

public class PromotionBoardDao {
	
	private Properties prop = new Properties();
	
	public PromotionBoardDao() {
		String filePath = PromotionBoardDao.class.getResource("/sql/promotionBoard/promotionBoard-mapper.xml").getPath();
	try {	
		prop.loadFromXML(new FileInputStream(filePath));
	} catch(IOException e) {
		e.printStackTrace();
	}
}
	
	public int selectrPromotionListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPromotionListCount");
		
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
		}
		
		return listCount;
	}
	
	public int insertPromotionFile(Connection conn, PromotionFile pf) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPromotionFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pf.getPromotionFileOriginName());
			pstmt.setString(1, pf.getPromotionFileChangeName());
			pstmt.setString(3, pf.getPromotionFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	public ArrayList<PromotionBoard> selectPromotionList(Connection conn) {
		
		ArrayList<PromotionBoard> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPromotionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PromotionBoard pb = new PromotionBoard();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int insertPromotionBoard(Connection conn, PromotionBoard pb) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewPromotionBoard"); 

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pb.getPromotionTitle());
			pstmt.setString(2,  pb.getPromotionContent());
			pstmt.setInt(3, Integer.parseInt(pb.getPromotionWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
	}
		return result;
}
	
	public int insertPromotionBoardList(Connection conn, ArrayList<PromotionFile> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPromotionFileList");
		
		try {
			
			// 리스트의 요소개수만큼 PromotionFile테이블에 행을 추가
			for(PromotionFile pf : list) {
				// 반복할 떄마다 미완성된 SQL문을 담은 pstmt 객체 생성 
				pstmt = conn.prepareStatement(sql);
				// 완성형태로 만들기 pf에서 뽑아서 
				pstmt.setString(1, pf.getPromotionFileOriginName());
				pstmt.setString(2, pf.getPromotionFileChangeName());
				pstmt.setString(3, pf.getPromotionFilePath());
				pstmt.setInt(4, pf.getPromotionFileLevel());
				
				// 실행
				result += pstmt.executeUpdate(); 
				// 이대로 넘어갈 수 없음, 파일이 3개가 들어왔어, 성공, 실패, 성공 가운데 실패된거 어떻게 되? 성공했네로 되네?
				// 다 잘되었을 때만 1을 돌려주고 싶다 => 최소 1 하나부터 최대 1 네개 가지고 1을 만드는 방법은 곱하기 밖에 없어
				// 진짜 간단하게 생각하면 = 앞에 * 붙여줘도 되지않냐.. , 근데 1 뒤에 0을 곱하면 0이 되는거니까...
				// 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list.size() == result ? 1 : 0;
	}
	
	

}
