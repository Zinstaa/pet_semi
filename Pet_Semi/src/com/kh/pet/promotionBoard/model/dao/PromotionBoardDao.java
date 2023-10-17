package com.kh.pet.promotionBoard.model.dao;

import static com.kh.pet.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pet.promotionBoard.model.vo.PromotionBoard;
import com.kh.pet.promotionBoard.model.vo.PromotionFile;

public class PromotionBoardDao {
	
	private Properties prop = new Properties();
	
	public PromotionBoardDao() {
		String filePath = PromotionBoardDao.class.getResource("/sql/promotionBoard/promotionBoard-mapper.xml").getPath();
	try {	
		prop.loadFromXML(new FileInputStream(filePath));
	} catch(IOException e) {
		e.printStackTrace();
	}
}
	
	public int insertPromotionFile(Connection conn, PromotionFile pf) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPromotionFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pf.getPromotionFileOriginName());
			pstmt.setString(2, pf.getPromotionFileChangeName());
			pstmt.setString(3, pf.getPromotionFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePromotionFile(Connection conn, PromotionFile pf) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePromotionFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  pf.getPromotionFileOriginName());
			pstmt.setString(2, pf.getPromotionFileChangeName());
			pstmt.setString(3, pf.getPromotionFilePath());
			pstmt.setInt(4, pf.getPromotionFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertNewPromotionFile(Connection conn, PromotionFile pf) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewPromotionFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  pf.getPromotionFileOriginName());
			pstmt.setString(2, pf.getPromotionFileChangeName());
			pstmt.setString(3, pf.getPromotionFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	public int insertPromotionBoard(Connection conn, PromotionBoard pb) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPromotionBoard"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pb.getPromotionTitle());
			pstmt.setString(2,  pb.getPromotionContent());
			pstmt.setInt(3, Integer.parseInt(pb.getPromotionWriter()));
			pstmt.setString(4, pb.getPromotionEventDate());
			
			System.out.println(pb);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int insertPromotionFileList(Connection conn, ArrayList<PromotionFile> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPromotionFileList");
		
		try {
			
			// 리스트의 요소개수만큼 PromotionFile테이블에 행을 추가
			for(PromotionFile pf : list) {
				// 반복할 떄마다 미완성된 SQL문을 담은 pstmt 객체 생성 
				pstmt = conn.prepareStatement(sql);
				// 완성형태로 만들기 pf에서 뽑아서 
				pstmt.setString(1, pf.getPromotionFileOriginName());
				pstmt.setString(2, pf.getPromotionFileChangeName());
				pstmt.setString(3, pf.getPromotionFilePath());
				pstmt.setInt(4, pf.getPromotionFileLevel());
				
				// 실행
				result += pstmt.executeUpdate(); 
				// 이대로 넘어갈 수 없음, 파일이 3개가 들어왔어, 성공, 실패, 성공 가운데 실패된거 어떻게 되? 성공했네로 되네?
				// 다 잘되었을 때만 1을 돌려주고 싶다 => 최소 1 하나부터 최대 1 네개 가지고 1을 만드는 방법은 곱하기 밖에 없어
				// 진짜 간단하게 생각하면 = 앞에 * 붙여줘도 되지않냐.. , 근데 1 뒤에 0을 곱하면 0이 되는거니까...
				// +를 사용해서 result와 pstmt.executeUpdate값을 더하고 +1해주는 연산처리방식 이용함
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list.size() == result ? 1 : 0;
	}
	
	public ArrayList<PromotionBoard> selectPromotionBoardList(Connection conn){ // 이번엔 전체조회니까 위치조회가 따로 불필요
		
		ArrayList<PromotionBoard> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPromotionBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				PromotionBoard pb = new PromotionBoard();
				pb.setPromotionNo(rset.getInt("PROMOTION_NO"));
				pb.setPromotionTitle(rset.getString("PROMOTION_TITLE"));
				pb.setPromotionView(rset.getInt("PROMOTION_VIEW"));
				// 홍보게시물번호, 제목, 조회수 저장경로, 조회수 조회할건데 promotionBoard에는 저장경로나 바뀐이름 담을만한 항목 없음
				// 그럼 이걸 어떻게 해야되지? -> 나중에 생각해보니 조인해야되네.. 근데 조인해야되는데 이미 테이블은 건들수 없어...선택지가 뭐밖에 없냐 
				// 선택지는 VO를 수정하는것뿐
				// 테이블이 달라, 두개를 합쳐서 가져갈건데 나눠가져갈 필요가 있냐 라는거지 
				// String img = rset.getString("PROMOTION_FILE_PATH") + "/" + rset.getString("PROMOTION_FILE_CHANGE_NAME");
				// 위에처럼 스트링 이미지에 담아서 프로모션보드에 객체를 하나 만들어서 거기에 담으면 되지 않을까? 라고 확장 사고 할수 있음
				// VO 수정하기 titleImg 만들어서 해주기
				pb.setTitleImg(rset.getString("TITLEIMG"));
				// 자바는 스트링클래스 특징이 뭐지? 주소값을 갖는다, 불변객체다, 스트에다가 더하기를 하면 어떻게 되지? -> 새로 생겨서 거기에 들어 -> 더하기를 두번이나 하네? -> 새로 생기고 또 새로 생기겠네
				// 그래서 mapper, oracle에 연산자 기호를 사용해서 써서 나타낼 수 있잖아..
				// 내가 앞에서 뭘 배웠지 생각하는게 좋음 
				list.add(pb);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int increasePromotionView(Connection conn, int promotionNo) {
		int result = 0;
		String sql = prop.getProperty("increasePromotionView");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, promotionNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public PromotionBoard selectPromotionBoard(Connection conn, int promotionNo) {
		
		PromotionBoard pb = new PromotionBoard();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPromotionBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  promotionNo);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				pb = new PromotionBoard();
				pb.setPromotionNo(rset.getInt("PROMOTION_NO"));
				pb.setPromotionTitle(rset.getString("PROMOTION_TITLE"));
				pb.setPromotionContent(rset.getString("PROMOTION_CONTENT"));
				pb.setPromotionDate(rset.getDate("PROMOTION_DATE"));
				pb.setPromotionWriter(rset.getString("MEMBER_ID"));
				pb.setPromotionEventDate(rset.getString("PROMOTION_EVENT_DATE"));
			}
;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pb;
	}
	
	public ArrayList<PromotionFile> selectPromotionFileList(Connection conn, int promotionNo){
		
		ArrayList<PromotionFile> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPromotionFileList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  promotionNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PromotionFile pf = new PromotionFile();
				pf.setPromotionFileNo(rset.getInt("PROMOTION_FILE_NO"));
				pf.setPromotionFileOriginName(rset.getString("PROMOTION_FILE_ORIGIN_NAME"));
				pf.setPromotionFileChangeName(rset.getString("PROMOTION_FILE_CHANGE_NAME"));
				pf.setPromotionFilePath(rset.getString("PROMOTION_FILE_PATH"));
				pf.setPromotionFileUploadDate(rset.getDate("PROMOTION_FILE_UPLOAD_DATE"));
				
				list.add(pf);
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
	
	


	
	
	


