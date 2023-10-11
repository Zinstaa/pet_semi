package com.kh.pet.promotionBoard.controller;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.kh.pet.promotionBoard.model.service.PromotionBoardService;
import com.kh.pet.promotionBoard.model.vo.PromotionBoard;
import com.kh.pet.promotionBoard.model.vo.PromotionFile;
import com.kh.pet.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class promotionBoardInsertController
 */
@WebServlet("/promotionInsert.pr")
public class promotionBoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletRequest multiRequest;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public promotionBoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식 -> 인코딩 한글로 되어있는거 
		// 인코딩 
		request.setCharacterEncoding("UTF-8");
		
		// 첨부파일 => multipart/form-data => 조건제시 => 서버로 파일을 올려줌 , 현재는 cos.jar 쓸거고 나중엔 다른거 쓸 예정
		if(ServletFileUpload.isMultipartContent(request)) { // 무조건 하나는 있는 상태에서 시작~ 
			// 1) MultipartRequest 객체 생성 
			// 1_1. 전송 용량 제한(10Mbyte)
			int maxSize = 1024 * 1024 * 10;

			// 1_2. 저장경로 구해야함
			String savePath = request.getServletContext().getRealPath("/resources/promotion_upfiles/");

			// 2 . MultipartRequest 생성하면서 파일이름을 수정하면서 업로드! 
			MultipartRequest multiRequest =
			new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			// 2) multiRequest로부터 값 봅기 => getParameter 메소드 이용
			String promotionTitle = multiRequest.getParameter("title");
			String promotionContent = multiRequest.getParameter("content");
			String agentNo = multiRequest.getParameter("agentNo");

			// 3) VO로 가공
			// PROMOTIONBOARD
			PromotionBoard pb = new PromotionBoard();
			pb.setPromotionTitle(promotionTitle);
			pb.setPromotionContent(promotionContent);
			pb.setPromotionWriter(agentNo);

			// => 최소한 게시글 한개당 한개의 첨부파일 존재! 무조건!
			// 여러개의 VO를 묶어서 ... -> ArrayList를 쓰면 어떨까? 
			ArrayList<PromotionFile> list = new ArrayList();

			// 키값 : file1 ~ file4 

			for(int i = 1; i <= 4; i++) {
				// 키값만 미리 변수로 빼놓는 작업
				String key = "file" + i;

				// 현재 반복하고 있는 키값으로 파일을 업로드했는지 파악!! 
				if(multiRequest.getOriginalFileName(key) != null) { // 파일이 존재함 

					// 첨부파일이 존재 => PromotionFile 객체 생성 
					// 필드 : 원본명, 수정명, 파일경로
					PromotionFile pf = new PromotionFile();
					pf.setPromotionFileOriginName(multiRequest.getOriginalFileName(key)); // 원본명
					pf.setPromotionFileChangeName(multiRequest.getFilesystemName(key)); // 수정명
					pf.setPromotionFilePath("resources/promotion_upfiles");

					// 파일레벨 
					if(i == 1){
						// 대표이미지는 키값이 file1이라구요 그래서 i가 1
						pf.setPromotionFileLevel(1);
					} else {
						pf.setPromotionFileLevel(2);
						// 아닌 친구들은 다 2 넣어줌
					}

					list.add(pf); // 만들어진 promotionFile를 list의 요소로 넣어줄거임
				
				}
			}

			// 4) 서비스요청 
			int result = new PromotionBoardService().insertPromotionBoard(pb, list);
			
			// 5) 결과에 따른 응답뷰 지정 
			if(result > 0) { // 성공 => list.th로 요청
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공~~");
				response.sendRedirect(request.getContextPath() + "/promotionList.pr");
			} else {
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}


		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
