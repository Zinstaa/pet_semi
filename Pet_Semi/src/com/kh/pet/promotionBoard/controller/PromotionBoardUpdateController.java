package com.kh.pet.promotionBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.pet.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PromotionBoardUpdateController
 */
@WebServlet("/promotionUpdate.pr")
public class PromotionBoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromotionBoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 해줘야됨
		request.setCharacterEncoding("UTF-8");
		
		// 값뽑기 해줘야되는데...  그전에 사진게시판도 파일용량 제한을 해둬야될지? 고민스러움 -> 기존 수업시간에 했던데로 한번해보기 
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1. 전송파일 용량 제한 
			int maxSize = 1024 * 1024 * 10;
			// 경로지정 , 저장지정 정해주기
			String savePath = request.getSession().getServletContext().getRealPath("/resources/promotion_upfiles");
			
			
			// MultipartRequest 객체 생성후 파일이 서버에 업로드됨
			// MultipartRequest 객체 생성
			// -> 객체가 생성되는 순간에,
			// -> request, 파일경로 지정, 최대파일 크기지정
			// -> 문자 인코딩 지정
			// -> 변경된 파일명으로 지정된 경로로 파일이 지정된다. 
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			// -----> 파일업로드완료
			
			// Board Update 단
			// 지금 단계, 값뽑기 request => MultiRequest
			
			String title = multiRequest.getParameter("title");
			String eventDate = multiRequest.getParameter("eventDate");
			
			
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
