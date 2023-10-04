<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.pet.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 바</title>
<!-- Noto Sans Korean 글꼴 추가 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&display=swap" rel="stylesheet">

<!-- Bootstrap 4 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- swiper.js 라이브러리추가 -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<style>
	/* 페이지 글꼴 설정 */
	body{
		font-family: 'Noto Sans KR', sans-serif;
		/*background-color: #fff5ce;*/
	}
	/* 박스 테두리 설정 */
	div {
        box-sizing: border-box;
		/*border: 1px solid red;*/
    }
	
	/* 해더 부분 css */
	.header{
		width : 1200px;
		height: 100px;
		margin : auto;
		margin-bottom: 10px;
	}

	.header > div{
		float: left;
		height: 100%
	}

	.head_logo{
		width : 75%;
	}

	.head_logo > h1 {
		text-align: center;
		line-height : 100px;
	}

	.head_login{
		width : 25%;
		height: 100%;
	}

	.head_login > div{
		float: left;
		height: 100%;
	}

	#member_login > div {
		height: 100%;
		float: left;
	}

	#bar {
		text-align: center;
		line-height: 100px;
		color : black;
		margin-top: 5px;
	}

	#login > button,  #access > button {
		text-align: center;
		line-height: 100px;
		color : black;
	}

	#search > input{
		margin-top: 40px;
	}

	#admin_login {
		height: 100%;
		width: 10%;
		float: right;
		margin-right: 20%;
	}

	.header a, #admin_login a {
		text-decoration : none;
		width : 100%;
		height : 100%;
		display: block;
		line-height : 40px;
		color : black;
		font-weight : bold;
		font-size:  18px;
	}

	#btn_img{
		background: url("https://www.codingfactory.net/wp-content/uploads/button_search.png");
		background-size: auto;
		border: none;
        width: 32px;
        height: 32px;
        cursor: pointer;
		background-repeat: no-repeat;
	}
	/* 네비게이션 바 css*/
	.navbar {
		margin: 0;
		background-color : #fff5ce;
		text-align: center;
		border-top: 2px  solid lightgray;
		border-bottom: 2px  solid lightgray;
		line-height: 100%;
		height: 70px;
	}

	.navbar ul, .navbar li {
		list-style: none;
	}

	.menu{
		display : table-cell;
		height : 50px;
		width : 200px;
	}

	.menu a {
		text-decoration : none;
		width : 100%;
		height : 100%;
		display: block;
		line-height : 50px;
		color : black;
		font-weight : bold;
		font-size:  20px;
	}

	.menu a:hover{
		border-bottom : 2px solid #ffce50;
	} 

	.menu > li > ul {
		z-index: 1;
		position: relative;
		list-style: none;
		padding: 0;
		display: none; /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지는 효과 1 */
	}

	.menu > li > a:hover + ul, .menu > li > ul:hover {
		display: block; /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지는 효과 2 */
	}

	#co, #me {
		width: 200px;
		height: 50px;
	}

	#co > li > ul, #me > li > ul {
		z-index: 1;
		position: relative;
		background-color: #fff5ce;
		border: 2px solid lightgray;
		border-top: none;
		list-style: none;
		padding: 0;
	}

</style>
</head>
<body>
	<br><br>
	<!-- 로고 위치 -->
	
	<div class="header">
		<div class="head_logo">
			<h1>어댕가지~?</h1>
		</div>
		<%if(loginUser==null) {%>
		<div class="head_login">
			<div id="member_login">
				<div id="login">
					<button type="button" class="btn btn-link" onclick="loginPage();">로그인</button>
				</div>
				<div id="bar">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
				<div id="access">
					<button type="button" class="btn btn-link">회원가입</button>
				</div>
				<div id="bar">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
				</div> <!--id="member_login" 닫히는부분-->
				<div id="search">
					<input type="button" id="btn_img"></td>
				</div>
			</div> <!-- <div class="head_login"> 닫히는부분 -->
			</form>
			<script>
				function loginPage(){
					location.href = "<%= contextPath %>/views/member/loginPage.jsp"
				}
			</script>
			
			
		<%} else { %>
		<div id="user-info">
		<b><%= loginUser.getMemberName() %></b>님 환영합니다~~! <br><br><br>
		<div align = "center">
			<a href="<%= contextPath %>/mypage.me">마이페이지</a>
			<!--  <a href="/jsp/logout.me">로그아웃</a>-->
			<a href="<%=contextPath %>/logout.me">로그아웃</a>
		</div>
		<%} %>
		</div>
			
			
			
		</div>
			<div id="admin_login" align="right" style="display: none;">
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
	<div class="navbar justify-content-center sticky-top" >
		<ul>
			<div class="menu" id="ma">
				<li>
					<a href="#">HOME</a>
				</li>
			</div>
			<div class="menu" id="pl">
				<li>
					<a href="#">플레이스</a>
				</li>
			</div>
			<div class="menu" id="co">
				<li>
					<a href="#">커뮤니티</a>
					<ul>
						<li><a href="#">자유게시판</a></li>
						<li><a href="#">홍보게시판</a></li>
					</ul>
				</li>
			</div>
			<div class="menu" id="al">
				<li>
					<a href="#">알림 / 소식</a>
				</li>
			</div>
			<div class="menu" id="me">
				<li>
					<a href="#">고객센터</a>
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">Q&A</a></li>
					</ul>
				</li>
			</div>
		</ul>
	</div>

	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>