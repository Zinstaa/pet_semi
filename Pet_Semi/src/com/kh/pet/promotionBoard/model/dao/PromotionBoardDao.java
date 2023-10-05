package com.kh.pet.promotionBoard.model.dao;

import static com.kh.pet.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pet.promotionBoard.model.vo.PromotionBoard;

public class PromotionBoardDao {
	/*
	
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
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}
	*/
	

}
