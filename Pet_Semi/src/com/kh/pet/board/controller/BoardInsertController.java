package com.kh.pet.board.controller;

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

import com.kh.pet.board.model.service.BoardService;
import com.kh.pet.board.model.vo.Board;
import com.kh.pet.board.model.vo.BoardFile;
import com.kh.pet.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
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
			
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			String savePath= application.getRealPath("/resources/board_upfiles/");
			
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize, "UTF-8",
										 new MyFileRenamePolicy());
			
			String name = multiRequest.getParameter("name");
			String content = multiRequest.getParameter("content");
			String memberNo = multiRequest.getParameter("memberNo");
			
			Board b = new Board();
			b.setBoardName(name);
			b.setBoardContent(content);
			b.setMemberNo(memberNo);
			
			BoardFile bf = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				bf = new BoardFile();
				
				bf.setBoardFileOriginName(multiRequest.getOriginalFileName("upfile"));
				
				bf.setBoardfilePath("resources/board_upfiles");
				
				bf.setBoardFileChangeName(multiRequest.getFilesystemName("upfile"));
			}
			
			int result = new BoardService().insertBoard(b, bf);
			
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
			} else {
				
				if(bf != null) {
					new File(savePath + bf.getBoardFileChangeName()).delete();
				}
				
				request.setAttribute("errorMsg", "게시글 작성에 실패했습니다.");
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
