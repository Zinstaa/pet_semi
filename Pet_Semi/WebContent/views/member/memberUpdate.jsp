<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>


</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<%
	//바뀌면 안되는값들 > 아래 변경값에적지않을거
	int memberNo = loginUser.getMemberNo();
	String memberId = loginUser.getMemberId();
	// null이 들어올수있는것들
	String nickName = (loginUser.getNickName() == null) ? "X" : loginUser.getNickName();
	String address = (loginUser.getAddress() == null) ? "X" : loginUser.getAddress();
 	String age = (loginUser.getAge() == null) ? "X" : loginUser.getAge();
	
	%>
	
	

</body>
</html>