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
	
	
	public int insertPromotionBoard(PromotionBoard pb, ArrayList<PromotionFile> list){

		Connection conn = getConnection();

		// 1개의 트랜젝션에서 최소 2개 최대 5개의 INSERT가 필요
		int result1 = new PromotionBoardDao().insertPromotionBoard(conn, pb);

		int result2 = new PromotionBoardDao().insertPromotionFileList(conn, list);
		
		// 트랜잭션 처리
		if((result1 * result2) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
	}
	
	public int increasePromotionView(int promotionNo) {
		
		Connection conn = getConnection();
		
		int result = new PromotionBoardDao().increasePromotionView(conn, promotionNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public PromotionBoard selectPromotionBoard(int promotionNo){
		
		Connection conn = getConnection();
		
		PromotionBoard pb = new PromotionBoardDao().selectPromotionBoard(conn, promotionNo);
		
		close(conn);
		
		return pb;
	}
	
	public ArrayList<PromotionBoard> selectPromotionBoardList(){
		
		Connection conn = getConnection();
		ArrayList<PromotionBoard> list = new PromotionBoardDao().selectPromotionBoardList(conn);
		close(conn);
		return list;
	}
	
	
	public ArrayList<PromotionFile> selectPromotionFileList(int promotionNo) {
		
		Connection conn = getConnection();
		
		ArrayList<PromotionFile> list = new PromotionBoardDao().selectPromotionFileList(conn, promotionNo);
		
		close(conn);
		
		return list;
}
	
	public int deletPromotionBoard(int promotionNo) {
		
		Connection conn = getConnection();
		
		int result = new PromotionBoardDao().deletePromotionBoard(conn, promotionNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
}
