package com.kh.pet.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.pet.board.model.service.BoardService;
import com.kh.pet.board.model.vo.Board;
import com.kh.pet.board.model.vo.BoardFile;
import com.kh.pet.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String name = multiRequest.getParameter("name");
			String content = multiRequest.getParameter("content");
			int boardNo = Integer.parseInt(multiRequest.getParameter("boardNo"));
			
			
			Board b = new Board();
			b.setBoardName(name);
			b.setBoardContent(content);
			b.setBoardNo(boardNo);
			
			BoardFile bf = null;
			
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				
				
				bf = new BoardFile();
				bf.setBoardFileOriginName(multiRequest.getOriginalFileName("reUpfile"));
				bf.setBoardFileChangeName(multiRequest.getFilesystemName("reUpfile"));
				bf.setBoardfilePath("resources/board_upfiles");
				
				if(multiRequest.getParameter("originBoardFileNo") != null) {
					
					bf.setBoardFileNo(Integer.parseInt(multiRequest.getParameter("originBoardFileNo")));
					
					new File(savePath + multiRequest.getParameter("originBoardFileName")).delete();
					
					
					
				} else {
					
					bf.setBoardNo(boardNo);
					
				}
				
				
			}
			
			int result = new BoardService().updateBoard(b, bf);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 수정에 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.bo?bno=" + boardNo);
			} else {
				request.setAttribute("errorMsg", "게시글 수정에 실패했습니다.");
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
