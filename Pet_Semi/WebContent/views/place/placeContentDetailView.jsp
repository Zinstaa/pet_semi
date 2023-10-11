<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.place.model.vo.*" %>
<%
	Place p = (Place)request.getAttribute("p");
	ArrayList<PlaceFile> list = (ArrayList<PlaceFile>)request.getAttribute("list"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이스</title>
<style>
    div {
        box-sizing: border-box;
        border: 1px solid black;
    }
    h2 {
        text-align: center;
    }

    h3 {
        padding-top: 20px;
        text-align: center;
    }

    /* place_detail_main 부분 */
    #place_detail_main {
        width: 1200px;
        height: 2000px;
        margin: auto;
        padding-top: 125px;
    }

    /* place_nav_bar 부분 */
    #place_nav_bar {
        margin-top: 20px;
        background-color: #ffce50;
        height: 50px;
        margin: auto;
        border-radius: 33px;
    }

    #place_nav_bar > a > img {
        margin-top: 10px;
        margin-left: 10px;
        width: 40px;
        height: 40px;
    }

    /* place_detail_content 부분 */
    #place_detail_content {
        width: 80%;
        height: 90%;
        margin: auto;
        border: 1px solid lightgray;
        border-radius: 30px;
    }

    #place_detail_content > div{
        width: 100%;
    }
    
    /* place_detail_image_info 부분 */
    #place_detail_image_info {
        height: 25%;
    }
    
    /* place_detail_info 부분 */
    #place_detail_info {
        height: 55%;
    }
    /* place_detail_review 부분 */
    #place_detail_review {
        height: 20%;
    }

    /* 맨위로 이동 키 */
    #top {
        float: right;
        height: 50px;
        width: 50px;
        margin-right: 30px;
    }
    
    #toTop {
        height: 50px;
        width: 50px;
        margin: auto;
        background-color: #ffce50;
        border-radius: 50px;
        color: black;
        text-decoration: none;
        position: fixed;   /* 포지션 고정 */
        bottom: 175px;     /* 밑에서 175px */
        display: none;     /* 보여지지 없음 - 기본적으로  안보여지게 */
        z-index: 9999;     /* 포지션을 먼저 지정후 z-좌표(레이어) : 9999입니다. */
    }

    #toTop > img {
        position: absolute;
        width: 24px;
        height: 24px;
        top: 3px;
        left: 13px;
    }
    

</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <div id="place_detail_main">
        <h2> 플레이스 </h2>

        <div id="place_nav_bar">
            <a href="<%= contextPath %>/place.pl">
                <img src="https://svgsilh.com/svg/97591-ffffff.svg" alt="목록으로">
            </a>
        </div>

        <h3> [<%= p.getPlaceCategoryName() %>] - [<%= p.getLocalCategoryName() %>] </h3>

        <div id="place_detail_content">
            <div id="place_detail_image_info">


            </div>

            <div id="place_detail_info">

            </div>
            <div id="place_detail_review">

            </div>
        </div>



    </div>












	
	<div id="top">
        <a id="toTop" href="#">
           <img src="https://svgsilh.com/svg/147174.svg" alt="맨위로"><br>
           &nbsp;&nbsp;TOP
        </a>
    </div>

    <script>
        $(function() {
            // 보이기 | 숨기기
            $(window).scroll(function() {
            if ($(this).scrollTop() > 500) { //250 넘으면 버튼이 보여짐니다.
                    $('#toTop').fadeIn();
                    $('#toTop').css('left', $('#sidebar').offset());  // #sidebar left:0 죄표
                    } else {
                    $('#toTop').fadeOut();
            }
            });
            // 버튼 클릭시
            $("#toTop").click(function() {   
            $('html, body').animate({
            scrollTop : 0    // 0 까지 animation 이동합니다.
            }, 400);          // 속도 400
            return false;
            });
        });
    </script>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>