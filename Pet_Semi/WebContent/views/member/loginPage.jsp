<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	#login-form input{margin : 5px;}
	
	
</style>


</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
	<br><br><br><br><br>
	<h2 align="center"> 로그인 </h2>
	<form id = "login-form" action="<%=contextPath%>/login.me" method="post">
	
		<table align="center">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberId" maxlength="12" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memberPwd" maxlength="15" required></td>
				<td></td>
			</tr>
		</table>
		<br><br>
		<div align="center">
		<button type="submit">로그인</button>
		</div>

<!-- 		
		<div align="center">
		<button type="submit">아이디 찾기</button>
		</div>
		
		<div align="center">
		<button type="submit">비밀번호 찾기</button>
		</div>
-->	
			
	</form>
	</div>

</body>
</html>