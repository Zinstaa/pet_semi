package com.kh.pet.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.pet.place.model.service.PlaceService;
import com.kh.pet.place.model.vo.LocalCategory;
import com.kh.pet.place.model.vo.Place;
import com.kh.pet.place.model.vo.PlaceCategory;
import com.kh.pet.place.model.vo.PlacePageInfo;

/**
 * Servlet implementation class PlaceSearchController
 */
@WebServlet("/search.pl")
public class PlaceSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceSearchController() {
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
		int placeLimit;
		  
		int maxPage; 
		int startPage;
		int endPage;
		
		String placeName = request.getParameter("place-name");
		
		listCount = new PlaceService().selectSearchListCount(placeName);
		
		currentPage = Integer.parseInt(request.getParameter("ppage"));
		
		pageLimit = 10;
		
		placeLimit = 12;
		
		maxPage = (int)Math.ceil((double)listCount / placeLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PlacePageInfo ppi = new PlacePageInfo(listCount, currentPage, pageLimit,
				placeLimit, maxPage, startPage, endPage);
		
		// 화면에 표시하기 이전 상태 => 테이블로부터 조회
        ArrayList<Place> list = new PlaceService().searchPlace(placeName, ppi);		
        // 사용자가 입력한 값을 세션에 저장
        if (placeName != null) {
            HttpSession session = request.getSession();
            session.setAttribute("placeName", placeName);
            session.setAttribute("list", list);
        }
        request.setAttribute("list", list);
        request.setAttribute("ppi", ppi);
        
        request.getRequestDispatcher("views/place/placeSearchPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

