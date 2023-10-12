package com.kh.pet.promotionBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.promotionBoard.model.service.PromotionBoardService;
import com.kh.pet.promotionBoard.model.vo.PromotionBoard;

/**
 * Servlet implementation class promotionBoardListController
 */
@WebServlet("/promotionList.pr")
public class promotionBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @return 
     * @see HttpServlet#HttpServlet()
     */
    public promotionBoardListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// promotionBoard 따로 promotionFile 따로 들고 간다 
		// 화면을 띄우기 전에 => 테이블로부터 조회
		ArrayList<PromotionBoard> list = new PromotionBoardService().selectPromotionBoardList(); // 바로 서비스로 넘어가자~

		request.getRequestDispatcher("views/promotionBoard/promotionBoardListView.jsp").forward(request, response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


