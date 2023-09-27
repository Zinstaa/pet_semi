<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
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
        border: 1px solid gray;
    }

    .list-area>tbody>tr:hover{
        cursor: pointer;
        background-color: lightgray;
    }
</style>
</head>

<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center">커뮤니티</h2>
		<br>

		<table class="list-area" align="center">
			<thead>
				<tr>
					<th width="100">글번호</th>
					<th width="300">제목</th>
					<th width="100">작성자</th>
					<th width="100">조회수</th>
					<th width="100">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5">조회된 게시글이 없습니다.</td>
				</tr>
				<tr>
					<td>1</td>
					<td>게시글테스트</td>
					<td>홍길동</td>
					<td>50</td>
					<td>2023-09-27</td>
				</tr>
			</tbody>
		</table>
		<br><br>
	</div>

	
</body>
</html>