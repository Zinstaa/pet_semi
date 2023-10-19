<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려견 등록</title>
<style>
	#file{
	width : 227px;
	}
	#pettable {
 	margin-left : 420px;
	}

	
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
	<br><br><br><br>
	<!-- 사진 이름 견종 나이 -->
	<h2 align="center">반려견 등록</h2>
	<form align="center" id="petEnroll" enctype="multipart/form-data" action="<%=contextPath%>/insertPet.me" method="post">
	<input type="hidden" name="memberNo" value="<%=loginUser.getMemberNo()%>">
		<table id=pettable>
		<br><br>
			<tr>
				<td>반려견 사진</td>
				<td><input type="file" name="dogfile" id="dogfile" required></td>
			</tr>
			
			<tr>
				<td>반려견 이름</td>
				<td><input type="text" name ="dogName" maxlength="21" required></td>
			</tr>
			
			<tr>
				<td>견종</td>
				<td><input type="text" name ="dogKind" maxlength="21" required></td>
			</tr>
			
			<tr>
				<td>나이</td>
				<td><input type="number" name ="dogAge" maxlength="3" required min="1"></td>
			</tr>
			
		</table>

		<button type="submit">등록</button>
		<button type="reset">취소</button>
	</form>
		
	</div>
</body>
</html>