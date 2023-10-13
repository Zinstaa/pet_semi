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
import com.kh.pet.member.model.vo.FindPwd;

/**
 * Servlet implementation class MemberFindPwdController
 */
@WebServlet("/findpwd.me")
public class MemberFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String MemberId = request.getParameter("memberId");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		FindPwd pwd = new MemberService().findPwd(MemberId, email, phone);
		
		if(pwd==null) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg","일치하는 비밀번호가없습니다");
			RequestDispatcher view = request.getRequestDispatcher("views/member/loginPage.jsp");
			view.forward(request, response);
		} else {
			HttpSession seccion = request.getSession();
			seccion.setAttribute("alertMsg","비밀번호는 <"+ pwd +">입니다");
			RequestDispatcher view = request.getRequestDispatcher("views/member/loginPage.jsp");
			view.forward(request, response);
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
