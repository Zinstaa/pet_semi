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
<!-- placepage.css 추가 -->
<link rel="stylesheet" href="resources/css_files/place/placepage.css">
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
            <% if(loginUser != null && loginUser.getStatus().equals("A")){ %>
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
                                <a href="#">
                                    <img src="https://svgsilh.com/svg/1139372-ffffff.svg" alt="찜">
                                </a>
                            </div>
                            <div class="pl-btn" id="map">
                                <a href="https://www.google.co.kr/maps/search/<%= p.getPlaceName() %>">
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