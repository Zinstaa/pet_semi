package com.kh.pet.notice.service;
import static com.kh.pet.common.JDBCTemplate.close;
import static com.kh.pet.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.pet.common.model.PageInfo;
import com.kh.pet.notice.dao.NoticeDao;
public class NoticeService {
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public void selectList(PageInfo pi) {
		Connection conn = getConnection();
		new NoticeDao().selectListCount(conn, pi);
	}
}
