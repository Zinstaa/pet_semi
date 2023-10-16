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
 * Servlet implementation class NoticeUpdateForm
 */
@WebServlet("/updateForm.no")
public class NoticeUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글번호 뽑기
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		//기존에 작성한 notice 테이블 조회하기
		HashMap<String, Object> map = new NoticeService().selectNotice(noticeNo);
		NoticeFile nf = new NoticeService().selectNoticeFile(noticeNo);
		
		//map에 담겨있던 Notice 뽑아내기
		Notice n = (Notice)map.get("n");
		
		//map 보낼 필요없어 Notice랑 NoticeFile만 보낸다.
		request.setAttribute("n", n);
		request.setAttribute("nf", nf);
		
		//화면 띄우기
		request.getRequestDispatcher("views/notice/noticeUpdateFormView.jsp").forward(request, response);
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
