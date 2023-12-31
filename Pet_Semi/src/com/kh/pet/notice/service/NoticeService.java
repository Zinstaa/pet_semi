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
		// 첨부파일이 있을경우
		if(nf != null) { // 첨부파일이 있을경우 noticefile에도 insert 한다.
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
	
	public int updateNotice(Notice n, NoticeFile nf) {
		Connection conn = getConnection();
		
		// 먼저 notice 테이블을 update한다.
		int result1 = new NoticeDao().updateNotice(conn, n);
		
		//notice 게시판 업데이트 작업 끝났으니 첨부파일 쪽 작업을 진행한다.
		int result2 = 1; 
		// 새로운 첨부파일이 있을 경우 update 및 insert 필요
		if(nf != null) {//파일이 있을 경우
			//1. 기존 파일이 있을 경우 -> 기존 파일 삭제 후 새로운 파일을 업데이트(update)
			if(nf.getNoticeFileNo() != 0) {//파일이 있따면 파일번호는 0이 아니다.
				//System.out.println("파일있어요~1");
				 result2 = new NoticeDao().updateNoticeFile(conn, nf);
			}else {//2. 기존파일 없을 경우 -> 새로운 파일을 추가(insert)
				 result2 = new NoticeDao().insertNoticeNewFile(conn, nf);
			}
		} 
		if((result1 * result2) > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return (result1 * result2);
		
		
		
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
}
