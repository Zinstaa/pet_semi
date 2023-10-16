<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입하기</title>
<style>
 #enroll-form{
 	margin-left : 370px;
 }
 #insertmembercheck{
 	margin-left : 150px;
 }
 #pwdcheck2 {
 	color : red;
 	font-size : 10px;
 }
 #idcheck{
 	border-radius : 12px; 
	font-size: 12px;
 }
 #insertmembercheck > button{
 	border-radius : 10px; 
	font-size: 12px;
 }
 
</style>
</head>

<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class ="outer">
		<br><br><br><br><br>
		<h2 align="center">회원가입</h2>
		<!-- 아이디 비번 이름 이메일 폰 닉네임 주소 나이 성별-->
		<form id="enroll-form" action="<%=contextPath %>/insert.me">
			<table>
				<tr>
					<td>*아이디 </td>
					<td><input type="text" name ="memberId" maxlength="20" required placeholder="3~20자리이하로영어나숫자입력"></td>
					<th><button type="button" id="idcheck" class="btn btn-dark" onclick="idCheck();">중복체크</button></th>
				</tr>
								
				<tr>
					<td>*비밀번호 </td>
					<td><input type="password" id="memberPwd1" name ="memberPwd" maxlength="15" required placeholder="영문자,숫자로만4~15자리입력"></td>
				</tr>
				
				<tr>
					<td>*비밀번호 확인 </td>
					<td><input type="password" id="memberPwd2" maxlength="15" required></td>
					<th style="display:none" id=pwdcheck2 >비밀번호가 일치하지 않습니다</th>
				</tr>
				
				<tr>
					<td>*이름 </td>
					<td><input type="text" id="memberName" name="memberName" maxlength="15" required placeholder="2~5자리이름입력"></td>
				</tr>
				
				<tr>
					<td>*이메일 </td>
					<td><input type="text" name="email" maxlength="30" required placeholder="@포함 이메일 형식 입력"></td>
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
				<button type="submit" disabled class="btn btn-dark" onclick = "return validate();">회원가입</button>
				<button type="reset" class="btn btn-warning">취소</button>
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
						regExp = /^[a-zA-Z][a-zA-Z0-9]{3,20}$/;
						if(!regExp.test($memberId.val())){
						alert('유효하지않은 아이디 형식입니다');
						$memberId.val('').focus();
						 } else{
						if(confirm('사용이 가능한 아이디입니다 (확인을누르면 아이디수정 불가능)')){
							$memberId.attr('readonly',true);
							$('#enroll-form button[type=submit]').removeAttr('disabled');
						} else {
							$memberId.focus();
						};
					}
				}
			},
				eorror : function() {
					console.log('아이디 중복체크 AJAX통신 실패');
				}
			});
			
		}
	</script>
	<script>
	 function validate(){
		// 유효성 검사 : 아이디, 비밀번호, 비밀번호 일치, 이름
		
		let memberPwd1 = document.getElementById('memberPwd1');
		let memberPwd2 = document.getElementById('memberPwd2');
		let memberName = document.getElementById('memberName');
	
		if(memberPwd1.value != memberPwd2.value){
			$("#pwdcheck2").show();
			alert('비밀번호가 다릅니다');
			return false;
		} 

		// 정규 표현식 입니다~!~!~!~!~!
		
		 regExp = /^[a-zA-Z0-9]{4,15}$/;
         if(!regExp.test(memberPwd1.value)){
             alert('비밀번호 양식에맞게 입력해주세요');
             return false;
         }         

         regExp = /^[가-힣]{2,5}$/;
         if(!regExp.test(memberName.value)){
        	 alert('이름을 확인해주세요');
        	 memberName.select();
        	 memberName.value = '';
             return false;
         }
		 
		 return true;
		
	}
	</script>

	</body>
	</html>
	