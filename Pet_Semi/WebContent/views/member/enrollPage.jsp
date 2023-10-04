<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가이이입~</title>

</head>

<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class ="outer">
		<br><br>
		<h2 align="center">회원가입</h2>
		<!-- 아이디 비번 이름 이메일 폰 닉네임 주소 나이 성별-->
		<form id="enroll-form" action="<%=contextPath %>/enroll.me">
			<table align="center">
				<tr>
					<td>*아이디 </td>
					<td><input type="text" name ="memberId" maxlength="20" required placeholder="20자리이하로입력"></td>
					<!-- <td>중복체크</td> -->
				</tr>
				
				<tr>
					<td>*비밀번호 </td>
					<td><input type="password" name ="memberPwd" maxlength="15" required ></td>
				</tr>
				
				<tr>
					<td>*비밀번호 확인 </td>
					<td><input type="password" maxlength="15" required></td>
				</tr>
				
				<tr>
					<td>*이름 </td>
					<td><input type="text" name="memberName" maxlength="15" required></td>
				</tr>
				
				<tr>
					<td>*이메일 </td>
					<td><input type="text" name="email" maxlength="30" required placeholder="@포함하여입력"></td>
				</tr>
				
				<tr>
					<td>*전화번호 </td>
					<td><input type="text" name="phone" maxlength="13" required placeholder="-포함해서 입력" ></td>
				</tr>
				
				<tr>
					<td>&nbsp; 닉네임</td>
					<td><input type="text" name="nickName" maxlength="30"></td>
				</tr>
				
				<tr>
					<td>&nbsp;주소 </td>
					<td><input type="text" name="address" maxlength="100"></td>
				</tr>
				
				<tr>
					<td>&nbsp;나이 </td>
					<td><input type="number" name="age" maxlength="3" ></td>
				</tr>
				
				 <tr>
				 <th>&nbsp;성별</th>
				 	<td>
					 	<input type="radio" name="gender" value="male" checked> 남자
					 	<input type="radio" name="gender" value="female"> 여자
					 </td>
				 </tr>
			</table>
			<div align="center">
				<button type="submit">회원가입</button>
				<button type="reset">취소</button>
			</div>
			
		
		</form>
	</div>

</body>
</html>