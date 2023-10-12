<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.util.ArrayList, com.kh.pet.member.model.vo.Member "
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>

<style>
	#findid input{margin : 5px;}
	
	
</style>
</head>

<body>
<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
	<br><br><br><br><br>
	<h2 align="center"> 아이디 찾기 </h2>
	<form id = "findid" action="<%=contextPath%>/findid.me" method = "post">
		<table align="center">
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" id="email" maxlength="30" required></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" id="phone" maxlength="13" required></td>
				<td></td>
			</tr>
		</table>
		
		<br><br>
		
		<div align="center">
		<button type="submit">아이디찾기</button>
		<button type="reset" onclick="history.back();">취소</button>
		</div>
		</form>
	</div>
	
	
	<script>
	
//		function memberFindId(){
		
			//아이디찾기 
//			$.ajax({
//				url : 'findid.me',
//				data : {
//					email : $('#email').val(),
//					phone : $('#phone').val()
//					},
//					success : function(result){
						
//						console.log($('#email'));
//						console.log($('#phone'));
						
//						if(result != null){
//							alert("아이디는 " + 'MEMBER_ID' +"입니다");
//						} else {
//							alert("일치하는아이디가없습니다")
//							}
//						},
//				error : function(){
//					console.log('AJAX실패')
//					console.log(result);
//				}
//			})
//		}
	
	</script>
	


</body>
</html>