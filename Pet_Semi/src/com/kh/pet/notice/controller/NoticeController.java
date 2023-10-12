package com.kh.pet.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.common.model.PageInfo;
import com.kh.pet.notice.service.NoticeService;
import com.kh.pet.notice.vo.Notice;

/**
 * Servlet implementation class NoticeController
 */
@WebServlet("/list.no")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이징 바 처리를 위한 작업
		 int listCount; //현재 일반게시판의 게시글 총 갯수 =>테이블에서 COUNT(*)활용(STATUS='Y') 해서 조회
		 int currentPage; // 현재 페이지(사용자가 요청한 페이지) => request.getParameter("cpage")
		 int pageLimit; // 한 페이지에 보여질 페이징 버튼의 최대 갯수 => 5개로 고정
		 int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 =>10개 고정
		
		 int maxPage; //가장 마지막 페이지가 몇번 페이지인지 (총페이지 갯수)
		 int startPage; //페이지 하단에 보여질 페이징바의 시작수
		 int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		 
		 // listCount : 총 게시글의 갯수
		listCount = new NoticeService().selectListCount();
		
		// currentPage : 현재 페이지(사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// pageLimit : 페이징바 최대갯수
		pageLimit = 5;
		// boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
		boardLimit = 10;
		// maxPage : 가장 마지막 페이지가 몇번 페이지인지 (총 페이지 갯수) 
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		// startPage : 페이지 하단에 보여질 페이징바의 시작수
		startPage = (currentPage -1) / pageLimit * pageLimit +1;
		// endPage : 페이지 하단에 보여질 페이징바의 끝 수
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 공지사항 리스트 받아오기
		ArrayList<Notice> list = new NoticeService().selectList(pi);
		
		//화면에 보여주게 보내주자
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/notice/noticeListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
