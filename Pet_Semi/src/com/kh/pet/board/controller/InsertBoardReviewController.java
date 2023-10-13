package com.kh.pet.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.board.model.service.BoardService;
import com.kh.pet.board.model.vo.BoardReview;
import com.kh.pet.member.model.vo.Member;

/**
 * Servlet implementation class InsertBoardReviewController
 */
@WebServlet("/rinsert.do")
public class InsertBoardReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		String boardReviewContent = request.getParameter("content");
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		BoardReview b = new BoardReview();
		b.setBoardNo(boardNo);
		b.setBoardReviewContent(boardReviewContent);
		b.setBoardReviewWriter(String.valueOf(memberNo));
		
		int result = new BoardService().insertBoardReview(b);
		
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
