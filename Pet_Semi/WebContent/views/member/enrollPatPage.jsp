<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려견 등록</title>


</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
	<br><br><br><br>
	<!-- 사진 이름 견종 나이 -->
	<h2 align="center">반려견 등록</h2>
	<form align="center" id="petEnroll" action="<%=contextPath%>/insertPet.me">
	<input type="hidden" name="memberNo" value="<%=loginUser.getMemberNo()%>">
		<table align="center">
		<br><br>
			<tr>
				<td>반려견 사진</td>
				<td><img src="https://yeayakup.wetoz.kr/plugin/wz.booking.pension.prm/img/noimage.gif" alt="반려견이미지" id="PetImg" width="250px" height="180px"></td>
			</tr>
			
			<tr>
				<td>반려견 이름</td>
				<td><input type="text" name ="petId" maxlength="21" required></td>
			</tr>
			
			<tr>
				<td>견종</td>
				<td><input type="text" name ="petType" maxlength="21" required></td>
			</tr>
			
			<tr>
				<td>나이</td>
				<td><input type="number" name ="petAge" maxlength="21" required></td>
			</tr>
			
		</table>
			<div>
				<input type="file" name="file" id="file" required onchange="loadImg(this);">
			</div>


		<button type="submit">등록</button>
		<button type="reset">취소</button>
	</form>
		
		
	</div>
</body>
</html>