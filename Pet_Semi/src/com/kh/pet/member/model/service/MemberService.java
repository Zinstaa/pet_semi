package com.kh.pet.member.model.service;

import static com.kh.pet.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pet.common.JDBCTemplate;
import com.kh.pet.member.model.dao.MemberDao;
import com.kh.pet.member.model.vo.Member;


public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
	}
	
	public ArrayList<Member> searchMember(String searchList, String searchValue) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().searchMember(conn, searchList, searchValue);
		close(conn);
		
		return list;
		
	}

}
