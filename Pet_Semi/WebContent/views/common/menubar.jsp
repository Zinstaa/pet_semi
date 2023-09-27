<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
		/*background-color: #fff5ce;*/
	}
	
	.header{
		width : 1200px;
		margin : auto;
	}

	.header a {
		text-decoration : none;
		width : 100%;
		height : 100%;
		display: block;
		line-height : 40px;
		color : black;
		font-weight : bold;
		font-size:  18px;
	}


	.btn_img{
		background: url("https://www.codingfactory.net/wp-content/uploads/button_search.png");
		border: none;
        width: 32px;
        height: 32px;
        cursor: pointer;
	}

	.navbar {
		background-color : #fff5ce;
		text-align: center;
		border-top: 2px  solid lightgray;
		border-bottom: 2px  solid lightgray;
	}

	.menu{
		display : table-cell;
		height : 40px;
		width : 200px;
	}

	.menu a {
		text-decoration : none;
		width : 100%;
		height : 100%;
		display: block;
		line-height : 40px;
		color : black;
		font-weight : bold;
		font-size:  20px;
	}

	.menu a:hover{
		border-bottom : 5px solid #ffce50;
	} 
</style>
</head>
<body>
	<br><br>
	<!-- 로고 위치 -->
	
	<div class="header">
		<h1 class="head_logo" align="center">어댕가지~?</h1>
		<div align="right" class="head_login">
			<table>
				<tr>
					<td><a href="#">로그인</a></td>
					<td> &nbsp; | &nbsp; </td>
					<td><a href="#">회원가입</a></td>
					<td>&nbsp;&nbsp;</td>
					<td><input type="button" class="btn_img"></td>
				</tr>
			</table>
		</div>
		<div align="right" class="admin_login" style="visibility: hidden;" >
			<table>
				<tr>
					<td><a href="#">회원관리</a></td>
					<td> &nbsp; | &nbsp; </td>
					<td><a href="#">리뷰관리</a></td>
					<td>&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<!-- 네비게이션 바 위치 -->
	<div class="navbar navbar-expand-sm justify-content-center sticky-top" >
		<div class="menu"><a href="#">HOME</a></div>
		<div class="menu"><a href="#">플레이스</a></div>
		<div class="menu"><a href="#">커뮤니티</a></div>
		<div class="menu"><a href="#">알림 / 소식</a></div>
		<div class="menu"><a href="#">고객센터</a></div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>