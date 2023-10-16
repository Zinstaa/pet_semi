<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.pet.board.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("b");

	BoardFile bf = (BoardFile)request.getAttribute("bf");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
<style>
    #detail-area{
        border: 1px solid gray;
    }
    .outer1{
        width: 1200px;
		height: 750px;
        margin : auto;
        background-color: #fff5ce;
        margin-top: 5px;
        color: black;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer1">
        <br>
        <h2 align="center">일반게시글 상세보기</h2>
        <br><br>

        <table id="detail-area" align="center" border="1">
            <tr>
                <th width="100">제목</th>
                <td colspan=5><%= b.getBoardName() %></td>
            </tr>
            <tr>
                <th width="100">작성자</th>
                <td width="100"><%= b.getMemberNo() %></td>
                <th width="100">등록일</th>
                <td width="100"><%= b.getBoardDate() %></td>
                <th width="100">조회수</th>
                <td width="100"><%= b.getBoardView() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="5">
                    <p style="height: 400px;"><%= b.getBoardContent() %></p>
                </td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="5">
                	<%if(bf ==  null) { %>
                    <!-- 첨부파일이 존재하지 않습니다. -->
						첨부파일이 존재하지 않습니다.
					<% } else { %>
                    <!-- 첨부파일 다운로드 -->
                    	<a href="<%= contextPath%>/<%= bf.getBoardfilePath() %>/<%= bf.getBoardFileChangeName() %>" download><%= bf.getBoardFileOriginName() %></a>
                    <% } %>
                </td>
            </tr>
        </table>

        <br>

        <div align="center">
            <a href="<%= contextPath%>/list.bo?cpage=1" class="btn btn-primary">목록으로 돌아가기</a>
            
            <% if(loginUser != null && loginUser.getMemberId().equals(b.getMemberNo())) { %>
            <a href="<%= contextPath %>/updateForm.bo?bno=<%= b.getBoardNo() %>" class="btn btn-warning">수정</a>
            <a href="<%= contextPath %>/delete.bo?bno=<%= b.getBoardNo() %>" class="btn btn-danger">삭제</a>
            <% } %>
        </div>

    </div>
    <div id="boardReview-area">
    
		<table align="center">
			<thead>
					<tr>
					<th>댓글</th>			
					</tr>
					<tr>
					<%if(loginUser != null) { %>
						<td colspan="2">
							<textarea id="boardReviewContent" cols="50" rows="2" style="resize:none;"></textarea>
						</td>
						<td><button onclick="insertBoardReview();">댓글작성</button></td>
						<% } else { %>
						<td>
    						<textarea readonly cols="50" rows="3" style="resize:none;">로그인 후 이용가능 합니다.</textarea>
    					</td>
    					<td><button>댓글작성</button></td>
						<% } %>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
		
    </div>
    
    <script>
    	
    	function selectBoardReviewList() {
    		
    		$.ajax({
    			url : 'rlist.do',
    			data : {bno : <%= b.getBoardNo() %>},
    			success : function(result) {
    				console.log(result);
    				
    				let resultStr = '';
    				for(let i in result){
    					
    					resultStr += '<tr>'
    							  +  '<td>' + result[i].boardReviewWriter + '</td>'
    							  +  '<td>' + result[i].boardReviewContent + '</td>'
    							  +  '<td>' + result[i].boardReviewDate + '</td>'
    							  +  '</tr>'
    				}
    				
    				$('#boardReview-area tbody').html(resultStr);
    			},
    			error : function(){
    				console.log("댓글을 읽어오지 못했습니다.");
    			}
    		
    		
    		})
    		
    	};
    	
    	$(function(){
    		selectBoardReviewList();
    		
    		setInterval(selectBoardReviewList, 1000);
    	});
    	
    	function insertBoardReview(){
    		$.ajax({
    			url : 'rinsert.do',
    			type : 'post',
    			data : {
    				bno : <%= b.getBoardNo()%>,
    				content : $('#boardReviewContent').val()
    			},
    			success : function(result){
    				
    				if(result > 0) {
    					$('BoardReviewContent').val('');
    					
    					selectBoardReviewList();
    				};
    			},
    			error : function(){
    				console.log('실패');
    			}
    		})
    		
    	}
    
    </script>
	
	
</body>
</html>