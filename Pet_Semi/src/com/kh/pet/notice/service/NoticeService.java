package com.kh.pet.notice.service;
import static com.kh.pet.common.JDBCTemplate.*;
import static com.kh.pet.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.pet.common.model.PageInfo;
import com.kh.pet.notice.dao.NoticeDao;
import com.kh.pet.notice.vo.Notice;
import com.kh.pet.notice.vo.NoticeFile;
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
	
	public  HashMap<String, Object> selectNotice(int noticeNo) {
		Connection conn = getConnection();
		 HashMap<String, Object> map = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return map;
	}
	public NoticeFile selectNoticeFile(int noticeNo) {
		Connection conn = getConnection();
		NoticeFile nf = new NoticeDao().selectNoticeFile(conn, noticeNo);
		close(conn);
		return nf;
	}
	
	public int insertNotice(Notice n, NoticeFile nf) {
		Connection conn = getConnection();
		
		//DAO 호출 두번 필요함. 왜냐면 notice 에 입력해야하고 파일도 입력해야하기 떄문에
		//notice 는 무조건 입력, 파일은 있을때만 입력
		int result1 = new NoticeDao().insertNotice(conn, n);
		
		int result2 = 1;
		if(nf != null) {
			result2 = new NoticeDao().insertNoticeFile(conn, nf);
		}
		
		if((result1 * result2) > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return (result1 * result2);
	}
	
}
