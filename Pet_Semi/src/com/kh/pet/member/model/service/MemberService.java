package com.kh.pet.member.model.service;

import static com.kh.pet.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.common.JDBCTemplate;
import com.kh.pet.member.model.dao.MemberDao;
import com.kh.pet.member.model.vo.Member;


public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
	}
	
	public ArrayList<Member> searchMember(String memberCondition, String memberSearch) {
		//System.out.println(123);
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

}
