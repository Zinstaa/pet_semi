package com.kh.pet.member.model.service;

import java.sql.Connection;

import com.kh.pet.common.JDBCTemplate;
import com.kh.pet.member.model.dao.MemberDao;
import com.kh.pet.member.model.vo.Member;
import static com.kh.pet.common.JDBCTemplate.*;


public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
	}

}
