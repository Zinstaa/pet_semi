<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.util.ArrayList, com.kh.pet.member.model.vo.Member"
 %>
 <%
 	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>

<style>
	
	#memberlist>tbody>tr:hover{
	cursor : pointer;
	background-color : yellow;
	
	}

	#memberlist *{
		border : solid 1px black;
		
	}

	.outer1{
        width: 1200px;
		height: 750px;
        margin : auto;
		padding-top: 125px;
        color: black;
    }

</style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
	<!-- 회원 검색창 -->
<div class="outer1">
	<h2 align="center">회원관리</h2>
	<div>
		
			<table id="search-table">
				<tr>
					<th>검색조건</th>
					<td>
						<select id="member-condition" name="search-list">
							<option value="MEMBER_NO">회원번호</option>
							<option value="MEMBER_ID">아이디</option>
							<option value="MEMBER_NAME">회원이름</option>
							<option value="EMAIL">이메일</option>
							<option value="PHONE">휴대폰번호</option>
							<option value="NICKNAME">닉네임</option>

						</select>
					</td>
				</tr>
				<tr id="search-btn">
					<th>검색어</th>
					<td><input type="text" id="member-search" name="search-value"></td>
					<td></td>
					<td>
						<button onclick="search();" class="btn btn-sm btn-primary">검색</button>
					</td>
					<td></td>
					<td>
						<button type="reset" class="btn btn-sm btn-danger">리셋</button>
					</td>
					<td></td>
				</tr>
			</table>

		
	</div>
	<div>
		<table id="memberlist">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원아이디</th>
					<th>회원이름</th>
					<th>이메일</th>
					<th>휴대폰번호</th>
					<th>닉네임</th>
					<th>가입일</th>
					<th>회원상태</th>
				</tr>
			</thead>
			<tbody>
				  
			</tbody>
			<!-- 
			<tbody>
				<tr>
					<th>1000</th>
					<th>asddd</th>
					<th>짱구</th>
					<th>asdlf@gmail.com</th>
					<th>010-1231-2333</th>
					<th>똘끼</th>
					<th>2022-21-12</th>
					<th>U</th>
				</tr>
			
			</tbody>
			 -->
		</table>
	</div>
</div>
	<script>
		function search(){
			//회원 조회 기능 (검색)
			$.ajax({
				//ajax란 서버로 부터 데이터를 가져와서 젠체 페이지 만들지 않고 일부만 로드해서 내용 변경
				url : 'search.me',
				data : {
					memberCondition : $('#member-condition').val(),
					memberSearch : $('#member-search').val()
				},
					
				success : function(result){
					console.log(result);
					let resultList = '';
					if(result.length > 0){
						for(let i =0; i < result.length; i++){
							resultList += '<tr class="list">'
									+ '<td>' + result[i].memberNo + '</td>'
									+ '<td>' + result[i].memberId + '</td>'
									+ '<td>' + result[i].memberName + '</td>'
									+ '<td>' + result[i].email + '</td>'
									+ '<td>' + result[i].phone + '</td>'
									+ '<td>' + result[i].nickName + '</td>'
									+ '<td>' + result[i].enrollDate + '</td>'
									+ '<td>' + result[i].status + '</td>'
									+ '</tr>'
						}
					}else{
						resultList = '<td colspan="8">검색 결과가 없습니다.</td>';
					}
					$('#memberlist tbody').html(resultList);
				},
				error : function(){
					console.log('AJAX실패')
					console.log(result);
				}
			})
		}
		
		//회원 상세정보 보기 기능
		$(function(){
			$('#memberlist>tbody').on('click','tr',function(){
				console.log(this);
				console.log(location.href);
				//http://localhost:9999/pet/member.me
				console.log($(this).children().eq(0).text());
				const mno = $(this).children().eq(0).text()
				//회원 상세페이지 만들어주고 전달하기.
				location.href="<%=contextPath%>/detail.me?mno="+mno;
				
			});
		});
	
	</script>

</body>
</html>