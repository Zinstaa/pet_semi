<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.board.model.vo.Board, com.kh.pet.common.model.PageInfo" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	String boardName = (String)session.getAttribute("boardName");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색이당</title>
</head>
<style>
	.outer1{
        width: 1200px;
		height: 750px;
        margin : auto;
		padding-top: 125px;
        background-color: #fff5ce;
        color: black;
    }
    
    .list-area{
        text-align: center;
        border: 1px solid gray;
    }

    .list-area>tbody>tr:hover{
        cursor: pointer;
        background-color: lightgray;
    }
	
</style>
	
<body>

	<%@ include file = "../common/menubar.jsp" %>
	
	<div class="outer1">
		
		<table class="list-area" align="center">
			<thead>
				<tr>
					<th width="100">글번호</th>
					<th width="500">제목</th>
					<th width="100">작성자</th>
					<th width="100">조회수</th>
					<th width="200">작성일</th>
				</tr>
			</thead>
			<tbody>
			
				<% if(list.isEmpty()) { %>
				<tr>
					<td colspan="5">조회된 게시글이 없습니다.</td>
				</tr>
				<% } else { %>
				
					<% for(Board b : list) { %>
					<tr>
						<td><%= b.getBoardNo() %></td>
						<td><%= b.getBoardName() %></td>
						<td><%= b.getMemberNo() %></td>
						<td><%= b.getBoardView() %></td>
						<td><%= b.getBoardDate() %></td>
					</tr>
					<% } %>
				<% } %>
			</tbody>
		</table>

		<script>

			$(function() {

				$('.list-area > tbody > tr').click(function(){

					location.href = '<%=contextPath%>/detail.bo?bno=' + $(this).children().eq(0).text();

				});

			})

		</script>
		
		<div class="paging-area" align="center">
			<%if(currentPage != 1) { %>
			<button onclick="location.href='<%= contextPath %>/search.bo?cpage=<%= currentPage - 1 %>'" class="btn btn-outline-secondary">&lt;</button>
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++) { %>
				<%if(currentPage != i) { %>
				<button onclick="location.href='<%= contextPath %>/search.bo?cpage=<%=i %>'" class="btn btn-outline-secondary"><%= i %></button>
				<% } else { %>
					<button disabled class="btn btn-outline-secondary"><%= i %></button>
				<% } %>
			<% } %>
			<%if(currentPage < maxPage) { %>
				<button onclick="location.href='<%= contextPath %>/search.bo?cpage=<%= currentPage + 1 %>'" class="btn btn-outline-secondary">&gt;</button>
			<% } %>
			
			
		</div>

		<br><br><br><br>
	</div>
	
	<%@ include file = "../common/footer.jsp" %>

</body>
</html>