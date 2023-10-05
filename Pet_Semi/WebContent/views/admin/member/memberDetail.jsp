<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
<style>
	div{
		box-sizing: border-box;
		border : 1px solid red;
	}
	.a{
		
		width : 700px;
		height : 400px;
		margin : auto;
		
	}
	.detail table *{
		border : 1px solid blue;
	}
	
	.detail{
		float : left;
		margin: auto;
		padding : 10px;
	}
	#profile{
		width: 25%;
		height: 60%;
	}
	.btn-btn{
		float : left;
	}
	#toggle-btn{
		width : 65%;
		margin : auto;
		padding-top : 5px;
	}
	#submit-btn{
		width : 35%;
		margin : auto;
	}

	#inform{
		width: 75%;
		height : 100%
	}
	#inform th{
		width : 100px;
	}
	#inform td{
		width : 300px;
	}

	/*=============== toggle ===============*/
	.wrapper { position: relative; }
	#switch {
		position: absolute;
		/* hidden */
		appearance: none;
		-webkit-appearance: none;
		-moz-appearance: none;
	}
	.switch_label {
		
		position: relative;
		cursor: pointer;
		display: inline-block;
		width: 58px;
		height: 28px;
		background: #fff;
		border: 2px solid #daa;
		border-radius: 20px;
		transition: 0.2s;
	}
	
	.switch_label:hover {
		background: #efefef;
	}
	.onf_btn {
		position: absolute;
		top: 5px;
		left: 5px;
		display: inline-block;
		width: 19px;
		height: 19px;
		border-radius: 20px;
		background: #daa;
		transition: 0.2s;
	}
		
	/* checking style */
	#switch:checked+.switch_label {
		background: #c44;
		border: 2px solid #c44;
	}
	
	#switch:checked+.switch_label:hover {
		background: #e55;
	}
	
	/* move */
	#switch:checked+.switch_label .onf_btn {
		left: 33px;
		background: #fff;
		box-shadow: 1px 2px 3px #00000020;
	}
	/*=============== toggle 끝 ===============*/

</style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
	<!-- 고객상세페이지 -->
	<!--상단 (사진, 계정활성화 여부)-->
	<div class="a">
		<div class="detail" id="profile">
			<div id="img">
				<img src="https://svgsilh.com/svg/2098873-795548.svg" width="150" height="150" alt="">
			</div>
			<div id="btn">
				<form action="#">
					<div class="btn-btn" id="toggle-btn">
						<span>정지</span>
						<input type="checkbox" id="switch" name= "status" value="S">
						<label for="switch" class="switch_label">
							<span class="onf_btn"></span>
						</label>
					</div>
					<div class="btn-btn" id="submit-btn">
					<input type="submit" value="적용">
					</div>
				</form>
			</div>
		</div>
		<div class="detail" id="inform">
			<table>
				<tr>
					<th width="100">회원번호</th>
					<td colspan="2">1234</td>
					
				</tr>
				<tr>
					<th>아이디</th>
					<td colspan="2">admin</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td colspan="2">1234</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="2">zzang@gmail.com</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="2">010-5555-5555</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td colspan="2">2023.03.03</td>
					
				</tr>
				<tr>
					<th>게시글 수</th>
					<td>3</td>
					<td><button>전체보기</button></td>
				</tr>
				<tr>
					<th>리뷰 수</th>
					<td>33</td>
					<td><button>전체보기</button></td>
				</tr>

			</table>
		</div>
	</div>
	

</body>
</html>