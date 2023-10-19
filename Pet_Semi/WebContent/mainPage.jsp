<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어댕가지~?</title>

<!-- swiper.js 라이브러리 추가 -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<!-- mainpage.css 추가-->
<link rel="stylesheet" href="resources/css_files/common/mainpage.css">

<style>
    div{
        border: 1px solid black;
        box-sizing: border-box;
    }
    /* swiper 라이브러리 css */
    /* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 1024px;
        height: 500px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 88%;
        height : 100%;
        margin-left: 60px;
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

    #content_2{
        width: 1200px;
        height: 100%;
        margin: auto;
        margin-top: 30px ;
    }

    #head_logo{
        width: 255px;
        height: 130px;
        
    }

    #head_logo > img {
        width: 250px;
        height: 125px;

    }

    #content_main {
        margin-top: 20px;
    }

    #content_main h3 {
        font-weight: 300;
    }

    #span{
        margin-bottom: 10px;
        display: block;
        font-weight: lighter;
    }

    #strong{
        margin-bottom: 10px;
        display: block;
        font-weight: bold;
    }

    #content_text1{
        margin-top: 20px;
        height: 500px;
        width: 100%;
    }
    
    .circle {
        float: left;
        height: 300px;
        width: 300px;
        background-image: linear-gradient(lightyellow, #ffce50);
        border: 1px solid lightyellow;
        border-radius: 150px;
        margin-top: 50px;
        margin-left: 200px;
    }
    .circle > h2 {
        text-align: center;
        line-height: 50px;
    }

    .circle > h6 {
        text-align: right;
    }
</style>

</head>
<body>
	<%@ include file = "views/common/menubar.jsp" %>
	<div id="content_1">
        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
				<div class="swiper-slide"><img src="https://img.freepik.com/free-photo/adorable-chihuahua-dog-with-female-owner_23-2149880082.jpg?size=626&ext=jpg&ga=GA1.1.1990079417.1697606118&semt=ais"></div>
                <div class="swiper-slide"><img src="https://img.freepik.com/free-photo/cute-shiba-inu-pet-with-family_23-2149428972.jpg?size=626&ext=jpg&ga=GA1.1.50944861.1697605529&semt=ais"></div>
                <div class="swiper-slide"><img src="https://img.freepik.com/free-photo/full-shot-man-sitting-with-dog-in-nature_23-2149013777.jpg?w=1380&t=st=1697605563~exp=1697606163~hmac=1f0f4da0819b2139569667237f93270abd74240008f5d99cf0ac2aedc0d98ccb"></div>
                <div class="swiper-slide"><img src="https://dangdangmap.net/upload/popupzone/PPMAIN01/popupzone_PPMAIN01_20230201100756.jpg"></div>
                <div class="swiper-slide"><img src="https://dangdangmap.net/upload/popupzone/PPMAIN01/popupzone_PPMAIN01_20230201100638.jpg"></div>
                <div class="swiper-slide"><img src="https://img.freepik.com/free-photo/side-view-owner-walking-with-dog_23-2149457838.jpg?size=626&ext=jpg&ga=GA1.1.50944861.1697605529&semt=ais"></div>
            </div>
        
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
            <!-- If we need scrollbar -->
            <!-- <div class="swiper-scrollbar"></div> -->
        </div>
    </div>

    

    <div id="content_2">
        <div id="head_logo">
            <img src="resources/common_files/logo.svg" alt="어댕가지 로고">
        </div>
        <div id="content_main">
            <h2>
                <span id="span">우리 댕댕이와 함께 즐겁고 편리하게!</span>
            </h2>
            <h3>
                <strong id="strong">주인 우리 어디가~? 어댕가지~?!</strong>
            </h3>
        </div>
        <div id="content_text1">
            <h5>우리나라 반려견 가구 규모수는 *500만을 돌파했습니다. </h5>
            <h5>현재에 이르러서도 그 수가 증가하고 있는데요,  반려견을 포함해 고양이, 앵무새 등의 반려동물이 있는 가구 규모수는 약 1200만명이라고 합니다. </h5> 

                <div class="circle">
                    <h2><br><br>반려가구<br>500만명<br><br></h2>
                </div>
                <div class="circle">
                    <h2><br><br>반려인<br>1200만명<br><br></h2>
                    <br><br><br>
                    <h6>* 2023년 기준(한국 반려동물보고서) </h6>
                </div>

        </div>
        <div>asdasd</div>
        <div></div>
    </div>
    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 3000 // 3초마다 이미지 변경
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
            if ($(this).scrollTop() > 500) { // 500 넘으면 버튼이 보여짐니다.
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
    
	<%@ include file = "views/common/footer.jsp" %>
</body>
</html>