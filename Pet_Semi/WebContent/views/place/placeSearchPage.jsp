<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.place.model.vo.*" %>

<%

	ArrayList<Place> list = (ArrayList<Place>)session.getAttribute("list");
	String placeName = (String)session.getAttribute("placeName");
	PlacePageInfo ppi = (PlacePageInfo)request.getAttribute("ppi");
	
	int currentPage = ppi.getCurrentPage(); 
	int startPage = ppi.getStartPage();
	int endPage = ppi.getEndPage();
	int maxPage = ppi.getMaxPage(); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이스 검색</title>
<style>
    div {
        box-sizing: border-box;
        /*border: 1px solid red;*/
    }

    /* place_content 부분 */
    #place_content {
        padding-top: 125px;
        width: 1200px;
        height: 1200px;
        margin: auto;
    }
    
    #search_answer {
        margin-bottom: 55px;
        color: #000000;
        text-align: center;
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
    
    
    <div id="place_content">
        <h2 id="search_answer">'<%= placeName %>' 검색결과 </h2>
       
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
	        	<button onclick="location.href='<%=contextPath %>/search.pl?ppage=<%=currentPage-1 %>'" class="btn btn-sm btn-warning">&lt;</button>
	        	<%} %>
	        
	        
	        	<% for(int i = startPage; i<= endPage; i++){ %>
	        		<%if(currentPage != i) {%>
	        			<button onclick ="location.href='<%=contextPath%>/search.pl?ppage=<%=i%>'" class="btn btn-sm btn-warning"><%=i%></button>
	        		<%} else { %>
	        			<button disabled class="btn btn-sm btn-light"><%= i %></button>
	        		<%} %>
	        	<%} %>
	        	
	        	<%if(currentPage != maxPage) { %>
	        	<button onclick="location.href='<%=contextPath %>/search.pl?ppage=<%=currentPage+1 %>'" class="btn btn-sm btn-warning">&gt;</button>
	        	<%} %>
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