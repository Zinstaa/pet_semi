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

<!-- swiper.js 라이브러리추가 -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

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
        height: 2400px;
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

        height: 90%;
        margin: auto;
        border: 1px solid lightgray;
        border-radius: 30px;
        background-color: #fff5ce;
    }

    #place_detail_content > div{
        width: 100%;
    }
    


    /* place_detail_image_info 부분 */
    #place_detail_image_info {
        height: 25%;
    }

    #place_detail_image_info > div {
        height: 100%;
        float: left;
    }

    /* place_detail_info 부분 */
    #place_detail_info {
        height: 60%;
    }

    /* place_detail_review 부분 */
    #place_detail_review {
        height: 15%;
    }





    /* place_detail_image 부분 */
    #place_detail_image {
        width: 60%;
    }

    /* place_detail_other_info 부분 */
    #place_detail_other_info {
        width: 40%;
    }

    #place_detail_other_info > div {
        width: 100%;
    }

    /* place_detail_place_info 부분 */
    #place_detail_place_info {
        height: 60%;
    }

    /* place_info 부분 */
    #place_info {
        height: 80%;
        width: 90%;
        margin: auto;
        margin-top: 45px;
        margin-left: 5px;
        border: 1px solid lightgray;
        border-radius: 20px;
        padding-top: 20px;
        padding-left: 10px;
        background-color: #e0bc93;
    }

    #place_info > h2 {
    	text-align: left;
        margin-bottom: 20px;
    }

    #place_info > h6 {
        text-align: left;
    }






    /* place_detail_caution 부분 */
    #place_detail_caution {
        height: 40%;
    }





    

    /* swiper 라이브러리 css */
    /* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 650px;
        height: 450px;
        margin-top: 30px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;

    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : #ffce50;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }

	/* 슬라이드 바색 변경 (기본색은 파란색) */
    .swiper-pagination-bullet { 
        width: 12px; height: 12px; background: transparent; border: 1px solid #ffce50; opacity: 1; 
    }
    .swiper-pagination-bullet-active { 
        width: 40px; transition: width .5s; border-radius: 5px; background: #ffce50; border: 1px solid transparent; 
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
                <div id="place_detail_image">
                    <div id="content_1">
                        <div class="swiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="<%= contextPath %>/<%= list.get(0).getPlaceFilePath()%>/<%= list.get(0).getPlaceFileChangeName() %> "></div>
                                <div class="swiper-slide"><img src="https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?fit=476%2C280&ssl=1"></div>
                                <div class="swiper-slide"><img src="https://i.namu.wiki/i/L6iuHgsPod0cHQLXQ3jfyCFcJ1OSIG6MuE7ChjDTVqVJeBkfdQsJeNOhmuqu4_ESrYCLxDaN8xREnufFD_9LUw.gif"></div>
                                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"></div>
                                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"></div>
                            </div>
                        
                            <div class="swiper-pagination"></div>
                        
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        
                        </div>
                    </div>
                </div>
                <div id="place_detail_other_info">
                    <div id="place_detail_place_info">
                        <div id="place_info">
                            <h2><%= p.getPlaceName() %></h2>
                            <h6>주소 : <%= p.getPlaceAddress() %></h6>
                            <h6>문의처 : <%= p.getPlacePhone() %></h6>
                            <h6>이용시간 : <%= p.getPlaceTimes() %></h6>
                            <h6>홈페이지 : <%= p.getPlaceUrl() %></h6>
                        </div>
                    </div>
                    <div id="place_detail_caution">
						<h2 style="margin-top: 20px;">※ 주의사항 ※</h2>
						<%= p.getPlaceCaution() %>
                    </div>
                </div>
            </div>

            <div id="place_detail_info">

            </div>
            <div id="place_detail_review">

            </div>
        </div>



    </div>

    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 4000 // 4초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 

        $(".swiper-pagination").on("click", function(){
            swiper.autoplay.start();
        })

        $(".swiper-button-prev").on("click", function(){
            swiper.autoplay.start();
        })

        $(".swiper-button-next").on("click", function(){
            swiper.autoplay.start();
        })
    </script>












	
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