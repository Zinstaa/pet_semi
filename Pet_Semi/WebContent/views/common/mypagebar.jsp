<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>
	#mypagebox{
		width: 800px;
		height: 100px;
		background-color : rgb(182, 175, 154);
		margin: auto;
		padding : 36px;
	}
	#mypagebtn{
		float: right;
	}

	.mymenubar{
			display : table-cell;
			height : 100px;
			width : 1200px; 
			padding : 30px;
			background-color : fff5ce; 
			}
			
	.mymenubar a {
		text-decoration : none;
		width : 240px;
		height : 100%;
		display: block;
		line-height : 50px;
		color : black;
		font-size:  30px;
		margin-top : 50px;
		
	}
	#mylist {
	padding : 250px;
	}

	
</style>

</head>
<body>
	<%@ include file="menubar.jsp" %>
	<%
	String memberName = loginUser.getMemberName();
	String memberId = loginUser.getMemberId();
	%>
	<div class="myouter">
	<h2 align="center">마이페이지</h2>
	
	<div id="mypagebox">
			 &nbsp;&nbsp;&nbsp; "<%=memberName%>"님 반갑습니다!!
			<div id="mypagebtn">
			<button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#checkPwdForm">정보수정</button>
			</div>
	</div>
	<div class="mypagemenubar" align="center">
		<div class="mymenubar"><a href="<%=contextPath%>/myreview.me" >내 리뷰 보기</a></div>
		<div class="mymenubar"><a href="#" >내 찜리스트 보기</a></div>
		<div class="mymenubar"><a href="#" >내 게시글 보기</a></div>
	</div>
	
</div>
	
	
<div class="container">
  <!-- Button to Open the Modal -->

  <!-- The Modal -->
  <div class="modal" id="checkPwdForm">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">정보 수정하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
			<div class="modal-body">
			 <form method="post" action="<%=contextPath%>/pwdCheck.me">
				<div class="form-group">
					<label for="memberPwd">비밀번호 </label>
					<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" id="memberPwd" name="memberPwd" required>
				</div>
				<button type="submit" class="btn btn-info">확인</button>
				<input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
				</form>
			</div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
