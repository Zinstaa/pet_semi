package com.kh.pet.member.model.dao;

import static com.kh.pet.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pet.member.model.vo.Member;

public class MemberDao {
	
private Properties prop = new Properties();
	
	public MemberDao() {
		String file = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO"),
							   rset.getString("MEMBER_ID"),
							   rset.getString("MEMBER_PWD"),
							   rset.getString("MEMBER_NAME"),
							   rset.getString("EMAIL"),
							   rset.getString("PHONE"),
							   rset.getString("NICKNAME"),
							   rset.getString("ADDRESS"),
							   rset.getInt("AGE"),
							   rset.getString("GENDER"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public ArrayList<Member> searchMember(Connection conn, String memberCondition, String memberSearch) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList();
		
		String sql = prop.getProperty("searchMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberCondition);
			pstmt.setString(2, memberSearch);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				Member m = new Member(rset.getInt("MEMBER_NO"),
						   rset.getString("MEMBER_ID"),
						   rset.getString("MEMBER_PWD"),
						   rset.getString("MEMBER_NAME"),
						   rset.getString("EMAIL"),
						   rset.getString("PHONE"),
						   rset.getString("NICKNAME"),
						   rset.getString("ADDRESS"),
						   rset.getInt("AGE"),
						   rset.getString("GENDER"),
						   rset.getDate("ENROLL_DATE"),
						   rset.getString("STATUS"));
				list.add(m);
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
}
