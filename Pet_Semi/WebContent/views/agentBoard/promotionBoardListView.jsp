<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.agent.model.vo.PromotionBoard" %>
<%
	ArrayList<PromotionBoard> list = (ArrayList<PromotionBoard>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍보게시판(사진)리스트 뷰에요~</title>
<style>
    .list-area{
        text-align: center;
        border : 1px solid yellowgreen;
    }
    .promotion{
        border : 1px solid yellowgreen;
        width : 300px;
        display : inline-block;
        margin: 7px;
        background-color: lightyellow;
    }
    .promotion > img{
        width: 250px;
        height: 200px;
        padding: 10px;
    }
    .promotion:hover{
        cursor: pointer;
        opacity: 0.9;
    }
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
                        <input type="hidden" value="<%= pb.getPromotionBoardNumber() %>">
	                	<img src="<%= pb.getPromotionTitleImg() %>">
	                	
                	</div>

                    <script>
                        $(function(){
                            $('.promotion').click(function(){
                                // 클릭할 때마다 url요청 => location.href
                                const bno = $(this).children().eq(0).val();
                                location.href = '<%=contextPath%>/detail.th?bno=' + bno;
                            })
                        })
                    </script>
                <% } %>
            <% } %>
        </div>
        </div>

        } %> 
    </div>
</body>
</html>