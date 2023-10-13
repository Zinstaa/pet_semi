<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.util.ArrayList, com.kh.pet.member.model.vo.Member "
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	#findpwd input{margin : 5px;}
</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<div class="outer">
	<br><br><br><br>
	<h2 align="center">비밀번호 찾기</h2>
	<form id="findpwd" action="<%=contextPath%>/findpwd.me" method ="post">
		<table align="center">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberId" id="memberId" maxlength="20" required></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" id="email" maxlength="30" required ></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" id="phone" maxlength="13" required ></td>
			</tr>
		</table>
		
		<br><br>
		
		<div align="center">
		<button type="submit">비밀번호 찾기</button>
		<button type="reset" onclick="history.back();" >취소</button>
		</div>
	</form>
</div>

</body>
</html>