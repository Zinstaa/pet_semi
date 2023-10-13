package com.kh.pet.board.model.service;
import static com.kh.pet.common.JDBCTemplate.close;
import static com.kh.pet.common.JDBCTemplate.commit;
import static com.kh.pet.common.JDBCTemplate.getConnection;
import static com.kh.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.board.model.dao.BoardDao;
import com.kh.pet.board.model.vo.Board;
import com.kh.pet.board.model.vo.BoardFile;
import com.kh.pet.board.model.vo.BoardReview;
import com.kh.pet.common.model.PageInfo;

public class BoardService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int insertBoard(Board b, BoardFile bf) {
		
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn, b);
		int result2 = 1;
		
		if(bf != null) {
			result2 = new BoardDao().insertBoardFile(conn, bf);
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
		
	}
	
	public int increaseCount(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, boardNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}
	
	public Board selectBoard(int boardNo) {
		
		Connection conn =getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	
	public BoardFile selectBoardFile(int boardNo) {
		
		Connection conn = getConnection();
		
		BoardFile bf = new BoardDao().selectBoardFile(conn, boardNo);
		
		close(conn);
		
		return bf;
	}
	
	public int updateBoard(Board b, BoardFile bf) {
		
		Connection conn = getConnection();
		
		int result1 = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1;
		
		if(bf != null) {
			
			if(bf.getBoardFileNo() != 0) {
				
				result2 = new BoardDao().updateBoardFile(conn, bf);
			} else {
				result2 = new BoardDao().insertNewBoardFile(conn, bf);
			}
		}
		
		if((result1 * result2) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2);
	}
	
	public int deleteBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, boardNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<BoardReview> selectBoardReviewList(int boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<BoardReview> list = new BoardDao().selectBoardReviewList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
}
