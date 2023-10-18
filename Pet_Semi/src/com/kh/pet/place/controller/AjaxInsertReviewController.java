package com.kh.pet.place.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.member.model.vo.Member;
import com.kh.pet.place.model.service.PlaceService;
import com.kh.pet.place.model.vo.PlaceReview;

/**
 * Servlet implementation class AjaxInsertReviewController
 */
@WebServlet("/pinsert.pl")
public class AjaxInsertReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int placeNo = Integer.parseInt(request.getParameter("pno"));
		String placeReviewContent = request.getParameter("content");
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		PlaceReview pr = new PlaceReview();
		pr.setPlaceNo(placeNo);
		pr.setPlaceReviewContent(placeReviewContent);
		pr.setPlaceReviewWriter(String.valueOf(memberNo));
		
		int result = new PlaceService().insertPlaceReview(pr);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
