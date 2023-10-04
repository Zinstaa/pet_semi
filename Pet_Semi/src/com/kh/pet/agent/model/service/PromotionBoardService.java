package com.kh.pet.board.model.service;

import com.kh.pet.common.JDBCTemplate.close;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.board.model.dao.PromotionBoardDao;
import com.kh.pet.board.model.vo.PromotionBoard;

public class PromotionBoardService {
	
	public ArrayList<PromotionBoard> selectPromotionList() {
		
		Connection conn = getConnection();
		
		ArrayList<PromotionBoard> list = new PromotionBoardDao().selectPromotionList(conn);
		
		close(conn);
		
		return list;
		
	}

}
