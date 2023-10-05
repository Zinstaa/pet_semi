package com.kh.pet.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.member.model.service.MemberService;
import com.kh.pet.member.model.vo.Member;

/**
 * Servlet implementation class MemberDetailController
 */
@WebServlet("/detail.me")
public class MemberDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//맴버번호 받아온걸로 값을 뽑아낸다.
		int memberNo = Integer.parseInt(request.getParameter("mno"));
		System.out.println(memberNo);
		
		Member m = new MemberService().detailMember(memberNo);
		
		//담아온 값을 상세페이지 화면으로 보내자
		// 가져온 값 부터 담고~
		request.setAttribute("m", m);
		// 상세페이지로 가버렷~
		request.getRequestDispatcher("views/admin/member/memberDetail.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
