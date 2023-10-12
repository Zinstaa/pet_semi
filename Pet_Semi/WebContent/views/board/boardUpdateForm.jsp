<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.pet.board.model.vo.*, java.util.ArrayList" %>
<%
	Board b = (Board)request.getAttribute("b");
	BoardFile bf = (BoardFile)request.getAttribute("bf");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style>
	.outer1{
        width: 1200px;
		height: 750px;
        margin : auto;
        background-color: #fff5ce;
        margin-top: 5px;
        color: black;
    }
	#enroll-form > table{
        border: 1px solid gray;
    }

    #enroll-form input, #enroll-form textarea{
        width: 100%;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<div class="outer1">
        <br>
        <h2 align="center">게시글 수정</h2>
        <br>

        <form enctype="multipart/form-data" action="<%=contextPath%>/update.bo" id="enroll-form" method="post">
			
			
			<input type="hidden" name="boardNo" value="<%= b.getBoardNo() %>">

            <table align="center">
                <tr>
                    <th width="200">제목</th>
                    <td width="800"><input type="text" name="name" required value="<%= b.getBoardName() %>"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" style="resize:none;" rows="15"><%= b.getBoardContent() %></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
					<% if(bf != null) { %>
						<td>
							<%= bf.getBoardFileOriginName() %>
						</td>
						<input type="hidden" name="originBoardFileNo" value="<%= bf.getBoardFileNo() %>">
						<input type="hidden" name="originBoardFileName" value="<%= bf.getBoardFileChangeName() %>">
					<% } %>
                    <td><input type="file" name="reUpfile"></td>
                </tr>
            </table>
            <br><br>
            <div align="center">
                <button type="submit" class="btn btn-sm btn-primary">글작성</button>
            </div>
        </form>

    </div>

</body>
</html>