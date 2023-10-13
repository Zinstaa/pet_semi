package com.kh.pet.notice.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.notice.service.NoticeService;
import com.kh.pet.notice.vo.Notice;
import com.kh.pet.notice.vo.NoticeFile;

/**
 * Servlet implementation class NotcieDetailController
 */
@WebServlet("/detail.no")
public class NotcieDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotcieDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		 HashMap<String, Object> map = new NoticeService().selectNotice(noticeNo);
		NoticeFile nf = new NoticeService().selectNoticeFile(noticeNo);
		
		
		
		Notice n = (Notice)map.get("n");
		
		
		System.out.println(map.get("nextNo"));
		request.setAttribute("map", map);
		request.setAttribute("n", n);
		request.setAttribute("nf", nf);
		request.getRequestDispatcher("views/notice/noticeDetailView.jsp").forward(request, response);
		//System.out.println(n.getNoticeDate());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
