package com.kh.pet.agent.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.agent.model.dao.PromotionBoardDao;
import com.kh.pet.agent.model.vo.PromotionBoard;

public class PromotionBoardService {
	
	public ArrayList<PromotionBoard> selectPromotionList() {
		
		Connection conn = getConnection();
		
		ArrayList<PromotionBoard> list = new PromotionBoardDao().selectPromotionList(conn);
		
		close(conn);
		
		return list;
		
	}

}
