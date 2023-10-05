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

        <% if(loginUser != null) { %>
            <div style="width: 870px;" align="right">
                <a href="<%=contextPath %>/PromotionEnrollForm.pe" class="btn btn-sm btn-primary">게시글작성</a>
            </div>
        <% } %> 

        <div class="list-area">
            <!-- 등록된 게시글이 없을 경우 -->
            등록된 게시글이 없어.
            <!-- 등록된 게시글이 존재해. -->
            <div class="promotion" align="center">
                <img src="https://ibb.co/wg3Ch3s" alt="노을">
                <p>
                    no.1 / 노을<br>
                    조회수 : 12 
                </p>
            </div>
        </div>
        
    </div>
</body>
</html>