package com.kh.pet.notice.controller;

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
import com.kh.pet.notice.service.NoticeService;
import com.kh.pet.notice.vo.Notice;
import com.kh.pet.notice.vo.NoticeFile;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
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
			String savePath = application.getRealPath("/resources/notice_upfiles");
			
			// 서버업로드 작업
			// 파일을 업로드한다, 업로드파일이 저장된 경로지정, 업로드 최대크기, 파일 인코딩, 파일 업로드시 새로운 파일 이름 정책 설정
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//값 뽑자
			String memberNo = multiRequest.getParameter("memberNo");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			//가공
			Notice n = new Notice();
			n.setMemberNo(memberNo);
			n.setNoticeTitle(title);
			n.setNoticeContent(content);
			
			//파일 insert 세팅
			NoticeFile nf = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				nf = new NoticeFile();
				nf.setNoticeFileOriginName(multiRequest.getOriginalFileName("upfile"));
				
				// 파일 경로
				nf.setNoticeFilePath("/resources/notice_upfiles");
				
				//t수정된 파일명
				nf.setNoticeFileChangeName(multiRequest.getFilesystemName("upfile"));
			}
			
			int result = new NoticeService().insertNotice(n, nf);
			
			//응답뷰 지정
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 등록 성공");
				response.sendRedirect(request.getContextPath()+"/list.no?cpage=1");
			}else {
				if(nf != null) { //저장된 파일 삭제하기
					new File(savePath + nf.getNoticeFileChangeName()).delete();
				}
				request.setAttribute("errorMsg","게시글 작성 실패");
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
