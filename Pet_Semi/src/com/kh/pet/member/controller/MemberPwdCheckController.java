package com.kh.pet.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.pet.member.model.service.MemberService;
import com.kh.pet.member.model.vo.Member;

/**
 * Servlet implementation class MemberPwdCheckController
 */
@WebServlet("/pwdCheck.me")
public class MemberPwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//비밀번호 맞는지 확인
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		int memberNo = loginUser.getMemberNo();
		
		String memberPwd = request.getParameter("memberPwd");
		
		int result = new MemberService().pwdCheck(memberNo, memberPwd);

		if(result != 0) {
			response.sendRedirect(request.getContextPath() + "/update.me");
		} else {
			session.setAttribute("alertMsg", "비밀번호가 다릅니다");
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