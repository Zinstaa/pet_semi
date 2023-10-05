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
     * @see HttpServlet#HttpServlet()
     */
    public promotionBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		ArrayList<PromotionBoard> list = new PromotionBoardService().selectPromotionList();
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/board/promotionBoardListView.jsp").forward(request, response);
		*/
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
