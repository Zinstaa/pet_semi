<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.util.ArrayList, com.kh.pet.member.model.vo.Member"
 %>
 <%
 	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style>
	
</style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
	<!-- 회원 검색창 -->
	<div>
		<form action="<%=contextPath %>/search.me" id="member-search-area">
			<table>
				<tr>
					<th>검색조건</th>
					<td>
						<select name="search-list">
							<option value="memberNo">회원번호</option>
							<option value="memberId">아이디</option>
							<option value="memberName">회원이름</option>
							<option value="email">이메일</option>
							<option value="phone">휴대폰번호</option>
							<option value="nickName">닉네임</option>

						</select>
					</td>
				</tr>
				<tr>
					<th>검색어</th>
					<td><input type="text" id="member-search" name="search-value"></td>
					
				</tr>
			</table>
			<div>
				<button type="submit">검색</button>
				<button type="reset">리셋</button>
			</div>
		</form>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원아이디</th>
					<th>회원이름</th>
					<th>이메일</th>
					<th>휴대폰번호</th>
					<th>닉네임</th>
					<th>가입일</th>
					<th>회원상태</th>
				</tr>
			</thead>
			<!-- 
			<tbody>
				<tr>
					<th>1000</th>
					<th>asddd</th>
					<th>짱구</th>
					<th>asdlf@gmail.com</th>
					<th>010-1231-2333</th>
					<th>똘끼</th>
					<th>2022-21-12</th>
					<th>U</th>
				</tr>
			
			</tbody>
			 -->
		</table>
	</div>
	
</body>
</html>