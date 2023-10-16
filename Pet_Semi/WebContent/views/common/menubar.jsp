<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.pet.member.model.vo.Member" %>
<%
Member loginUser = (Member)session.getAttribute("loginUser");

String alertMsg = (String)session.getAttribute("alertMsg");
String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 바</title>
<!-- Noto Sans Korean 글꼴 추가 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&display=swap" rel="stylesheet">

<!-- Bootstrap 4 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- menubar.css 추가 -->
<link rel="stylesheet" href="resources/css_files/menubar.css?after" type="text/css">
</head>
<body>
<script>
		var msg = '<%= alertMsg %>';
		if(msg != 'null'){
		   alert(msg);
		}  
	<% session.removeAttribute("alertMsg"); %>
</script>

   <br><br>
   <!-- 로고 위치 -->
 <div class="header">
      <div class="head_logo">
         <h1>어댕가지~?</h1>
      </div>
      <div class="head_login">
         <% if(loginUser==null) {%>
         <div id="member_login"style="margin-top: 30px;">
            <div id="login">
               <button type="button" class="btn btn-link" onclick="loginPage();">로그인</button>
            </div>
            <div id="bar">
               &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            </div>
            <div id="access">
               <button type="button" class="btn btn-link" onclick="enrollPage()">회원가입</button>
            </div>
            <div id="bar">
               &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            </div>
         </div> <!--id="member_login" 닫히는부분-->
         <div id="search" style="margin-top: 30px;">
            <input type="button" id="btn_img">
         </div>
         <%} else { %>
         <b><%= loginUser.getMemberName() %></b>님 환영합니다~~! <br>
         <div id="login_info">
            <div id="mypage">
               <a href="<%= contextPath %>/mypage.me">마이페이지 </a>
            </div>
            <div id="bar">
               &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            </div>
            <div id="logout">
               <a href="<%=contextPath %>/logout.me">&nbsp;로그아웃</a>
            </div>
            <div id="bar">
               &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            </div>
         </div>
         <div id="search">
            <input type="button" id="btn_img">
         </div>
         <%} %>
         
         <div id="admin_login" ><!--style="display: none;"-->
            <table>
               <tr>
                  <td><a href="<%=contextPath%>/member.me">회원관리</a></td>
                  <td> &nbsp; | &nbsp; </td>
                  <td><a href="#">리뷰관리</a></td>
               </tr>
            </table>
         </div>
         
      </div> <!-- <div class="head_login"> 닫히는부분 -->
         <script>
            function loginPage(){
               location.href = "<%= contextPath %>/login.mem"
            }
            function enrollPage(){
            	location.href = "<%= contextPath %>/enroll.me"
            	
            }
         </script>
         
         
      </div>
   </div>

   <br>
   <!-- 네비게이션 바 위치 -->
   <div class="navbar justify-content-center sticky-top" >
      <ul>
         <div class="menu" id="ma">
            <li>
               <a href="<%= contextPath %>/">HOME</a>
            </li>
         </div>
         <div class="menu" id="pl">
            <li>
               <a href="<%= contextPath %>/place.pl?ppage=1">플레이스</a>
            </li>
         </div>
         <div class="menu" id="co">
            <li>
               <a class="nav_sub">커뮤니티</a>
               <ul>
                  <li><a href="<%= contextPath %>/list.bo?cpage=1">자유게시판</a></li>
                  <li><a href="<%= contextPath %>/promotionList.pr">홍보게시판</a></li>
               </ul>
            </li>
         </div>
         <div class="menu" id="al">
            <li>
               <a href="#">알림 / 소식</a>
            </li>
         </div>
         <div class="menu" id="me">
            <li>
               <a class="nav_sub">고객센터</a>
               <ul>
                  <li><a href="<%=contextPath%>/list.no?cpage=1">공지사항</a></li>
                  <li><a href="#">Q & A</a></li>
                  <li><a href="#">1 : 1 문의</a></li>
               </ul>
            </li>
         </div>
      </ul>
   </div>

</body>
</html>
