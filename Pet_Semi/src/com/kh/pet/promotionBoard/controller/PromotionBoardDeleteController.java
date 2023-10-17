package com.kh.pet.promotionBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.promotionBoard.model.service.PromotionBoardService;

/**
 * Servlet implementation class PromotionBoardDeleteController
 */
@WebServlet("/promotionDelete.pr")
public class PromotionBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromotionBoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int promotionNo = Integer.parseInt(request.getParameter("pno"));
		int result = new PromotionBoardService().deletPromotionBoard(promotionNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 삭제 성공했네?");
			response.sendRedirect(request.getContextPath() + "/promotionList.pr?cpage=1");
		} else {
			request.getSession().setAttribute("errorMsg", "게시글 삭제에 실패했네?");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
