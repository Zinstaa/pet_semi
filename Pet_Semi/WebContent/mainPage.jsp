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
        <div class="content_head">
            <h1>어댕가지 소개</h1>
        </div>
        <div id="head_logo" class="content_head">
            <img src="resources/common_files/logo.svg" alt="어댕가지 로고">
        </div>
        <div id="content_main" class="content_head">
            <h2>
                <span id="span">우리 댕댕이와 함께 즐겁고 편리하게!</span>
            </h2>
            <h3>
                <strong id="strong">주인 우리 어디가~? 어댕가지~?!</strong>
            </h3>
        </div>
        <div id="content_info" class="content_head">
            <p>어댕가지는 '우리 댕댕이와 함께 하는 시간 즐겁고 편리하게' 라는</p>
            <p>주제를 가지고 생각했으며 어댕가지를 통해 사용자와 반려견들의</p>
            <p>편리한 생활에 도움이 되는 장소들을 안내하고 있습니다.</p>
        </div>
        <div id="content_text1">
            <h1>기획 배경</h1>
            <br>
            <h5>우리나라의 반려견 가구 규모수는 어느덧 *500만을 돌파했습니다. </h5>
            <h5>현재에 이르러서도 그 수가 증가하고 있는데요,  반려견을 포함해 고양이, 앵무새 등의 반려동물이 있는 가구 규모수는 약 1200만명이라고 합니다. </h5> 

            <div class="circle" >
                <h2><br><br>반려가구<br>500만명<br><br></h2>
            </div>
            <div class="circle">
                <h2><br><br>반려인<br>1200만명<br><br></h2>
                <br><br><br>
                <h6>* 2023년 기준(한국 반려동물보고서) </h6>
            </div>
        </div>
        <div id="content_text2">
            <h1>기획 의도</h1>
            <br>
            <h5>해마다 증가하는 반려동물들의 추세지만 막상 반려동물들과 각각의 장소들에 가려고 하면 장소마다에 제약 조건들이 결려있습니다. </h5>
            <h5>매번 장소에 방문할때마다 장소에 방문하기전에 정보들을 미리 찾아봐야한다거나 막상 찾아가더라도 정보가 달라 생기는 고충들이 있을 것입니다.</h5> 
            <h5>늘어나는 반려견 가구수에 비해 매장내 취식이 불가능하거나 반려동물 출입금지 등 사회적 기반이 여전히 부족하지만</h5>
            <h5>이러한 문제점등을 개선하여 각각의 정보를과 각 장소마다의 홍보등을 통해서 정보의 최신화가 이루어지고, </h5>
            <h5>사용자간의 정보 교환을 통해 편리한 반려생활을 할 수 있도록 어댕가지를 기획하게 되었습니다</h5>
            <img src="https://svgsilh.com/svg/98628.svg" alt="노노도그" id="nonodog">

        </div>
        <div id="content_text3" >

            <h5>어댕가지는 각각의 지역과 장소에 해당하는 </h5>
            <h5>여행지들을 소개하고 공유하는 공간입니다</h5>
            <br>
            <h5>반려동물 동반 업체의 사장님이시라면 어댕가지의 홍보기능을!</h5>
            <h5>여행을 준비하는 반려인이라면 다양한 여행 장소로 미리 정보를 획득!</h5>
            <br>
            <h5>어댕가지와 함께 여행이라는 추억을 선물 하세요!</h5>
            <img src="https://img.bemypet.kr/content/2023/02/13113843/%EB%A6%AC%EB%A6%AC%EB%A6%AC.png" alt="리리" id="lili">
            <img src="https://img.bemypet.kr/content/2023/02/13113300/%EC%82%BC%EC%83%89%EB%82%A0%EB%8B%A4.png" alt="삼색이" id="samsec">
        </div>
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

    <script>
        $(function(){
            $(window).scroll(function() {
                var scrollTop = $(this).scrollTop();
                
                $('.content_head').stop().fadeTo(500, scrollTop > 500 ? 1 : 0);
                $('#content_text1').stop().fadeTo(500, scrollTop > 800 ? 1 : 0);
                $('.circle').stop().fadeTo(500, scrollTop > 1100 ? 1 : 0);
                $('#content_text2').stop().fadeTo(500, scrollTop > 1500 ? 1 : 0);
                $('#nonodog').stop().fadeTo(500, scrollTop > 1800 ? 1 : 0);
                $('#content_text3').stop().fadeTo(500, scrollTop > 2200 ? 1 : 0);
                $('#samsec').stop().fadeTo(500, scrollTop > 2400 ? 1 : 0);
                $('#lili').stop().fadeTo(500, scrollTop > 2400 ? 1 : 0);
            });
        });


    </script>
    
	<%@ include file = "views/common/footer.jsp" %>
</body>
</html>