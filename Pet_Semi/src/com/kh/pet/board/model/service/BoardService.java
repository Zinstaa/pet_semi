package com.kh.pet.board.model.service;
import static com.kh.pet.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.board.model.dao.BoardDao;
import com.kh.pet.board.model.vo.Board;
import com.kh.pet.board.model.vo.BoardFile;
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
	
}
