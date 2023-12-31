package com.kh.pet.member.model.service;

import static com.kh.pet.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.common.JDBCTemplate;
import com.kh.pet.member.model.dao.MemberDao;
import com.kh.pet.member.model.vo.Dog;
import com.kh.pet.member.model.vo.FindId;
import com.kh.pet.member.model.vo.FindPwd;
import com.kh.pet.member.model.vo.Member;
import com.kh.pet.member.model.vo.MemberFile;
import com.kh.pet.notice.dao.NoticeDao;
import com.kh.pet.notice.vo.Notice;
import com.kh.pet.notice.vo.NoticeFile;


public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
	}
	
	public ArrayList<Member> searchMember(String memberCondition, String memberSearch) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().searchMember(conn, memberCondition, memberSearch);
		close(conn);
		
		return list;
		
	}
	
	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Member detailMember(int memberNo){
		Connection conn = getConnection();
		Member m = new MemberDao().detailMember(conn, memberNo);
		close(conn);
		
		return m;
	}
	
	public int memberStatus(int no, String us) {
		Connection conn = getConnection();
		int result = new MemberDao().memberStatus(conn, no, us);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int idCheck(String checkId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		close(conn);
		return count;
	}
	
	public FindId findId(String email, String phone) {
		
		Connection conn = getConnection();
		FindId id = new MemberDao().findId(conn, email, phone);
		
		close(conn);
		
		return id;
	}
	
	public FindPwd findPwd(String MemberId, String email, String phone) {
		Connection conn = getConnection();
		FindPwd pwd = new MemberDao().findPwd(conn, MemberId, email, phone);
		
		close(conn);
		return pwd;
	}
	
	public int pwdCheck(int memberNo, String memberPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().pwdCheck(conn, memberNo, memberPwd);
		
		close(conn);
		return result;
	}
	
	public int updateMember(Member m) {
		Connection conn =JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public Member selectMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member updateMem = new MemberDao().selectMember(conn,memberId);
		
		close(conn);
		return updateMem;
	}
	public int updatePwdMember(int memberNo, String memberPwd, String updatePwd) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().updatePwdMember(conn, memberNo, memberPwd, updatePwd);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deleteMember(int memberNo, String memberPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().deleteMember(conn, memberNo, memberPwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
			} 
		close(conn);
		return result;
	}
	public int insertDog(Dog d, MemberFile mf) {
		Connection conn = getConnection();
		int result1 = new MemberDao().insertDog(conn, d);
		
		int result2 = new MemberDao().insertMemberFile(conn, mf);
		if((result1 * result2) > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return (result1 * result2);
	}
	public ArrayList<Dog> selectDogList(){
		Connection conn = getConnection();
		ArrayList<Dog> list = new MemberDao().selectDogList(conn);
		
		close(conn);
		return list;
	}
	
}
