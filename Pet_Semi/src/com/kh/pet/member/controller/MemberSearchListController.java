package com.kh.pet.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.pet.member.model.service.MemberService;
import com.kh.pet.member.model.vo.Member;


/**
 * Servlet implementation class MemberSearchListController
 */
@WebServlet("/search.me")
public class MemberSearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("gggg");
		//memberManagement에서 보내준 값을 뽑자
		//회원 검색을 하기 위한 필요값(검색조건, 검색어)
		String memberCondition = request.getParameter("memberCondition");
		String memberSearch = request.getParameter("memberSearch");
		
		//System.out.println(memberCondition);
		//System.out.println(memberSearch);
		
		//값이 두개이기 떄문에 굳이 가공없이 넘기자
		ArrayList<Member> list = new MemberService().searchMember(memberCondition, memberSearch);
		
		//JSONObject jObj = new JSONObject();
		
		// GSON : Google JSON 라이브러리
		// 형식, 인코딩 지정
		// 값을 여러개로 넘겨주기 위해서 ArrayList를 JSON 타입으로 변환 (ajax에서 success에서 결과값으로 쓰기 위해서)
		response.setContentType("application/json; charset=UTF-8");
		//gson객체 생성 응답 보내기
		new Gson().toJson(list,response.getWriter());
		//-> list라는 객체를 response.getWriter()라는 통로로 응답하겠다.
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
