package com.kh.pet.board.model.service;
import static com.kh.pet.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.pet.board.model.dao.BoardDao;
import com.kh.pet.common.model.PageInfo;

public class BoardService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public void selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		new BoardDao().selectList(conn, pi);
	}
	
}
