<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

	.dropbtn {
		width: 200px;
		background-color: white;
		color: balck;
		padding: 16px;
		font-size: 16px;
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

	form.example input[type=text] {
		padding: 10px;
		font-size: 17px;
		border: 1px solid grey;
		float: left;
		width: 80%;
		background: #f1f1f1;
	}

	form.example button {
		float: left;
		width: 20%;
		padding: 10px;
		background: #2196F3;
		color: white;
		font-size: 17px;
		border: 1px solid grey;
		border-left: none;
		cursor: pointer;
	}

	form.example button:hover {
		background: #0b7dda;
	}

	form.example::after {
		content: "";
		clear: both;
		display: table;
	}
</style>
</head>

<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center">커뮤니티</h2>
		<br>
		
<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">커뮤니티 ▽</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="#">자유게시판</a>
    <a href="#">홍보게시판</a>
    <a href="#">공지사항</a>
	<a href="#">QNA</a>
	<a href="#">1:1문의</a>
	
  </div>

  <br><br><br><br>
</div>


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