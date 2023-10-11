package com.kh.pet.place.controller;

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
import com.kh.pet.place.model.vo.Place;
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
			
			int placeCategoryNo = 0;
			int placeLocalNo = 0;
			if(placeCategory.equals("식당")) {
				placeCategoryNo = 10;
			} 
			else if(placeCategory.equals("카페")) {
				placeCategoryNo = 11;
			}
			else if(placeCategory.equals("공원")) {
				placeCategoryNo = 12;
			}
			else if(placeCategory.equals("쇼핑")) {
				placeCategoryNo = 13;
			}
			else if(placeCategory.equals("병원")) {
				placeCategoryNo = 14;
			}
			
			if(placeLocal.equals("서울")) {
				placeLocalNo = 50;
			}
			else if(placeLocal.equals("경기")) {
				placeLocalNo = 51;
			}
			else if(placeLocal.equals("강원")) {
				placeLocalNo = 52;
			}
			else if(placeLocal.equals("충북")) {
				placeLocalNo = 53;
			}
			else if(placeLocal.equals("충남")) {
				placeLocalNo = 54;
			}
			else if(placeLocal.equals("경북")) {
				placeLocalNo = 55;
			}
			else if(placeLocal.equals("경남")) {
				placeLocalNo = 56;
			}
			else if(placeLocal.equals("전북")) {
				placeLocalNo = 57;
			}
			else if(placeLocal.equals("전남")) {
				placeLocalNo = 58;
			}
			else if(placeLocal.equals("제주")) {
				placeLocalNo = 59;
			}
			
			/*System.out.println(placeCategory);
			System.out.println(placeLocal);
			System.out.println(placeName);
			System.out.println(placeCategoryNo);
			System.out.println(placeLocalNo);
			System.out.println(placeAddress);
			System.out.println(placePhone);
			System.out.println(placeTimes);
			System.out.println(placeUrl);
			System.out.println(placeInfo);
			System.out.println(placeAround);
			System.out.println(placePrice);
			System.out.println(placeCaution);
			System.out.println(placeMap);
			System.out.println(userNo);*/
			
			
			Place p = new Place();
			p.setPlaceCategoryNo(placeCategoryNo);
			p.setLocalCategoryNo(placeLocalNo);
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
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공 ~ !");
				response.sendRedirect(request.getContextPath() + "/place.pl");
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
