<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="com.kh.pet.member.model.vo.Member"
 %>
 <%
 	Member m = (Member)request.getAttribute("m");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
<style>
	div{
		box-sizing: border-box;
		
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
	/* The switch - the box around the slider */
	.switch {
	  position: relative;
	  display: inline-block;
	  width: 60px;
	  height: 34px;
	  vertical-align:middle;
	}
	
	/* Hide default HTML checkbox */
	.switch input {display:none;}
	
	/* The slider */
	.slider {
	  position: absolute;
	  cursor: pointer;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: #ccc;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	.slider:before {
	  position: absolute;
	  content: "";
	  height: 26px;
	  width: 26px;
	  left: 4px;
	  bottom: 4px;
	  background-color: white;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
	  -webkit-transform: translateX(26px);
	  -ms-transform: translateX(26px);
	  transform: translateX(26px);
	}
	
	/* Rounded sliders */
	.slider.round {
	  border-radius: 34px;
	}
	
	.slider.round:before {
	  border-radius: 50%;
	}
	
	p {
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
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
			<!-- 회원 상태값 변경을 위한 토글버튼 모양 -->
					<div class="btn-btn" id="toggle-btn">
						<input type="hidden" id="no" name="memberNo" value="<%=m.getMemberNo() %>">
						<label class="switch">
						<input type="checkbox" onclick="toggle(this)" id="memStatus">
						<span class="slider round"></span>
						</label>
						<p>정상</p><p style="display:none;">정지</p>
							<script>
								var check = $("input[type='checkbox']");
								//토글 기능
								check.click(function(){
									$("p").toggle();
								});
								
								//상태값을 가지고 정지된 고객 페이지에 들어가면 checked된 상태로 만든다.
								let status = '<%=m.getStatus()%>'
								console.log($(check).val());
								console.log(status);
								if(status == "S"){
									$('#memStatus').attr('checked',true);
									$("p").toggle();
								};
								
								/*
									$(check).filter(function(){
										
										if(!status.search($(this).val())){
											$(this).attr('checked',true);
											
										}
										
									});
									*/
							/*
								function toggle(status){
									console.log(status.checked);
									console.log(status.value);
									const no = document.getElementsByName('memberNo');
									
								}
									*/
								 
								//회원 상태를 실제 DB에서 변경하는 작업 (U -> S / S -> U)
								$(function(){
									$('#memStatus').click(function(){
										$.ajax({
											url : 'status.me',
											data : {
												//status : $('#memStatus').val()
												no : $('#no').val(),
												status : $('#memStatus').is(':checked')
											},
											success : function(result){
												console.log('AJAX성공');
												alert('회원상태를 정상적으로 변경하였습니다.');
											},
											error : function(e){
												alert('회원상태를 정상적으로 변경하지 못했습니다.');
											}
											
										})
										
									})
								})
							</script>
							<!--  
								<span>정지</span>
								<input type="checkbox" id="switch" name= "status" value="S">
								<label for="switch" class="switch_label">
									<span class="onf_btn"></span>
								</label>
								-->
					</div>
					<!--
						<div class="btn-btn" id="submit-btn">
							<input type="submit" value="적용">
						</div>
						-->
			</div>
		</div>
		<div class="detail" id="inform">
			<table>
				<tr>
					<th width="100">회원번호</th>
					<td colspan="2"><%=m.getMemberNo() %></td>
					
				</tr>
				<tr>
					<th>아이디</th>
					<td colspan="2"><%=m.getMemberId() %></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td colspan="2"><%=m.getMemberPwd() %></td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="2"><%=m.getMemberName() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="2"><%=m.getEmail() %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="2"><%=m.getPhone() %></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td colspan="2"><%=m.getEnrollDate() %></td>
					
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