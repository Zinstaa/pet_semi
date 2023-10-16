package com.kh.pet.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.pet.member.model.service.MemberService;
import com.kh.pet.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateCheckController
 */
@WebServlet("/update.mem")
public class MemberUpdateCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//아이디 이름 닉네임 주소 나이
		
		String memberName = request.getParameter("memberName");
		String nickName = request.getParameter("nickName");
		String address = request.getParameter("address");
		String age = request.getParameter("age");
		String memberId = request.getParameter("memberId");
		
		Member m = new Member();
		
		m.setMemberName(memberName);
		m.setNickName(nickName);
		m.setAddress(address);
		m.setAge(age);
		m.setMemberId(memberId);
		
		int result = new MemberService().updateMember(m);

		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "정보수정을 완료했습니다");
			String memberPwd = ((Member)session.getAttribute("loginUser")).getMemberPwd();
			
			Member updateMem = new MemberService().loginMember(memberId, memberPwd);
			
			session.setAttribute("loginUser", updateMem);
			response.sendRedirect(request.getContextPath() + "/mypage.me");
			
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "정보 수정 실패");
			response.sendRedirect(request.getContextPath() + "/mypage.me");
		}
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
