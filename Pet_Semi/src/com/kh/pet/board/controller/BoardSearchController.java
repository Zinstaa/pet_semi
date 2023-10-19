package com.kh.pet.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.pet.board.model.service.BoardService;
import com.kh.pet.board.model.vo.Board;
import com.kh.pet.common.model.PageInfo;

/**
 * Servlet implementation class BoardSearchController
 */
@WebServlet("/search.bo")
public class BoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		String boardName = request.getParameter("board-name");

		listCount = new BoardService().selectSearchListCount(boardName);
		
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 10;
		
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		
		startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 화면에 표시하기 이전 상태 => 테이블로부터 조회
        ArrayList<Board> list = new BoardService().searchBoard(boardName, pi);		
        // 사용자가 입력한 값을 세션에 저장
        if (boardName != null) {
            HttpSession session = request.getSession();
            session.setAttribute("boardName", boardName);
            session.setAttribute("list", list);
        }
        request.setAttribute("list", list);
        request.setAttribute("pi", pi);
        
        request.getRequestDispatcher("views/board/boardSearchPage.jsp").forward(request, response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
