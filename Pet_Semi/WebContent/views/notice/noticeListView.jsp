<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.common.model.PageInfo, com.kh.pet.notice.vo.Notice" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
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
<title>공지사항</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .outer1{
        width: 1200px;
		height: 750px;
        margin : auto;
		padding-top: 125px;
        background-color: #fff5ce;
        color: black;
    }
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	
    <div class="outer1">
		<h2 align="center">공지사항</h2>
		<br>

        <table class="list-area" align="center">
			<thead>
				<tr>
					<th width="100">글번호</th>
					<th width="500">제목</th>
					<th width="100">작성자</th>
					<th width="200">작성일</th>
				</tr>
			</thead>
			<tbody>
              <%if(list.isEmpty()) {%>
				<tr>
					<td colspan="4">공지사항이 없습니다.</td>
				</tr>
               	<%} else { %>
					<%for(Notice n : list) { %>
					<tr>
						<td><%=n.getNoticeNo() %></td>
						<td><%=n.getNoticeTitle() %></td>
						<td><%=n.getMemberNo() %></td>
						<td><%=n.getNoticeDate() %></td>
					</tr>
                 	<%} %>
                 <%} %>
			</tbody>
		</table>
		<br>
		
		<div align="right" style="width:1100px;">
		
				<a href="<%= contextPath %>/enrollForm.no" class="btn btn-sm btn-primary">글작성</a>
				<br><br>
          
		</div>
		
		<!--페이징바-->
		<div class="paging-area" align="center">
			<%if(currentPage != 1) { %>
			<button onclick="location.href='<%= contextPath %>/list.no?cpage=<%= currentPage -1 %>'" class="btn btn-outline-secondary">&lt;</button>
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++) { %>
				<%if(currentPage != i) { %>
				<button onclick="location.href='<%= contextPath %>/list.no?cpage=<%=i %>'" class="btn btn-outline-secondary"><%= i %></button>
				<% } else { %>
					<button disabled class="btn btn-outline-secondary"><%= i %></button>
				<% } %>
			<% } %>
			<%if(currentPage != maxPage) { %>
				<button onclick="location.href='<%= contextPath %>/list.no?cpage=<%= currentPage +1 %>'" class="btn btn-outline-secondary">&gt;</button>
			<% } %>
			
			
		</div>
		

    </div>

</body>
</html>