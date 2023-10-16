<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@
	page import="com.kh.pet.notice.vo.*"
 %>
 
<%
	//공지사항 글을 가지고 온다.
	Notice n = (Notice)request.getAttribute("n");
	NoticeFile nf = (NoticeFile)request.getAttribute("nf");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정하기</title>
<style>
	div{border : 1px solid blue;}
    #update-form{
    	width : 100%;
    	height : 100%;
    }
    .title-area-inform{
        margin : 0;
        margin-left : 30px;
        display:inline-block;
    }

    .title-area-inform > span {
        position: relative;
        padding-right : 20px;
        
    }
    .title-area-inform > span:after {
        position: absolute;
        content : '';
        right: 9px;
        height: 24px;
        width: 1px;
        background: #ccc;
    }

    .outer1{
        width: 1200px;
		height: 750px;
        margin : auto;
		padding-top: 125px;
        background-color: #fff5ce;
        color: black;
    }
    #title{
        font-size: 25px;
        font-weight: 500;
    }
    #inform{
        text-align: right;
    }
	#content-area{
		width : 100%;
		height: 80%;
		
	}
	#button-area{
		text-align : right;
		
	}
	#button-area>button{
		margin-right : 1%;
	}

    #file-area>table>tr>th{
        margin-right : 30%;
    }
    #content{
        resize: none;
        width: 100%;
        height: 100%;
    }
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>

    <div class="outer1">
        <h2 align="center">공지사항</h2>
		<br>
        <form enctype="multipart/form-data" action="<%=contextPath%>/update.no" id="update-form" method="post">
            <input type="hidden" name="noticeNo" value="<%=n.getNoticeNo() %>">
            <div id="title-area">
                <table>
                    <tr>
                        <td id="title"><input type="text" name="title" value="<%=n.getNoticeTitle() %>"></td>
                        <td id="inform">
                            <p class="title-area-inform">
                                <span>작성일</span>                            
                                <%=n.getNoticeDate() %>
                            </p>
                            <p class="title-area-inform">
                                <span>작성자</span>
                                <%=n.getMemberNo() %>
                            </p>
                        </td>
                        <td>
                        
                        </td>
                        
                    </tr>
                </table>
            </div>
            <div id="content-area">
                <textarea name="content" id="content"><%=n.getNoticeContent() %></textarea>
            <!--
                <br>
            <%if(nf != null) {%>
                <img src="<%=contextPath %>/<%=nf.getNoticeFilePath() %>/<%=nf.getNoticeFileChangeName() %>" id="img" width="250" height="180">
            <%} %>
            -->
            </div>
            <div id="file-area">
            	<table>
                    <tr>
                        <th>첨부파일</th>
                        <td>|</td>
                            <%if(nf != null) { %>
                        <td>
                        	<%= nf.getNoticeFileChangeName() %>
                        </td>
                            <input type="hidden" name="originFileNo" value="<%=nf.getNoticeFileNo() %>">
						  	<input type="hidden" name="originalFileName" value="<%=nf.getNoticeFileChangeName() %>">
                               
                            <%} %>
                        <td>
                        <input type="file" name="reUpfile">
                        </td>
                    </tr>
                </table>
            </div>
            <div id="button-area">
                <button type="submit" class="btn btn-sm btn-warning">수정하기</button>
                <a href="<%=contextPath%>/list.no?cpage=1" class="btn btn-sm btn-info">목록≡</a>
            </div>
        </form>
</body>
</html>