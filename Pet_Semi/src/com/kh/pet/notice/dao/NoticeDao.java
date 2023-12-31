package com.kh.pet.notice.dao;
import static com.kh.pet.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Properties;

import com.kh.pet.common.model.PageInfo;
import com.kh.pet.notice.vo.Notice;
import com.kh.pet.notice.vo.NoticeFile;

public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String filePath = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
		
			try {
				prop.loadFromXML(new FileInputStream(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
		
	}
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Notice> selectList(Connection conn, PageInfo pi) {
		ArrayList<Notice> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("NOTICE_NO"));
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setNoticeDate(rset.getDate("NOTICE_DATE"));
				n.setMemberNo(rset.getString("MEMBER_ID"));
				
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public HashMap<String, Object> selectNotice(Connection conn, int noticeNo) {
		Notice n = null;
		//자료형이 Notice인 값과 int인 값 두개가 있기 때문에 hashmap으로 넘겨준다. 
		//여기서 value의 제네릭은 두개이상의 자료형이기 때문에 Object로 설정을 한다.
		HashMap<String, Object> map = new HashMap();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice();
				n.setNoticeNo(rset.getInt("NOTICE_NO"));
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setMemberNo(rset.getString("MEMBER_ID"));
				n.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				n.setNoticeDate(rset.getDate("NOTICE_DATE"));
				int preNo = rset.getInt("PRE_NO");
				int nextNo = rset.getInt("NEXT_NO");
				
				//map에 Notice 담는다.
				map.put("n",n);
				//map.put("noticeNo",n.getNoticeNo());
				//map.put("noticeTitle",n.getNoticeTitle());
				//map.put("memberNo",n.getMemberNo());
				//map.put("noticeContent",n.getNoticeContent());
				//map.put("noticeDate",n.getNoticeDate());
				
				//map에 int 값 담는다
				map.put("preNo",preNo);
				map.put("nextNo",nextNo);
				//System.out.println(map);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		//hashmap값을 리턴한다.
		return map;
		
	}
	
	public NoticeFile selectNoticeFile(Connection conn, int noticeNo) {
		NoticeFile nf = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNoticeFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				nf = new NoticeFile();
				nf.setNoticeFileNo(rset.getInt("NOTICE_FILE_NO"));
				nf.setNoticeFileOriginName(rset.getString("NOTICE_FILE_ORIGIN_NAME"));
				nf.setNoticeFileChangeName(rset.getString("NOTICE_FILE_CHANGE_NAME"));
				nf.setNoticeFilePath(rset.getString("NOTICE_FILE_PATH"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return nf;
		
	}
	
	public int insertNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertNoticeFile(Connection conn, NoticeFile nf) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoticeFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nf.getNoticeFileOriginName());
			pstmt.setString(2, nf.getNoticeFileChangeName());
			pstmt.setString(3, nf.getNoticeFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateNoticeFile(Connection conn, NoticeFile nf) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNoticeFile");
		//System.out.println("파일있어요~2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nf.getNoticeFileOriginName());
			pstmt.setString(2, nf.getNoticeFileChangeName());
			pstmt.setString(3, nf.getNoticeFilePath());
			pstmt.setInt(4, nf.getNoticeFileNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertNoticeNewFile(Connection conn, NoticeFile nf) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoticeNewFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nf.getNoticeFileOriginName());
			pstmt.setString(2, nf.getNoticeFileChangeName());
			pstmt.setString(3, nf.getNoticeFilePath());
			pstmt.setInt(4, nf.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteNotice(Connection conn,  int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
}
