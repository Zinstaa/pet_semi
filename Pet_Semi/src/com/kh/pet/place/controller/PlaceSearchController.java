package com.kh.pet.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        
        String placeName = request.getParameter("place-name");
		
		// 화면에 표시하기 이전 상태 => 테이블로부터 조회
        ArrayList<Place> list = new PlaceService().searchPlace(placeName);		

		request.setAttribute("list", list);

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
