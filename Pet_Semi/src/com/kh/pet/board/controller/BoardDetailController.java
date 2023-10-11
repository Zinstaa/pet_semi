package com.kh.pet.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.board.model.service.BoardService;
import com.kh.pet.board.model.vo.Board;
import com.kh.pet.board.model.vo.BoardFile;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		BoardService boardService = new BoardService();
		
		int result = boardService.increaseCount(boardNo);
		
		if(result > 0) {
			
			Board b = boardService.selectBoard(boardNo);
			
			BoardFile bf = boardService.selectBoardFile(boardNo);
			
			request.setAttribute("b", b);
			request.setAttribute("bf", bf);
			
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			
		} else {
			request.setAttribute("errorMsg", "게시글 조회에 실패했습니다.");
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
