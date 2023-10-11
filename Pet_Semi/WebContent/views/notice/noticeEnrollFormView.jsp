<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = simpleDate.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>

<style>
	div{border : 1px solid blue;}
    
    .outer1{
        width: 1200px;
		height: 750px;
        margin : auto;
		padding-top: 125px;
        background-color: #fff5ce;
        color: black;

    }
    
    #title-area{
        width : 100%;
        height: 10%;
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
    #title{
        width : 70%;
        font-size: 25px;
        font-weight: 500;
    }
    #title>input{
        width : 90%
    }
    #inform{
        width : 30%;
        text-align: right;
    }
	
    #content-area{
		width : 100%;
		height: 440px;
		
	}
    #content{
        resize: none;
        width: 100%;
        height: 100%;
    }
	#button-area{
        width : 100%;
        height: 10%;
		text-align : right;
		
	}
	#button-area>button{
		margin-right : 1%;
	}

    #upfile{
        border: 1px solid black;
        padding-right: 10%;
    }
    
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>

    <div class="outer1"> 
        <h2 align="center">공지사항</h2>
		<br>
            <form enctype="multipart/form-data" action="<%=contextPath%>/insert.no" id="enroll-form" method="post">
            	<input type="hidden" name="memberNo" value="<%=loginUser.getMemberNo()%>">
                <div id="title-area">
                        <table>
                            <tr>
                                <td id="title">제목 <input type="text" name="title"></td>
                                <td id="inform">
                                    <p class="title-area-inform">
                                        <span>작성일</span>                            
                                        <%=strDate %>
                                    </p>
                                    <p class="title-area-inform">
                                        <span>작성자</span>
                                    	<%=loginUser.getMemberId()%>
                                    </p>
                                </td>
                            </tr>
                        </table>
                </div>
                <div id="content-area">
                    <textarea name="content" id="content"></textarea>
                </div>
                <div>
                    <input type="file" name="upfile" id="upfile">
                </div>
                <div id="button-area">
                    <button type="submit">작성</button>
                    <button>목록으로</button>
                </div>
                
            </form>
            
    </div>
</body>
</html>