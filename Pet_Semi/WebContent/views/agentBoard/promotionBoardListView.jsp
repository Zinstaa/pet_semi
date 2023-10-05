<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.promotionBoard.model.vo.PromotionBoard" %>
<%
	ArrayList<PromotionBoard> list = (ArrayList<PromotionBoard>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍보게시판(사진)리스트 뷰에요~</title>

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">홍보게시판(사진)</h2>
        <br>
        <% if(loginUser != null) { %> <!--loginUser가 업체유저일 경우에만 게시판 작성하기 가능.. 어떻게 해야할지 약간 고민됨... ex) loginUser.AgentUser --> 
            <div style="width:870px;" align="right">
                <a href="#" class="btn btn-sm btn-info">게시물 작성</a>
            </div>
        <% } %>
        <div class="list-area">
            <% if(list.isEmpty()) { %> 
             등록된 게시글이 없네요.... <br>
             <% } else { %>
                <% for(PromotionBoard pb : list) { %>
            		<div class="promotion" align="center">
                        <input type="hidden" value="<%= %>">
	                	<img src="<%= %>">
	                	
                	</div>

                    
                <% } %>
            <% } %>
        </div>
        </div>

        } %> 
    </div>
</body>
</html>