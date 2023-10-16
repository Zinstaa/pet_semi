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
import com.kh.pet.promotionBoard.model.vo.PromotionFile;

/**
 * Servlet implementation class promotionBoardDetailController
 */
@WebServlet("/promotionDetail.pr")
public class promotionBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public promotionBoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 작업은 필요할까? 아니지~ 왜? DB로부터 조회해올거니까~~
		// 글번호 뽑기 
		int promotionNo = Integer.parseInt(request.getParameter("pno"));
		
		//System.out.println("pno");

		// 가공 -> X 

		// 서비스로 요청하기 
		// 1. 조회수 증가 요청 작업
		int result = new PromotionBoardService().increasePromotionView(promotionNo);

		// 2. 1번 성공시 PromotionBoard에서 조회요청, PromotionFile에서도 조회요청 
		if(result > 0) {
			
			// PromotionBoard테이블 조회 요청
			PromotionBoard pb = new PromotionBoardService().selectPromotionBoard(promotionNo);
			System.out.println("pb");
			
			// 기존에 만든 selectPromotionBoard()를 호출해서 재활용하려 했더니 null값 나옴
			
			// PromotionFile 에서도 조회를 해야 함 
			ArrayList<PromotionFile> list = new PromotionBoardService().selectPromotionFileList(promotionNo);
			
			// 요청 결과를 attribute 영역에 담는 단계
			request.setAttribute("pb",pb);
			request.setAttribute("list", list);
			
			// 응답 view 지정단계 
			request.getRequestDispatcher("views/promotionBoard/promotionBoardDetailView.jsp").forward(request, response);
			
			

			

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
