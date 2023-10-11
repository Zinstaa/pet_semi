package com.kh.pet.promotionBoard.model.service;

import static com.kh.pet.common.JDBCTemplate.close;
import static com.kh.pet.common.JDBCTemplate.commit;
import static com.kh.pet.common.JDBCTemplate.getConnection;
import static com.kh.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.promotionBoard.model.dao.PromotionBoardDao;
import com.kh.pet.promotionBoard.model.vo.PromotionBoard;
import com.kh.pet.promotionBoard.model.vo.PromotionFile;

public class PromotionBoardService {
	
	public ArrayList<PromotionBoard> selectPromotionList() {
		
		Connection conn = getConnection();
		
		ArrayList<PromotionBoard> list = new PromotionBoardDao().selectPromotionList(conn);
		
		close(conn);
		
		return list;
	}

	public int insertPromotionBoard(PromotionBoard pb, ArrayList<PromotionFile> list){

		Connection conn = getConnection();

		// 1개의 트랜젝션에서 최소 2개 최대 5개의 INSERT가 필요
		int result1 = new PromotionBoardDao().insertPromotionBoard(conn, pb);

		int result2 = new PromotionBoardDao().insertPromotionBoardList(conn, list);
		
		// 둘 다 성공했을 경우에만 commit 
		if((result1 * result2) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
	}

	

}
