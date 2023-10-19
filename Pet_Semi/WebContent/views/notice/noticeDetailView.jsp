<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="com.kh.pet.notice.vo.*, java.util.HashMap"
 %>
 
<%
	//공지사항 글을 가지고 온다.
	//조회를 해올 때 앞글 뒷글 번호도 같이 조회 해온다.(이전글, 다음글 하기위해서)l
	Notice n = (Notice)request.getAttribute("n");
	NoticeFile nf = (NoticeFile)request.getAttribute("nf");
	HashMap<String, Object> map = (HashMap<String, Object>)request.getAttribute("map");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 읽기</title>

<style>
    
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
                        <td>
                        
                        </td>
                        
                    </tr>
                </table>
            </div>
            <div id="content-area">
                <%=n.getNoticeContent() %>
                <br>
            	<%if(nf != null) {%>
                	<img src="<%=contextPath %>/<%=nf.getNoticeFilePath() %>/<%=nf.getNoticeFileChangeName() %>" id="img" width="250" height="180">
            	<%} %>
            </div>
            <div id="file-area">
            	<table>
                    <tr>
                        <th>첨부파일</th>
                        <td>|</td>
                        <td>
                            <%if(nf == null) { %>
                            첨부파일 없어요
                            <%}else{ %>
                                <a href="<%=contextPath %>/<%=nf.getNoticeFilePath() %>/<%=nf.getNoticeFileChangeName() %>" download="<%=nf.getNoticeFileChangeName()%>"><%=nf.getNoticeFileChangeName()%></a>
                               
                            <%} %>

                        </td>
                    </tr>
                </table>
            </div>
            
            <div id="button-area">
            	
            	<button id="pre">◀이전글</button>
            	<button id="next">다음글▶</button>
            	
                <a href="<%=contextPath%>/list.no?cpage=1" class="btn btn-sm btn-info">목록≡</a>
                 <%if(loginUser !=null && loginUser.getMemberId().equals(n.getMemberNo())){ %>
		            <a href="<%=contextPath%>/updateForm.no?nno=<%=n.getNoticeNo()%>" class="btn btn-sm btn-warning">수정하기</a>
		            <a href="<%=contextPath%>/delete.no?nno=<%=n.getNoticeNo()%>" class="btn btn-sm btn-danger" onclick="return deleteCheck()">삭제하기</a>
		            <!--  <a href="<%=contextPath%>/delete.no?nno=<%=n.getNoticeNo()%>" class="btn btn-sm btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')">삭제하기</a>-->
		           <%} %>
            </div>
            <script>
           
            function deleteCheck(){
            	var check = confirm('정말 삭제하시겠습니까?');
            	return check;
            }
            
			$(function(){
				//마지막 글일 경우 다음글 버튼이 사라짐
				if(<%=map.get("nextNo")%> == "-1"){
					$('#next').hide();
				}
            	//첫 글일 경우 이전글 버튼이 사라짐
            	if(<%=map.get("preNo")%> == "0"){
					$('#pre').hide();
				}
				
				//이전글로 이동하는 버튼 
				//preNo는 해당 게시글 불러올때 이전글 번호도 불러와 map에 담아왔음
				$('#pre').click(function(){
					location.href = '<%=contextPath%>/detail.no?nno=<%=map.get("preNo") %>';
				})
				//다음글로 이동하는 버튼 
				//nextNo는 해당 게시글 불러올때 다음글글 번호도 불러와 map에 담아왔음
				$('#next').click(function(){
					location.href = '<%=contextPath%>/detail.no?nno=<%=map.get("nextNo") %>';
				})
			})
			</script>
        
    </div>
    
    
</body>
</html>