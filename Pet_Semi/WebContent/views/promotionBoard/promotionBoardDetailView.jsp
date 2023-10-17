<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.promotionBoard.model.vo.*" %>
<%
    PromotionBoard pb = (PromotionBoard)request.getAttribute("pb");
    ArrayList<PromotionFile> list = (ArrayList<PromotionFile>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍보게시판의 게시물을 상세히 볼수 있답니다~</title>
<style>
	.outer9_1{
	background-color:white;
	width:360px;
	height:800px;
	margin:auto;
	}
    
</style>
</head>
<body>

<%@ include file="../common/menubar.jsp" %>

    <div class="outer9_1">
        <br>
        <h2 align="center" style="font-size: 30px;">저희 가게와 행사를 소개합니다.</h2>

        <table align="center" border="1" id="promotionDetail-form">
            <tr>
                <th type="hidden" width="90" style="font-size:10px;">제목</th>
                <td colspan="5" style="font-size:30px;"><%=pb.getPromotionTitle() %></td>
            </tr>
            <tr>
                <th style="color:lightgray;">작성자</th>
                <td style="weight:20%; color:lightgray;"><%=pb.getPromotionWriter() %></td>
                <th>행사일정</th>
                <td><%=pb.getPromotionEventDate() %></td>
                <th style="color:lightgray;">작성일</th>
                <td style="color:lightgray;"><%=pb.getPromotionDate() %></td>
            </tr>
            
            <tr>
            	<th>내용</th>
            	<td colspan="5">
            		<p style="height:100%; font-weight:30;">
            			<%= pb.getPromotionContent() %>
            		</p>
            	</td>
            </tr>

            <tr>
                <th>대표이미지</th>
                <td colspan="5" align="center">
                    <img src="<%= contextPath %>/<%= list.get(0).getPromotionFilePath() %>/<%= list.get(0).getPromotionFileChangeName() %>" alt="대표이미지" id="titleImg" width="350" height="280">
                </td>
            </tr>
            <% for(int i = 1; i < list.size(); i++) { %>
            <tr>
            	<td>상세이미지-<%= i %></td>
            	<td><img src="<%= contextPath %>/<%=list.get(i).getPromotionFilePath()%>/<%=list.get(i).getPromotionFileChangeName()%>" alt="상세이미지<%=i %>" id="contentImg<%=i %>" width="350" height="280"></td>
            	<% } %>
            </tr>
        </table>
        <br>
        <div>
        	<a href="<%= contextPath %>/promotionList.pr?cpage=1" class="btn btn-sm btn-info">목록으로</a>
        	<br>
        </div>
    </div>
	
</body>
</html>