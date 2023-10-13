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
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		int memberNo = loginUser.getMemberNo();
		String memberId = loginUser.getMemberId();
		int num = Integer.parseInt(request.getParameter("memberNo"));
		
		// request로 값뽑는과정
		String memberPwd = request.getParameter("memberPwd");
		String updatePwd = request.getParameter("updatePwd");
		
		int result = new MemberService().updatePwdMember(memberNo,memberPwd, updatePwd);
		if(result > 0) {
			session.setAttribute("alertMsg", "비밀번호 변경 성공");
			session.setAttribute("loginUser", new MemberService().selectMember(memberId));
		} else {
			session.setAttribute("alertMsg", "비밀번호 변경 실패 다시 시도해주세요");
		}
		response.sendRedirect(request.getContextPath() + "/mypage.me");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
