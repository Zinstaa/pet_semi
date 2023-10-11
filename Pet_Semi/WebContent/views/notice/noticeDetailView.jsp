<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="com.kh.pet.notice.vo.*"
 %>
 
<%
	//공지사항 글을 가지고 온다.
	Notice n = (Notice)request.getAttribute("n");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 읽기</title>

<style>
	div{border : 1px solid blue;}
    
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
    
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>

    <div class="outer1">
        <h2 align="center">공지사항</h2>
		<br>
            <div id="title-area">
                <table>
                    <tr>
                        <td id="title"><%=n.getNoticeTitle() %></td>
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
                    </tr>
                </table>
            </div>
            <div id="content-area">
               
                <%=n.getNoticeContent() %>

                
            </div>
            <div id="button-area">
            	<button id="pre">◀이전글</button>
            	<button id="next">다음글▶</button>
                <button id="list">목록≡</button>
            </div>
            <script>
			$(function(){
				$('#pre').click(function(){
					location.href = '<%=contextPath%>/detail.no?nno=<%=n.getNoticeNo() -1 %>';
				})
			})
			</script>
        
    </div>
    
    
</body>
</html>