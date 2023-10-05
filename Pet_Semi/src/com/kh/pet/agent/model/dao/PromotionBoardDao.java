package com.kh.pet.agent.model.dao;

import static com.kh.pet.common.JDBCTemplate.close;
import java.util.Properties;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.pet.agent.model.vo.PromotionBoard;

public class PromotionBoardDao {
	
	private Properties prop = new Properties();
	
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
				
				pb.setPromotionNumber(rset.getInt("PROMOTION_NUMBER"));
				pb.setPromotionTitle(rset.getString("PROMOTION_TITLE"));
				// 번호, 제목, 조회수, 저장경로, 바뀐이름
				// String img = rset.getString("FILE_PATH") + "/" + rset.getString("CHANGE_NAME");
				pb.setPromotionTitle(rset.getString("TITLEIMG"));
				
				list.add(pb);
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
