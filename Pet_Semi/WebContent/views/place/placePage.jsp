<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div {
        box-sizing: border-box;
        border: 1px solid red;
    }
    h2 {
        text-align: center;
    }

    /* place_Main 부분 */
    #place_Main {
        width: 1200px;
        height: 1000px;
        margin: auto;
    }

    #place_Main a {
        text-decoration: none;
        color: #ffffff;
    }

    #place_search {
        width: 25%;
        float: left;
        height: 75%;
        margin-top: 100px;
    }
    
    #place_content {
        width: 75%;
        float: left;
        height: 90%;
        margin-top: 55px;
    }
    
    #place_search > div {
        width: 100%;
    }
    
    #place_input {
        height: 30%;
        background-color: #ffce50;
    }
    
    #place_input > h1 {
        text-align: center;
        color: #ffffff;
        margin-top: 10px;
    }

    input#place-search {
        background:url('https://svgsilh.com/svg/1093183.svg');
        background-repeat: no-repeat;
        width:40px;
        height:40px;
    }

    #place-search-symbol {
        float: left;
    }

    .symbol {

    }

    #place_category {
        height: 70%;
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
        top: 3px;
        left: 13px;
    }
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>
    <br><br><br><br><br>
    <div id="place_Main">
        <h2> 플레이스 </h2>

        <div id="place_search">
            <div id="place_input">
                <h1>어댕가지 검색</h1>
                <form id="place-search-form" action="<%=contextPath%>/place.pl" method="get">
                    <div id="place-search-input">
                        <input type="text" name="place-name" id="place-name" required>
                        <input type="submit" name="place-search" id="place-search" value="">
                    </div>
                    <div id="place-search-symbol">
                        <a id="food" class="symbol" href="#">
                            <img src="https://svgsilh.com/svg/305344-ffffff.svg" alt="식당"><br>
                            식당
                        </a>
                        <a id="coffee" class="symbol" href="#">
                            <img src="https://svgsilh.com/svg/547490-ffffff.svg" alt="커피"><br>
                            커피
                    </div>
                </form>
            </div>
            <div id="place_category">

            </div>
        </div>
        <div id="place_content">
            <%@ include file = "placeContent.jsp" %>
        </div>
    </div>










    <br><br><br><br><br><br><br<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>><br><br><br><br><br>
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
                    $('#toTop').css('left', $('#sidebar').offset().left);  // #sidebar left:0 죄표
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