<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<PromotionBoard> list = (ArrayList<PromotionBoard>)request.getAttribute("list");
%>
<%@ page import="java.util.ArrayList, com.kh.pet.promotionBoard.model.vo.PromotionBoard" %>
<!-- 화면 맨 상단에 스크립트를 써서 이 안에서 화면에 있는 내용 뿌릴거야 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍보게시판(사진)리스트 뷰에요~</title>
<style>
	.outer9{
	background-color:white;
	cursor: url(https://cur.cursors-4u.net/nature/nat-10/nat909.cur), auto !important;
	}
	.list-area{
	text-align:center;
	border:1px solid gray;
	}
	
	.promotion{
	border:1px solid gray;
	width:300px;
	display: inline-block;
	margin:7px;
	background-color:lightgray;
	}
	
	.promotion > img {
	width:300px;
	height:300px;
	padding:10px;
	}
	
	.promotion:hover{
	cursor:url(https://cur.cursors-4u.net/nature/nat-10/nat909.cur), auto !important;
	opacity:0.9;
	}

</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer9">
    
        <br>
        <h2 align="center">홍보게시판(사진)</h2>
        <br>

        <% if(loginUser != null) { %>
            <div style="width: 870px;" align="right">
                <a href="<%=contextPath%>/promotionEnroll.pr" class="btn btn-sm btn-primary">게시글작성하기</a>
            </div>
        <% } %> 
        
        <div class="list-area">
        
        	<% if(list.isEmpty()) { %>
        	<!-- 등록된 게시글이 없을경우 -->
        	등록된 게시글이 없습니다. <br> 
        	<% } else { %>
        	<!-- 게시글이 존재할 경우  -->
        	<!--  조회된 개수만큼 보여줄거니까 반복문 사용하기 -->
        	<% for(PromotionBoard pb : list) { %>
        	<div class="promotion" align="center">
        		<input type="hidden" value="<%= pb.getPromotionNo() %>">
				<img src="<%=pb.getTitleImg() %>" >
				<p>
					No. <%= pb.getPromotionNo() %> / <%= pb.getPromotionTitle() %> <br>
					조회수 : <%= pb.getPromotionView() %>
				</p>
        	</div>
        	<% } %>
        <% } %>
        </div>
        <br><br>
    </div>

	<script>
		$(function(){

			$('.promotion').click(function(){
				// 클릭할 때마다 url 요청 => location.href
				const pno = $(this).children().eq(0).val();

				location.href = '<%=contextPath%>/promotionDetail.pr?pno=' + pno;

			})
		})
	</script>
   
</body>
</html>