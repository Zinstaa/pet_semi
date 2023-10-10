package com.kh.pet.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.pet.member.model.service.MemberService;
import com.kh.pet.member.model.vo.Member;

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
		

				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				
				System.out.println(email);
				System.out.println(phone);
				
				ArrayList<Member> list = new MemberService().findId(email, phone);
				
				
				// GSON : Google JSON 라이브러리
				// 형식, 인코딩 지정
				response.setContentType("application/json; charset=UTF-8");
				//gson객체 생성 응답 보내기
				new Gson().toJson(list,response.getWriter());
				//-> list라는 객체를 response.getWriter()라는 통로로 응답하겠다.
				
				RequestDispatcher view = request.getRequestDispatcher("views/member/findid.jsp");
				view.forward(request, response);
				
				
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
