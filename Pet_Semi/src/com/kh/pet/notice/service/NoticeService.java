package com.kh.pet.notice.service;
import static com.kh.pet.common.JDBCTemplate.close;
import static com.kh.pet.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.common.model.PageInfo;
import com.kh.pet.notice.dao.NoticeDao;
import com.kh.pet.notice.vo.Notice;
public class NoticeService {
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Notice> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		close(conn);
		return list;
	}
}
