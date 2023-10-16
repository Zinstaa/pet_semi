package com.kh.pet.place.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.pet.common.MyFileRenamePolicy;
import com.kh.pet.place.model.service.PlaceService;
import com.kh.pet.place.model.vo.LocalCategory;
import com.kh.pet.place.model.vo.Place;
import com.kh.pet.place.model.vo.PlaceCategory;
import com.kh.pet.place.model.vo.PlaceFile;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PlaceContentInsertController
 */
@WebServlet("/insert.pl")
public class PlaceContentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceContentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getServletContext().getRealPath("resources/place_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			String placeCategory = multiRequest.getParameter("pl-category");
			String placeLocal = multiRequest.getParameter("pl-place");
			String placeName = multiRequest.getParameter("pl-name");
			String placeAddress = multiRequest.getParameter("pl-address");
			String placePhone = multiRequest.getParameter("pl-phone");
			String placeTimes = multiRequest.getParameter("pl-time");
			String placeUrl = multiRequest.getParameter("pl-url");
			String placeInfo = multiRequest.getParameter("pl-info");
			String placeAround = multiRequest.getParameter("pl-around");
			String placePrice = multiRequest.getParameter("pl-price");
			String placeCaution = multiRequest.getParameter("pl-caution");
			String placeMap = multiRequest.getParameter("pl-map");
			String userNo = multiRequest.getParameter("memberNo");
			
			Place p = new Place();
			p.setPlaceCategory(placeCategory);
			p.setLocalCategory(placeLocal);
			p.setPlaceName(placeName);
			p.setPlaceAddress(placeAddress);
			p.setPlacePhone(placePhone);
			p.setPlaceTimes(placeTimes);
			p.setPlaceUrl(placeUrl);
			p.setPlaceInfo(placeInfo);
			p.setPlaceAround(placeAround);
			p.setPlacePrice(placePrice);
			p.setPlaceCaution(placeCaution);
			p.setPlaceMap(placeMap);
			p.setMemberNo(userNo);
	
			ArrayList<PlaceFile> list = new ArrayList();
			
			for(int i = 1; i <= 5; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					PlaceFile pl = new PlaceFile();
					pl.setPlaceFileOriginName(multiRequest.getOriginalFileName(key));
					pl.setPlaceFileChangeName(multiRequest.getFilesystemName(key));
					pl.setPlaceFilePath("resources/place_upfiles/");
					
					if(i == 1) {
						pl.setPlaceFileLevel(1);
					} else {
						pl.setPlaceFileLevel(2);
					}
					
					list.add(pl);
				}
			}
			
			int result = new PlaceService().insertPlaceContent(p, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMs	g", "게시글 작성 성공 ~ !");
				response.sendRedirect(request.getContextPath() + "/place.pl?ppage=1");
			} else {
				if(list != null) {
					for(int i = 0; i < list.size(); i++) {
						new File(savePath + list.get(i).getPlaceFileChangeName()).delete();
					}
				}
				
				request.getSession().setAttribute("errorMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		
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
