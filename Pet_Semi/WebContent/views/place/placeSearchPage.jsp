<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.place.model.vo.*" %>

<%

	ArrayList<Place> list = (ArrayList<Place>)session.getAttribute("list");
	String placeName = (String)session.getAttribute("placeName");
	PlacePageInfo ppi = (PlacePageInfo)request.getAttribute("ppi");
	
    int placeLimit = ppi.getPlaceLimit();
	int currentPage = ppi.getCurrentPage(); 
	int startPage = ppi.getStartPage();
	int endPage = ppi.getEndPage();
	int maxPage = ppi.getMaxPage(); 

%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>플레이스 검색</title>
<link rel="stylesheet" href="resources/css_files/place/placesearchpage.css">
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>
    
    
    <div id="place_content">
        <h2 id="search_answer">'<%= placeName %>' 의 검색결과는 총 <%= list.size() %>개 입니다. </h2>
       
        <div id="list-area">
            <% if(list.isEmpty()) {%>
            
            <!-- 등록된 장소가 없을 때-->
            등록된 장소가 없습니다... <br>
            <% } else { %>
            <!-- 등록된 장소가 있을 때-->
	            <% if(list.size() > placeLimit) { %>
	                <% for(int i = 0; i < placeLimit; i++) { %>
	                    <div class="place-content">
	                        <input type="hidden" value="<%= list.get(i).getPlaceNo() %>">
	                        <div id="img-place">
	                            <img src="<%= list.get(i).getTitleImg() %>" alt="">
	                        </div>
	                        <div id="btn-place" align="center">
	                            <div class="pl-btn" id="star">
	                                <a href="#">
	                                    <img src="https://svgsilh.com/svg/1139372-ffffff.svg" alt="찜">
	                                </a>
	                            </div>
	                            <div class="pl-btn" id="map">
	                                <a href="https://www.google.co.kr/maps/search/"<%= list.get(i).getPlaceName() %>>
	                                    <img src="https://svgsilh.com/svg/1294814-ffffff.svg" alt="지도">
	                                </a>
	                            </div>
	                        </div>
	                        <div id="name-place">
	                            <p>[<%= list.get(i).getPlaceCategory() %>] - [<%= list.get(i).getLocalCategory() %>] <%= list.get(i).getPlaceName() %></p>
	                        </div>
	                    </div>
	                <% } %>
                <% } else { %>
                <% for(int i = 0; i < list.size(); i++) { %>
	                    <div class="place-content">
	                        <input type="hidden" value="<%= list.get(i).getPlaceNo() %>">
	                        <div id="img-place">
	                            <img src="<%= list.get(i).getTitleImg() %>" alt="">
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
	                            <p>[<%= list.get(i).getPlaceCategory() %>] - [<%= list.get(i).getLocalCategory() %>] <%= list.get(i).getPlaceName() %></p>
	                        </div>
	                    </div>
                    <% } %>
                <% } %>
            <% } %> 
            
        </div>
 
        
        <div id="search-page" align="right">
            <% if(list.size() < placeLimit) {%>
            
                <!-- 등록된 장소가 없을 때-->
                <a href="" id="more" style="display: none">더 보기</a>
                
            <% } else { %>
                <!-- 등록된 장소가 있을 때-->
                <a href="#more-page" id="more"> <%= placeName %> 검색결과 더 보기</a>

                <div id="more-page" align="center" style="display: none;">
                    <% for(int j = placeLimit; j < list.size(); j++) { %>
                    <div class="place-content" align="center">
                            <input type="hidden" value="<%= list.get(j).getPlaceNo() %>">
                            <div id="img-place">
                                <img src="<%= list.get(j).getTitleImg() %>" alt="">
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
                                <p>[<%= list.get(j).getPlaceCategory() %>] - [<%= list.get(j).getLocalCategory() %>] <%= list.get(j).getPlaceName() %></p>
                            </div>
                        </div>
                    <% } %>	
                </div>
            <% } %>	
        </div>
    </div>

    <script>
        $(function(){
            $('.place-content').click(function(){

                const pno = $(this).children().eq(0).val();

                location.href = '<%= contextPath%>/detail.pl?pno=' + pno;

            });
            $('#more').click(function(){
                const maxScroll = $('body').height(); 
                console.log(maxScroll);
            	if($('#more-page').css('display') == 'none'){
                 $('#more-page').show();
                 $("#more").hide();
            	}
                $('html, body').animate({
                scrollTop : maxScroll - 250 // body의 footer길이 이전까지 animation 이동합니다.
                }, 1000);          // 속도 1000
                return false;
            });
            
        });

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
            if ($(this).scrollTop() > 500) { //500 넘으면 버튼이 보여짐니다.
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