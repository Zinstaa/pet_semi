<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이스</title>
<style>
    div {
        box-sizing: border-box;
        /*border: 1px solid red;*/
    }
    h2 {
        text-align: center;
    }

    /* place_Main 부분 */
    #place_Main {
        width: 1200px;
        height: 1000px;
        margin: auto;
        padding-top: 125px;
    }

    #place_Main a {
        text-decoration: none;
        color: #ffffff;
    }

    #place_search {
        width: 25%;
        float: left;
        height: 85%;
        margin-top: 100px;
    }
    
    #place_content {
        width: 75%;
        float: left;
        height: 90%;
        margin-top: 55px;
    }

    #left-search-name {
        padding-top: 20px;
        color: #ffffff;
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

    #place-search-input {
        text-align: center;
    }

    input#place-name {
        height: 30px;
        margin-bottom: 10px;
        border: 1px solid lightgrey;
        border-top-left-radius: 3px;
        border-bottom-left-radius: 3px;
    }
    input#place-search {
        position: relative;
        background-color: #a5765a;
        background-repeat: no-repeat;
        width: 30px;
        height: 30px;
        padding: 3px;
        top: 8px;
        right: 5px;
        border: 1px solid lightgrey;
        border-top-right-radius: 3px;
        border-bottom-right-radius: 3px;
    }

    #place-search-symbol {
        float: left;
    }

    .symbol {
        float: left;
        height: 70px;
        margin-left: 25px;
        margin-top: 30px;
    }

    .symbol > img{
        width: 30px;
        height: 30px;
    }

    #place_category {
        height: 70%;
        background-color: #ffea97;
    }

    #place-category-form {
        height: 100%;
    }

    .form {
        width: 90%;
        display: block;
        padding: 6px 12px;
        font-size: 16px;
        font-weight: 400;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid lightgray;  
        border-radius: 4px;
        margin: 0px 0px 150px 15px;

    }

    #btn-info {
        float: right;
        background-color: #ffce50;
        color: #ffffff;
        border: 1px solid lightgray;  
        border-radius: 4px;
	    margin-right: 10px;
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
    
    <div id="place_Main">
        <h2> 플레이스 </h2>

        <div id="place_search">
            <div id="place_input">
                <h2 id="left-search-name">어댕가지 검색</h2>
                <form id="place-search-form" action="<%=contextPath%>/search.pl" method="get">
                    <div id="place-search-input">
                        <input type="text" name="place-name" id="place-name" required>
                        <input type="image" src="https://svgsilh.com/svg/1093183-ffffff.svg" name="place-search" id="place-search" value="">
                    </div>
                </form>
                <div id="place-search-symbol">
                    <a id="food" class="symbol" href="#">
                        <img src="https://svgsilh.com/svg/305344-ffffff.svg" alt="식당"><br>
                        식당
                    </a>
                    <a id="coffee" class="symbol" href="#">
                        <img src="https://svgsilh.com/svg/547490-ffffff.svg" alt="카페"><br>
                        카페
                    </a>
                    <a id="food" class="symbol" href="#">
                        <img src="https://svgsilh.com/svg/2133196-ffffff.svg" alt="공원"><br>
                        공원
                    </a>
                    <a id="coffee" class="symbol" href="#">
                        <img src="https://svgsilh.com/svg/304843-ffffff.svg" alt="쇼핑"><br>
                        쇼핑
                    </a>
                    <a id="food" class="symbol" href="#">
                        <img src="https://svgsilh.com/svg/2831364-ffffff.svg" alt="병원"><br>
                        병원
                    </a>
                </div>
            </div>
            <div id="place_category">
                <form id="place-category-form" action="<%=contextPath%>/category.pl" style="padding-top: 40px;">
                    <select name="category" class="form" required>
                        <option value="">카테고리</option>
                        <option value="fo">식당</option>
                        <option value="ca">카페</option>
                        <option value="pa">공원</option>
                        <option value="sh">쇼핑</option>
                        <option value="ho">병원</option>
                    </select>
                    <select name="place" class="form" required style="margin-bottom: 215px;">
                        <option value="">지역</option>
                        <option value="se">서울</option>
                        <option value="gy">경기</option>
                        <option value="ga">강원</option>
                        <option value="cb">충북</option>
                        <option value="cn">충남</option>
                        <option value="kb">경북</option>
                        <option value="kn">경남</option>
                        <option value="jb">전북</option>
                        <option value="jn">전남</option>
                    </select>
                    <div id="btn-zone">
                        <input type="submit" id="btn-info" value="검색">
                    </div>
                </form>
            </div>

       
        </div>
        <div id="place_content">
            <%@ include file = "placeContent.jsp" %>
        </div>
    </div>










    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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