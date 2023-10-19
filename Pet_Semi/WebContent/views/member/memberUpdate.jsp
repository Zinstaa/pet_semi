<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>

<style>
	
	#enrollpet button{
		height: 50px;
		width: 120px;	
	}
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<%
	//바뀌면 안되는값들 > 아래 변경값에적지않을거
	String memberId = loginUser.getMemberId();
	String memberName = loginUser.getMemberName();
	// null이 들어올수있는것들
	String nickName = (loginUser.getNickName() == null) ? "" : loginUser.getNickName();
	String address = (loginUser.getAddress() == null) ? "" : loginUser.getAddress();
 	String age = (loginUser.getAge() == null) ? "" : loginUser.getAge();
	
	%>
	<div class="outer">
		<br><br><br>
		<h3 align="center"> 내 정보 수정하기</h3>
		<form id="update-form" action="<%=contextPath%>/update.mem" method="post">
			<table align="center">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="memberId" readonly value="<%=memberId%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="memberName" readonly value="<%=memberName%>"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickName" value="<%=nickName%>"maxlength="30"> </td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%=address%>" maxlength="100"> </td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="<%=age%>" min="1"></td>
					
				</tr>
			</table>
			<br><br>

			<div align="center">
				<button type="submit" class="btn btn-outline-dark">수정확인</button>
				<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#updatePwdForm">비밀번호 수정</button>
				<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#deleteMemberForm">회원탈퇴</button>	
			</div>
		</form>
		<br>
		<div align="center" id="enrollpet">
			<button type="button" class="btn btn-outline-success" onclick="enrollPetPage()">반려견 등록</button>
		</div>
		<script>
			function enrollPetPage(){
				location.href = "<%=contextPath%>/enrollPetPage.me"
			}
		</script>
	</div>
	
	        <!-- 비밀번호 수정 모달창 만들기-->
        <!-- The Modal -->
        <div class="modal" id="updatePwdForm">
        <div class="modal-dialog">
        <div class="modal-content">

        <!-- Modal Header -->   
        <div class="modal-header">
            <h4 class="modal-title">비밀번호 변경</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
        
            <form method="post" action="<%=contextPath%>/updatePwd.me">
                <!--현재 비밀번호, 변경할비밀번호, 변경할비밀번호 재입력-->
                <div class="form-group">
                    <label for="memberPwd">현재 비밀번호 :</label>
                    <input type="password" class="form-control" id="memberPwd" name="memberPwd" required>
                  </div>
                  <div class="form-group">
                    <label for="updatePwd">변결할 비밀번호 :</label>
                    <input type="text" class="form-control" id="updatePwd"  name="updatePwd" required>
                  </div>
                  <div class="form-group">
                    <label for="checkPwd">변결할 비밀번호 확인 :</label>
                    <input type="text" class="form-control" id="checkPwd" name="checkPwd" required>
                  </div>

                  <button type="submit" onclick="return validatePwd();" class="btn btn-sm btn-secondary">비밀번호 변경</button>
                  
                  <input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">

                  <script>
                    function validatePwd(){
                        if($('#updatePwd').val() != $('#checkPwd').val()){
                            alert('비밀번호를 동일하게 입력해주세요!');
                            $('#checkPwd').focus();
                            return false;
                        }
                        return true;
                    }
                  </script>
            </form>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>

        </div>
        </div>
        </div>
<!-- ------------------------------------------------------------------ -->
        <!-- 회원탈퇴 모달창 만들기-->
        <!-- The Modal -->
        <div class="modal" id="deleteMemberForm">
        <div class="modal-dialog">
        <div class="modal-content">

        <!-- Modal Header -->   
        <div class="modal-header">
            <h4 class="modal-title">회원 탈퇴를 진행하시겠습니까?</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
         
            <form method="post" action="<%=contextPath%>/delete.me">
                <div class="form-group">
                    <label for="deletePwd">회원탈퇴 하시려면 비밀번호를 입력해 주세요</label>
                    <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." id="deletePwd" name="memberPwd" required >
                  </div>
                 <button type="submit" class="btn btn-sm btn-danger">회원탈퇴</button>
                 
            </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
        </div>
        </div>
        </div>
	
</body>
</html>