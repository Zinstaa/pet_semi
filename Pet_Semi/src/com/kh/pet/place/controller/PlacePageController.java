package com.kh.pet.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.place.model.service.PlaceService;
import com.kh.pet.place.model.vo.Place;
import com.kh.pet.place.model.vo.PlacePageInfo;

/**
 * Servlet implementation class PlacePageController
 */
@WebServlet("/place.pl")
public class PlacePageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlacePageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount; 
		int currentPage;
		int pageLimit; 
		int placeLimit;
		  
		int maxPage; 
		int startPage;
		int endPage;
		
		listCount = new PlaceService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("ppage"));
		
		pageLimit = 10;
	      
        placeLimit = 9;
        
        maxPage = (int)Math.ceil((double)listCount / placeLimit);
        
        startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        
        endPage = startPage + pageLimit - 1;
        
        if(endPage > maxPage) {
            endPage = maxPage;
         }
        
        PlacePageInfo ppi = new PlacePageInfo(listCount, currentPage, pageLimit,
                placeLimit, maxPage, startPage, endPage);
		
		// 화면에 표시하기 이전 상태 => 테이블로부터 조회
		ArrayList<Place> list = new PlaceService().selectPlaceContentList(ppi);
		
		request.setAttribute("list", list);
		request.setAttribute("ppi", ppi);
		request.getRequestDispatcher("views/place/placePage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
