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

import com.kh.pet.member.model.vo.FindId;
import com.kh.pet.member.model.vo.FindPwd;
import com.kh.pet.member.model.vo.Member;
import com.kh.pet.common.JDBCTemplate.*;

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
							   rset.getString("AGE"),
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
		//System.out.println(456);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList();
		//System.out.println(memberCondition.substring(1,memberCondition.length()-1));
		String sql = "SELECT "
						+ "MEMBER_NO,"
						+ "MEMBER_ID,"
						+ "MEMBER_PWD,"
						+ "MEMBER_NAME,"
						+ "EMAIL,"
						+ "PHONE,"
						+ "NICKNAME,"
						+ "ADDRESS,"
						+ "AGE,"
						+ "GENDER,"
						+ "ENROLL_DATE,"
						+ "STATUS "
					+ "FROM"
						+ " MEMBER"
					+ " WHERE "
						+ memberCondition
						+ " LIKE "
						//+ "?"
						+ "'%'||?||'%'"
					+ " ORDER BY "
						+ "MEMBER_NO";
		//sql = sql.replaceAll("'","");
		//System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberSearch);
			
			//System.out.println(memberCondition);
			//System.out.println(memberSearch);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member(rset.getInt("MEMBER_NO"),
						   rset.getString("MEMBER_ID"),
						   rset.getString("MEMBER_PWD"),
						   rset.getString("MEMBER_NAME"),
						   rset.getString("EMAIL"),
						   rset.getString("PHONE"),
						   rset.getString("NICKNAME"),
						   rset.getString("ADDRESS"),
						   rset.getString("AGE"),
						   rset.getString("GENDER"),
						   rset.getDate("ENROLL_DATE"),
						   rset.getString("STATUS"));
				list.add(m);
			}
			//System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertMember(Connection conn, Member m ) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, m.getMemberId());
				pstmt.setString(2, m.getMemberPwd());
				pstmt.setString(3, m.getMemberName());
				pstmt.setString(4, m.getEmail());
				pstmt.setString(5, m.getPhone());
				pstmt.setString(6, m.getNickName());
				pstmt.setString(7, m.getAddress());
				pstmt.setString(8, m.getAge());
				pstmt.setString(9, m.getGender());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
	}
	
	public Member detailMember(Connection conn, int memberNo){
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		//ArrayList<Member> list = new ArrayList();
		Member m = new Member();
		
		
		String sql = prop.getProperty("detailMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member(rset.getInt("MEMBER_NO"),
						   rset.getString("MEMBER_ID"),
						   rset.getString("MEMBER_PWD"),
						   rset.getString("MEMBER_NAME"),
						   rset.getString("EMAIL"),
						   rset.getString("PHONE"),
						   rset.getString("NICKNAME"),
						   rset.getString("ADDRESS"),
						   rset.getString("AGE"),
						   rset.getString("GENDER"),
						   rset.getDate("ENROLL_DATE"),
						   rset.getString("STATUS"));
				//list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int memberStatus(Connection conn, int no, String us) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("memberStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, us);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public FindId findId(Connection conn, String email, String phone) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		FindId id = null;
		
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				id = new FindId(rset.getString("MEMBER_ID"),
							   rset.getString("EMAIL"),
							   rset.getString("PHONE"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			}
		return id;
		}
	public FindPwd findPwd(Connection conn, String MemberId, String email, String phone) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		FindPwd pwd = null;
		
		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MemberId);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pwd = new FindPwd(rset.getString("MEMBER_ID"),
								  rset.getString("MEMBER_PWD"),
								  rset.getString("EMAIL"),
								  rset.getString("PHONE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pwd;
	}

	public int pwdCheck(Connection conn, int memberNo, String memberPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("pwdCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("MEMBER_NO");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
					}
		return result;
		}
}
		
