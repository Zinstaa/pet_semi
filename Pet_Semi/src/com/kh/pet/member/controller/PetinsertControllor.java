package com.kh.pet.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.pet.common.MyFileRenamePolicy;
import com.kh.pet.member.model.service.MemberService;
import com.kh.pet.member.model.vo.Dog;
import com.kh.pet.member.model.vo.MemberFile;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PetinsertControllor
 */
@WebServlet("/insertPet.me")
public class PetinsertControllor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetinsertControllor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("UTF-8");
		// 파일 업로드 위해 라이브러리 필요(http://www.servlets.com)
		// 파일업로드를 위한 라이브러리 명 : cos.jar(com.oreilly.servlet의 약자)
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			//파일 저장 경로 지정
			String savePath = application.getRealPath("/resources/member_upfiles");
			
			// 서버업로드 작업
			// 파일을 업로드한다, 업로드파일이 저장된 경로지정, 업로드 최대크기, 파일 인코딩, 파일 업로드시 새로운 파일 이름 정책 설정
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//값 뽑기
			String memberNo = multiRequest.getParameter("memberNo");
			String dogName = multiRequest.getParameter("dogName");
			String dogKind = multiRequest.getParameter("dogKind");
			String dogAge = multiRequest.getParameter("dogAge");
			
			Dog d=  new Dog();
			d.setMemberNo(memberNo);
			d.setDogName(dogName);
			d.setDogKind(dogKind);
			d.setDogAge(dogAge);
			//파일 insert 세팅
			MemberFile mf = null;
			
			if(multiRequest.getOriginalFileName("dogfile") != null) {
				mf = new MemberFile();
				mf.setMemberFileOriginName(multiRequest.getOriginalFileName("dogfile"));
				
				// 파일 경로
				mf.setMemberFilePath("/resources/member_upfiles");
				
				//수정된 파일명
				mf.setMemberFileChangeName(multiRequest.getFilesystemName("dogfile"));
			}
			
			int result = new MemberService().insertDog(d, mf);
			System.out.println(result);
			
			//응답뷰 지정
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "강쥐 등록 성공");
				response.sendRedirect(request.getContextPath()+"/mypage.me");
			}else {
				if(mf != null) 
					new File(savePath + mf.getMemberFileChangeName()).delete();
				request.getSession().setAttribute("alertMsg", "강쥐 등록 실패");
				response.sendRedirect(request.getContextPath()+"/mypage.me");
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
