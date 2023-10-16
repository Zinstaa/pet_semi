package com.kh.pet.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.pet.common.MyFileRenamePolicy;
import com.kh.pet.notice.service.NoticeService;
import com.kh.pet.notice.vo.Notice;
import com.kh.pet.notice.vo.NoticeFile;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/update.no")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//전송이 잘 되었을 때만 내용 수정
		if(ServletFileUpload.isMultipartContent(request)) {
			//파일 업로드 전 두가지 사항 설정 필요
			//용량제한
			int maxSize = 1024 * 1024 *10;
			//파일 저장할 물리적 경로 확인
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles");
			//전달된 파일명 수정 후 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//파일 업로드완료
			
			//값 뽑기
			int noticeNo = Integer.parseInt(multiRequest.getParameter("noticeNo"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			//가공
			
			Notice n = new Notice();
			n.setNoticeNo(noticeNo);
			n.setNoticeTitle(title);
			n.setNoticeContent(content);
			
			//첨부파일 작업 시작
			
			NoticeFile nf = null;
			
			if(multiRequest.getOriginalFileName("reUpfile")!=null) {
				//새로운 파일명이 존재한다면?
				nf = new NoticeFile();
				nf.setNoticeFileOriginName(multiRequest.getOriginalFileName("reUpfile"));
				nf.setNoticeFileChangeName(multiRequest.getFilesystemName("reUpfile"));
				nf.setNoticeFilePath("resources/notice_upfiles");
				
				//첨부파일 있고 원본파일이 있을 경우 => 원본파일 번호가 필요함
				if(multiRequest.getParameter("originFileNo") != null) {
					//기존 파일이 존재한다면
					//기존 파일이 가지고 있는 FileNo를 nf에 담고
					nf.setNoticeFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					//기존 존재하던 첨부파일 삭제
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
					
				} else {
					//새로운 첨부파일은 이는데 기존 파일은 없을 경우 => insert
					//어떤 게시글에 첨부할것인가?
					nf.setNoticeNo(noticeNo);
				}
				
			}
			// case 1 : 새로운 첨부파일 X => b => BOARD UPDATE
			// case 2 : 새로운 첨부파일 O , 기존 첨부파일 O => b => BOARD UPDATE + at => ATTACHMENT UPDATE
			// case 3 : 새로운 첨부파일 O , 기존 첨부파일 X => b => BOARD UPDATE + at => ATTACHMENT INSERT
			// 경우에 따라서 모두 한개의 트갠잭션으로 묶어서 처리해야함.
			
			new NoticeService().updateNotice(n, nf);
			
				
		
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
