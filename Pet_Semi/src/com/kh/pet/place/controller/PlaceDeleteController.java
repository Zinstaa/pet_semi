package com.kh.pet.place.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.pet.place.model.service.PlaceService;

/**
 * Servlet implementation class PlaceDeleteController
 */
@WebServlet("/deleteForm.pl")
public class PlaceDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int placeNo = Integer.parseInt(request.getParameter("pno"));
		
		int result = new PlaceService().deletePlace(placeNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글이 삭제되었습니다!");
			response.sendRedirect(request.getContextPath() + "/place.pl?ppage=1");
		} else {
			request.getSession().setAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
