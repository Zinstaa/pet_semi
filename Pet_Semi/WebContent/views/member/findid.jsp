<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<!--  안쓰는거같아 일단은...! -->
<style>
	#findid input{margin : 5px;}
	
	
</style>
</head>

<body>
<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
	<br><br><br><br><br>
	<h2 align="center"> 아이디찾기 </h2>
	<form id = "findid" action="<%=contextPath%>/findid.me" method="post">
	
		<table align="center">
			<tr>
				<td>이메일</td>
				<td><input for="memberemail" type="email" name="email" id="email" maxlength="30" required></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input for="memberphone" type="text" name="phone" id="phone" maxlength="13" required></td>
				<td></td>
			</tr>
		</table>
		
		<br><br>
		
		<div align="center">
		<button type="submit" onclick="return memberFindId">아이디찾기</button>
		<button type="reset" onclick="history.back();">취소</button>
		</div>
		
	</form>
	</div>
	
	
	<script>
	// 사용자가 입력한 이메일 전화번호와 디비에 이메일 전화번호가 같은것이 있는지 조회해서 확인
	
		function memberFindId(){
			//아이디찾기 
			$.ajax({
				
				url : 'findid.me',
				data : {
					memberEmail : $('#member-email').val(),
					memberPhone : $('#member-phone').val()
				},
				success : function(result){
					let resultList = '';
					if(result.length > 0){
					for(let i =0; i < result.length; i++){
							alert(result[i].memberId)
					}
					}else{
					alert('검색 결과가 없습니다.');
					}
					$('#memberlist tbody').html(resultList);
				},
				error : function(){
					console.log('AJAX실패')
					console.log(result);
				}
			})
		}
	
	</script>
	


</body>
</html>