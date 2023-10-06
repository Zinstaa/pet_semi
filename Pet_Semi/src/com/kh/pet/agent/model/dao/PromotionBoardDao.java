package com.kh.pet.agent.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.pet.agent.model.vo.PromotionBoard;

public class PromotionBoardDao {
	
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
				pb.setAgentNo(rset.getInt("BOARD_NO"));
				pb.setAgentTitle(rset.getString("BOARD_TITLE"));
				pb.setCount(rset.getInt("COUNT"));
				// 번호, 제목, 조회수, 저장경로, 바뀐이름
				// String img = rset.getString("FILE_PATH") + "/" + rset.getString("CHANGE_NAME");
				pb.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(b);
				//
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
