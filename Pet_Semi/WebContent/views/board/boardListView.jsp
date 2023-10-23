<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.board.model.vo.Board, com.kh.pet.common.model.PageInfo" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
<title>자유게시판 목록</title>
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
    
    .list-area{
        text-align: center;
        border: 1px solid gray;
    }

    .list-area>tbody>tr:hover{
        cursor: pointer;
        background-color: lightgray;
    }

	.dropbtn {
		width: 200px;
		background-color: white;
		color: balck;
		padding: 16px;
		font-size: 16px;
		margin-left: 100px;
		border: 1px solid lightgray;
		cursor: pointer;
		text-align: left;
		appearance: none;
	}

	.dropbtn:hover, .dropbtn:focus {
		background-color: lightgray;
	}

	.dropdown {
		position: relative;
		display: inline-block;
	}
	
	.dropdown-content {
		display: none;
		position: absolute;
		background-color: #f1f1f1;
		min-width: 160px;
		overflow: auto;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		z-index: 1;
		margin-left: 100px;
	}

	.dropdown-content a {
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
	}

	.dropdown a:hover {background-color: white;}

	.show {display: block;}

	body {
		font-family: Arial;
	}

	* {
		box-sizing: border-box;
	}

	body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
	}

	.board_search {
	overflow: hidden;
	background-color: #e9e9e9;
	}

	.board_search .board_input {
	float: right;
	}

	.board_search input[type=text] {
	padding: 15px;
	margin-left: 470px;
	font-size: 17px;
	border: 1px solid gray;
	}

	.board_search .board_input button {
	float: right;
	padding: 15px 30px;
	margin-right: 16px;
	background: #fff5ce;
	font-size: 17px;
	border: none;
	cursor: pointer;
	}

	@media screen and (max-width: 600px) {
	.board_search .board_input {
		float: none;
	}
	.board_search a, .board_search input[type=text], .board_search .board_input button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.board_search input[type=text] {
		border: 1px solid #ccc;  
	}
	

</style>
</head>

<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer1">
		<h2 align="center">커뮤니티</h2>
		<br>
		
		
		
<span class="dropdown">
  <button onclick="myFunction()" class="dropbtn">커뮤니티 ▽</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="#">자유게시판</a>
    <a href="#">홍보게시판</a>
    <a href="#">공지사항</a>
	<a href="#">QNA</a>
	<a href="#">1:1문의</a>
  </div>

  <span class="board_search">
	<div class="board_input">
	  <form id ="board-search-form" action="<%=contextPath%>/search.bo?cpage=1" method="post">
		<input type="text" placeholder="검색.." name="board-name" >
		<input type="image" src="https://svgsilh.com/svg/1093183.svg" style="width:100px; height:30px;" name="board-search" id="board-search" value="검색">
	  </form>
	</div>
  </span>
</span>


<script>
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

</script>

<hr>

	

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



		<br>
		
		<div align="right" style="width:1100px;">
		
			<% if(loginUser != null) { %>
				<a href="<%= contextPath %>/enrollForm.bo" class="btn btn-sm btn-primary">글작성</a>
				<br><br>
			<% } %>
		</div>
		
		

		<div class="paging-area" align="center">
			<%if(currentPage != 1) { %>
			<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage - 1 %>'" class="btn btn-outline-secondary">&lt;</button>
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++) { %>
				<%if(currentPage != i) { %>
				<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%=i %>'" class="btn btn-outline-secondary"><%= i %></button>
				<% } else { %>
					<button disabled class="btn btn-outline-secondary"><%= i %></button>
				<% } %>
			<% } %>
			<%if(currentPage != maxPage) { %>
				<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage + 1 %>'" class="btn btn-outline-secondary">&gt;</button>
			<% } %>
			
			
		</div>

		<br><br><br><br>
	</div>

	<%@ include file = "../common/footer.jsp" %>
</body>
</html>