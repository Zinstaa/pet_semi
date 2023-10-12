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
import com.kh.pet.member.model.vo.FindId;

/**
 * Servlet implementation class MemberFindIdController
 */
@WebServlet("/findid.me")
public class MemberFindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		FindId id = new MemberService().findId(email,phone);
		if(id==null) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg","일치하는 아이디가 없습니다");
			RequestDispatcher view = request.getRequestDispatcher("views/member/loginPage.jsp");
			view.forward(request, response);
		} else { 
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg","아이디는 <"+ id +"> 입니다");
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
