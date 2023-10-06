package com.kh.pet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.member.model.service.MemberService;

/**
 * Servlet implementation class MemberStatusController
 */
@WebServlet("/status.me")
public class MemberStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberStatusController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checked = request.getParameter("status");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(checked);
		System.out.println(no);
		String us = "";
		if(checked.equals("true")) {
			us = "S";
		}else {
			us = "U";
		}
		System.out.println(us);
		
		int result = new MemberService().memberStatus(no, us);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
