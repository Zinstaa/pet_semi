package com.kh.pet.board.model.dao;

import static com.kh.pet.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pet.board.model.vo.Board;
import com.kh.pet.board.model.vo.BoardFile;
import com.kh.pet.board.model.vo.BoardReview;
import com.kh.pet.common.model.PageInfo;
public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String filePath = BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
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
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<Board> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1 ;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardName(rset.getString("BOARD_NAME"));
				b.setMemberNo(rset.getString("MEMBER_ID"));
				b.setBoardView(rset.getInt("BOARD_VIEW"));
				b.setBoardDate(rset.getDate("BOARD_DATE"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectSearchListCount(Connection conn, String boardName) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardName);
			
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
	
	public int insertBoard(Connection conn, Board b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardName());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, Integer.parseInt(b.getMemberNo()));
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertBoardFile(Connection conn, BoardFile bf) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoardFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bf.getBoardFileOriginName());
			pstmt.setString(2, bf.getBoardFileChangeName());
			pstmt.setString(3, bf.getBoardfilePath());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public int increaseCount(Connection conn, int boardNo) {
		
		int result = 0;
		
		String sql = prop.getProperty("increaseCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public Board selectBoard(Connection conn, int boardNo) {
		
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardName(rset.getString("BOARD_NAME"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setMemberNo(rset.getString("MEMBER_ID"));
				b.setBoardDate(rset.getDate("BOARD_DATE"));
				b.setBoardView(rset.getInt("BOARD_VIEW"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	public BoardFile selectBoardFile(Connection conn, int boardNo) {
		
		BoardFile bf = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bf = new BoardFile();
				bf.setBoardFileNo(rset.getInt("BOARD_FILE_NO"));
				bf.setBoardFileOriginName(rset.getString("BOARD_FILE_ORIGIN_NAME"));
				bf.setBoardFileChangeName(rset.getString("BOARD_FILE_CHANGE_NAME"));
				bf.setBoardfilePath(rset.getString("BOARD_FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return bf;
	}
	
	public int updateBoard(Connection conn, Board b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardName());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateBoardFile(Connection conn, BoardFile bf) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoardFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bf.getBoardFileOriginName());
			pstmt.setString(2, bf.getBoardFileChangeName());
			pstmt.setString(3, bf.getBoardfilePath());
			pstmt.setInt(4, bf.getBoardFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertNewBoardFile(Connection conn, BoardFile bf) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewBoardFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bf.getBoardFileOriginName());
			pstmt.setString(2, bf.getBoardFileChangeName());
			pstmt.setString(3, bf.getBoardfilePath());
			pstmt.setInt(4, bf.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteBoard(Connection conn, int boardNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<BoardReview> selectBoardReviewList(Connection conn, int boardNo) {
		
		ArrayList<BoardReview> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoardReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new BoardReview(rset.getInt("BOARD_REVIEW_NO"),
										 rset.getString("BOARD_REVIEW_CONTENT"),
										 rset.getString("MEMBER_ID"),
										 rset.getString("BOARD_REVIEW_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public int insertBoardReview(Connection conn, BoardReview b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoardReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardReviewContent());
			pstmt.setInt(2, b.getBoardNo());
			pstmt.setInt(3, Integer.parseInt(b.getBoardReviewWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<Board> searchBoard(Connection conn, String boardName, PageInfo pi) {
		
		ArrayList<Board> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1 ;
			
			pstmt.setString(1, boardName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardName(rset.getString("BOARD_NAME"));
				b.setMemberNo(rset.getString("MEMBER_ID"));
				b.setBoardView(rset.getInt("BOARD_VIEW"));
				b.setBoardDate(rset.getDate("BOARD_DATE"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
