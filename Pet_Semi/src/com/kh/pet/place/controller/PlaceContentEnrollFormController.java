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
import com.kh.pet.place.model.vo.PlaceCategory;

/**
 * Servlet implementation class PlaceContentEnrollFormController
 */
@WebServlet("/enrollForm.pl")
public class PlaceContentEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceContentEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<PlaceCategory> pllist = new PlaceService().selectPlaceCategoryList();
		ArrayList<LocalCategory> lolist = new PlaceService().selectLoaclCategoryList();
		
		request.setAttribute("pllist", pllist);
		request.setAttribute("lolist", lolist);
		
		request.getRequestDispatcher("views/place/placeContentEnrollForm.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

