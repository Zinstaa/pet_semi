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
        border : 2px solid red;
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
		height: 80%;
		
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
    
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>

    <div class="outer1"> 
        
            <form action="">
                <div id="title-area">
                        <table>
                            <tr>
                                <td id="title">제목 <input type="text"></td>
                                <td id="inform">
                                    <p class="title-area-inform">
                                        <span>작성일</span>                            
                                        <%=strDate %>
                                    </p>
                                    <p class="title-area-inform">
                                        <span>작성자</span>
                                    
                                    </p>
                                </td>
                            </tr>
                        </table>
                </div>
                <div id="content-area">
                    <textarea name="content" id="content"></textarea>
                </div>
                <div id="button-area">
                    <button type="submit">작성</button>
                    <button>목록으로</button>
                </div>
            </form>
            
    </div>
</body>
</html>