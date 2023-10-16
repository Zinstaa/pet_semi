<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.place.model.vo.*" %>

<%
	ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");
	PlacePageInfo ppi = (PlacePageInfo)request.getAttribute("ppi");
    ArrayList<PlaceCategory> pllist = (ArrayList<PlaceCategory>)request.getAttribute("pllist");
    ArrayList<LocalCategory> lolist = (ArrayList<LocalCategory>)request.getAttribute("lolist");
	
	int currentPage = ppi.getCurrentPage(); 
	int startPage = ppi.getStartPage();
	int endPage = ppi.getEndPage();
	int maxPage = ppi.getMaxPage(); 
	
%>
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
        height: 1200px;
        margin: auto;
        padding-top: 125px;
    }

    #place_Main a {
        text-decoration: none;
        color: #ffffff;
    }

    #place_search {
        width: 25%;
        height: 70%;
        margin-top: 100px;
        float: left;
    }
    
    #place_content {
        width: 75%;
        height: 90%;
        margin-top: 55px;
        float: left;
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
        height: 40px;
        margin-bottom: 10px;
        margin-top: 15px;
        border: 1px solid lightgrey;
        border-top-left-radius: 3px;
        border-bottom-left-radius: 3px;
        margin-left: 10px;
    }
    input#place-search {
        position: relative;
        background-color: #a5765a;
        background-repeat: no-repeat;
        width: 35px;
        height: 40px;
        padding: 3px;
        top: 12px;
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
        width: 24px;
        height: 24px;
        top: 3px;
        left: 13px;
    }
    
    /* placeContent 부분 */
    #list-area {
        text-align: center;
        border: 1px solid white;
    }

    .place-content {
        width: 250px;
        height: 200px;
        border: 1px solid lightgray;
        border-radius: 20px;
        background-color: #FFF8DB;
        display: inline-block;
        margin: 7px;
    }

    
    .place-content > #img-place, .place-content > #btn-place {
        float: left;
        height: 75%;
    }
    
    #img-place {
        width: 65%;
    }
    
    #img-place > img {
        width: 125px;
        height: 125px;
        border: 1px solid lightgrey;
        border-radius: 10px;
        margin-top: 15px;
        margin-left: 10px;
    }
    
    #img-place:hover ,#name-place:hover {
        cursor: pointer;
        opacity: 0.75;
    }

    #btn-place {
        width: 35%;
    }

    #name-place {
        float: left;
        width: 100%;
        height: 25%;
        line-height: 49px;
    }

    .pl-btn {
        background-color: #ffce50;
        width: 50px;
        height: 50px;
        border-radius: 25px;
        margin-top: 20px;
        margin-right: 10px;
        line-height: 40px;
    }

    #star > a > img {
		width: 30px;
		height: 30px;
		padding: 0;
		margin: 0;
	}

    #map > a > img {
		width: 24px;
		height: 24px;
		padding: 0;
		margin: 0;
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
                <form id="place-search-form" action="<%=contextPath%>/search.pl?ppage=1" method="post">
                    <div id="place-search-input">
                        <input type="text" name="place-name" id="place-name" required>
                        <input type="image" src="https://svgsilh.com/svg/1093183-ffffff.svg" name="place-search" id="place-search" value="검색">
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
                        <option value="" selected disabled>카테고리</option>
                        <% for(PlaceCategory plc : pllist) { %>
                            <option value="<%= plc.getPlaceCategoryNo() %>">
                                <%= plc.getPlaceCategoryName() %>
                            </option>
                        <% } %>
                    </select>
                    <select name="place" class="form" required style="margin-bottom: 215px;">
                        <option value="" selected disabled>지역</option>
                        <% for(LocalCategory loc : lolist) { %>
                            <option value="<%= loc.getLocalCategoryNo() %>">
                                <%= loc.getLocalCategoryName() %>
                            </option>
                        <% } %>
                    </select>
                    <div id="btn-zone">
                        <input type="submit" id="btn-info" value="검색">
                    </div>
                </form>
            </div>

       
        </div>
        <div id="place_content">
            <% if(loginUser != null && loginUser.getMemberId().equals("admin")) { %>
            <div style="width: 900px;" align="right">
                <a href="<%= contextPath %>/enrollForm.pl" class="btn btn-sm btn-primary">글작성</a>
            </div>
             <% } %>
            <div id="list-area">
            <% if(list.isEmpty()) {%>
            
            <!-- 등록된 장소가 없을 때-->
            등록된 장소가 없습니다... <br>
            
            <% } else { %>
            <!-- 등록된 장소가 있을 때-->
                <% for(Place p : list) { %>
                    <div class="place-content">
                        <input type="hidden" value="<%= p.getPlaceNo() %>">
                        <div id="img-place">
                            <img src="<%= p.getTitleImg() %>" alt="">
                        </div>
                        <div id="btn-place" align="center">
                            <div class="pl-btn" id="star">
                                <a href="https://kko.to/G2wEv1yqMf">
                                    <img src="https://svgsilh.com/svg/1139372-ffffff.svg" alt="찜">
                                </a>
                            </div>
                            <div class="pl-btn" id="map">
                                <a href="https://maps.google.com/maps?ll=38.576431,128.382538&z=14&t=m&hl=ko&gl=KR&mapclient=embed&cid=2641597827115945866">
                                    <img src="https://svgsilh.com/svg/1294814-ffffff.svg" alt="지도">
                                </a>
                            </div>
                        </div>
                        <div id="name-place">
                            <p>[<%= p.getPlaceCategory() %>] - [<%= p.getLocalCategory() %>] <%= p.getPlaceName() %></p>
                        </div>
                    </div>
                <% } %>
            <% } %>
            </div>
            <div class="paging-area" align="center">
	            <%if(currentPage != 1) { %>
	        	<button onclick="location.href='<%=contextPath %>/place.pl?ppage=<%=currentPage-1 %>'" class="btn btn-sm btn-warning">&lt;</button>
	        	<%} %>
	        
	        
	        	<% for(int i = startPage; i<= endPage; i++){ %>
	        		<%if(currentPage != i) {%>
	        			<button onclick ="location.href='<%=contextPath%>/place.pl?ppage=<%=i%>'" class="btn btn-sm btn-warning"><%=i%></button>
	        		<%} else { %>
	        			<button disabled class="btn btn-sm btn-light"><%=i %></button>
	        		<%} %>
	        	<%} %>
	        	
	        	<%if(currentPage != maxPage) { %>
	        	<button onclick="location.href='<%=contextPath %>/place.pl?ppage=<%= currentPage + 1 %>'" class="btn btn-sm btn-warning">&gt;</button>
	        	<%} %>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $('.place-content').click(function(){

                const pno = $(this).children().eq(0).val();

                location.href = '<%= contextPath%>/detail.pl?pno=' + pno;

            })
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