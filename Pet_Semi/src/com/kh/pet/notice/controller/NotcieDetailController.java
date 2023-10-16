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
		
		//기존같으면 Notice로 받아 올테지만 이전글번호, 다음글 번호의 int 변수값이 있기 때문에 hashmap을 담아왔다.
		HashMap<String, Object> map = new NoticeService().selectNotice(noticeNo);
		//파일 첨부도 하기 때문에 해당 파일 첨부 정보도 가져온다.
		NoticeFile nf = new NoticeService().selectNoticeFile(noticeNo);
		
		
		//jsp에서 hashmap값 활용이 어렵기 때문에 여기서 풀고 넘겨준다.
		Notice n = (Notice)map.get("n");
		
		
		//System.out.println(map.get("nextNo"));
		//hashmap에 int값이 남아있기 때문에 hashmap도 같이 넘겨준다.
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
