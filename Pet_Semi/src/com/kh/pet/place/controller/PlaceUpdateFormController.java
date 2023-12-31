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
import com.kh.pet.place.model.vo.PlaceFile;

/**
 * Servlet implementation class PlaceUpdateFormController
 */
@WebServlet("/updateForm.pl")
public class PlaceUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int placeNo = Integer.parseInt(request.getParameter("pno"));
		
		Place p = new PlaceService().selectPlace(placeNo);
		ArrayList<PlaceFile> list = new PlaceService().selectPlaceFileList(placeNo);
		ArrayList<PlaceCategory> pllist = new PlaceService().selectPlaceCategoryList();
		ArrayList<LocalCategory> lolist = new PlaceService().selectLoaclCategoryList();
		
		request.setAttribute("p", p);
		request.setAttribute("list", list);
		request.setAttribute("pllist", pllist);
		request.setAttribute("lolist", lolist);
		
		request.getRequestDispatcher("views/place/placeUpdateForm.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
