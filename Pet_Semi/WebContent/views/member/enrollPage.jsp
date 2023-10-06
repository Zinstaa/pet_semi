<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가이이입~</title>
<style>
 #enroll-form{
 	margin-left : 370px;
 }
 #insertmembercheck{
 	margin-left : 150px;
 }
</style>
</head>

<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class ="outer">
		<br><br>
		<h2 align="center">회원가입</h2>
		<!-- 아이디 비번 이름 이메일 폰 닉네임 주소 나이 성별-->
		<form id="enroll-form" action="<%=contextPath %>/insert.me">
			<table>
				<tr>
					<td>*아이디 </td>
					<td><input type="text" name ="memberId" maxlength="20" required placeholder="20자리이하로입력"></td>
					<th><button type="button" onclick="idCheck();">중복체크</button></th> 
				</tr>
				
				<tr>
					<td>*비밀번호 </td>
					<td><input type="password" id="memberPwd1" name ="memberPwd" maxlength="15" required ></td>
				</tr>
				
				<tr>
					<td>*비밀번호 확인 </td>
					<td><input type="password" id="memberPwd2" maxlength="15" required></td>
					<th hidden id=pwdcheck1>비밀번호가 일치합니다</th>
					<th hidden id=pwdcheck2>비밀번호가 일치하지 않습니다</th>
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
					 	<input type="radio" name="gender" value="m" checked> 남자
					 	<input type="radio" name="gender" value="f"> 여자
					 </td>
				 </tr>
			</table>
			<div id=insertmembercheck>
				<button type="submit" disabled >회원가입</button>
				<button type="reset">취소</button>
			</div>
		</form>
	</div>
	
	<script>
		function idCheck(){
			const $memberId = $('#enroll-form input[name=memberId]');
			
			$.ajax({
				url : 'idcheck.me',
				data : {checkId : $memberId.val()},
				success : function(result){
					if(result == 'US'){
						alert('사용이 불가능한 아이디입니다');
						$memberId.val('').focus();
					}else{
						if(confirm('사용이 가능한 아이디입니다 (확인을누르면 아이디수정 불가능)')){
							$memberId.attr('readonly',true);
							
							$('#enroll-form button[type=submit]').removeAttr('disabled');
						} else {
							$memberId.focus();
						};
					}
				},
				eorror : function() {
					console.log('아이디 중복체크 AJAX통신 실패');
				}
			});
		}
	</script>
	<script>
		if(memberPwd1 != memberPwd2){
			$("#pwdcheck2").show();
		}
	</script>

</body>
</html>