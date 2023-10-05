package com.kh.pet.promoitonBoard.model.service;

import static com.kh.pet.common.JDBCTemplate.close;
import static com.kh.pet.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.promoitonBoard.model.dao.PromotionBoardDao;
import com.kh.pet.promoitonBoard.model.vo.PromotionBoard;

public class PromotionBoardService {
	
	public ArrayList<PromotionBoard> selectPromotionList() {
		
		Connection conn = getConnection();
		
		ArrayList<PromotionBoard> list = new PromotionBoardDao().selectPromotionList(conn);
		
		close(conn);
		
		return list;
		
	}

}
