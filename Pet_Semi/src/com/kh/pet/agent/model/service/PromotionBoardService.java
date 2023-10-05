package com.kh.pet.agent.model.service;

import static com.kh.pet.common.JDBCTemplate.close;
import static com.kh.pet.common.JDBCTemplate.commit;
import static com.kh.pet.common.JDBCTemplate.getConnection;
import static com.kh.pet.common.JDBCTemplate.rollback;
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
