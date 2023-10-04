<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.pet.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	String contextPath = request.getContextPath();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
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

	div {
        box-sizing: border-box;
		/*border: 1px solid red;*/
    }
	
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
		width : 79%;
	}

	.head_logo > h1 {
		text-align: center;
		line-height : 100px;
	}

	.head_login{
		width : 21%;
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

	#login > button, #bar, #access > button {
		text-align: center;
		line-height: 100px;
		color : black;
	}

	#search{
		margin-top: 35px;
		height: auto;
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

	.navbar {
		margin-top: 30px;
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
		<div class="head_logo">
			<h1>어댕가지~?</h1>
		</div>
	
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
	<div class="navbar navbar-expand-sm justify-content-center sticky-top" >
		<div class="menu"><a href="#">HOME</a></div>
		<div class="menu"><a href="#">플레이스</a></div>
		<div class="menu"><a href="#">커뮤니티</a></div>
		<div class="menu"><a href="<%= contextPath %>/promotelist.pr">알림 / 소식</a></div>
		<div class="menu"><a href="#">고객센터</a></div>
	</div>
	
	<br><br><br>
</body>
</html>