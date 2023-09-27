<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
</head>
<style>
    .outer{
        width: 1000px;
        margin : auto;
        background-color: #fff5ce;
        margin-top: 5px;
        color: black;
    }
    
    .list-area{
        text-align: center;
        border: 1px solid white;
    }

    .list-area>tbody>tr:hover{
        cursor: pointer;
        background-color: #fff5ce;
    }
</style>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<div id="outer">
		<br>
		<h2 align="center">커뮤니티</h2>
		<br>

		<table class="list-area">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbdoy>
				<tr>
					<td colspan="5">조회된 게시글이 없습니다.</td>
				</tr>
					<td>1</td>
					<td>게시글테스트</td>
					<td>홍길동</td>
					<td>50</td>
					<td>2023-09-27</td>
			</tbdoy>
		</table>
		
	</div>

</body>
</html>