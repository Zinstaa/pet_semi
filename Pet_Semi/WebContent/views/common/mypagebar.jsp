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
	}

	
</style>

</head>
<body>
	<%@ include file="menubar.jsp" %>
	<%
	String memberName = loginUser.getMemberName();
	%>
	<div class="myouter">
	<h2 align="center">마이페이지</h2>
	
	<div id="mypagebox">
			 &nbsp;&nbsp;&nbsp; "<%=memberName%>"님 반갑습니다!!
			<div id="mypagebtn">
			<button type="submit" onclick="memberUpdate();"  class="btn btn-secondary btn-sm">정보수정</button>
			</div>
	</div>
	<br><br><br>
	<div class="mypagemenubar" align="center">
		<div class="mymenubar"><a href="<%=contextPath%>/myreview.me" >내 리뷰 보기</a></div>
		<div class="mymenubar"><a href="#" >내 찜리스트 보기</a></div>
		<div class="mymenubar"><a href="#" >내 게시글 보기</a></div>
	</div>
	
	 <script>
            function memberUpdate(){
               location.href = "<%= contextPath %>/update.me"
            }
         </script>
	
	</div>

	<!-- 아이디 비번 이름 이메일 폰 닉네임 주소 나이 성별-->
	
	


</body>
</html>