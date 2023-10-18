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
        /*border: 1px solid black;*/
    }

    h2 {
        text-align: center;
    }

    #place_category {
        margin-top: 50px;
        text-align: center;
    }

    /* place_detail_main 부분 */
    #place_detail_main {
        width: 1200px;
        height: 100%;
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
        margin-bottom: 20px;
    }

    #place_nav_bar > #back_btn > a > img {
        margin-top: 10px;
        margin-left: 10px;
        width: 40px;
        height: 40px;
    }

    #back_btn {
        float: left;
    }

    #work_btn {
        float: right;
        margin-top: 10px;
        margin-right: 20px;
    }

    #work_btn > a {
        margin-right: 5px;
    }

    /* place_detail_content 부분 */
    #place_detail_content {
        height: 100%;
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
        height: 510px;
    }

    #place_detail_image_info > div {
        height: 100%;
        float: left;
    }

    /* place_detail_info 부분 */
    #place_detail_info {
        height: 100%;
    }

    /* place_detail_review 부분 */
    #place_detail_review {
        height: 15%;
        margin-bottom: 20px;
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
        height: 100%;
    }

    /* place_url 부분 */
    #place_url > a {
        text-decoration : none; 
        color: #212529;
    }

    /* place_info 부분 */
    #place_info {
        height: 60%;
        width: 90%;
        margin: auto;
        margin-top: 100px;
        margin-left: 5px;
        border: 1px solid lightgray;
        border-radius: 20px;
        padding-top: 40px;
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


    /* .place_detail_content 부분 */

    .place_detail_content {
        width: 95%;
        margin: auto;
    }
    .place_main_text {
        border-bottom: 2px solid lightgray;
        margin-top: 5px;
    }

    .place_symbol {
        width: 30px;
        height: 30px;
        border: 1px solid black;
        border-radius: 33px;

        position: absolute;
    }
    .place_symbol > img {
        width: 25px;
        height: 25px;
        margin-left: 1px;
    }

    .place_main_text > h3{
        padding-left: 35px;
        margin-bottom: 5px;
    }

    .place_content_text {
        white-space : pre-line;
    }

    .main {
        margin-top: 20px;
    }

    .sub {
        margin-top: 40px;
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

    /* place_review_submit 부분 */
    #place_review_submit {
        margin: auto;
    }

    #place_review_submit > table {
        width: 100%;
    }

    #place_review_submit > table > thead > tr > th,  #place_review_submit > table > thead > tr > td{
        text-align: center;
    }

    #place_review_submit textarea {
        margin-left: 30px;
        width: 100%;
        resize: none;
    }

    #place_review_submit button {
        margin-left: 10px;
        margin-bottom: 5px;
        width: 50px;
        height: 50px;
    }

    #place_review{
        margin-top: 20px;
    }


</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    <div id="place_detail_main">
        <h2> 플레이스 </h2>
        
        <h3 id="place_category"> [<%= p.getPlaceCategory() %>] - [<%= p.getLocalCategory() %>] </h3>
        
        <div id="place_detail_content">
            <div id="place_detail_image_info">
                <div id="place_detail_image">
                    <div id="content_1">
                        <div class="swiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="<%= contextPath %>/<%= list.get(0).getPlaceFilePath()%>/<%= list.get(0).getPlaceFileChangeName() %> " alt="대표이미지"></div>
                                <% for(int i = 1; i < list.size(); i++) { %>
                                    <div class="swiper-slide"><img src="<%= contextPath %>/<%= list.get(i).getPlaceFilePath()%>/<%= list.get(i).getPlaceFileChangeName() %> " alt="상세이미지<%= i %>"></div>
                                    <% } %>
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
                            <table>
                                <tr>
                                    <th width="75">주소  </th>
                                    <td><%= p.getPlaceAddress() %></td>
                                </tr>
                                <tr>
                                    <th>
                                        문의처  
                                    </th>
                                    <td>
                                        <%= p.getPlacePhone() %>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        이용시간  
                                    </th>
                                    <td>
                                        <%= p.getPlaceTimes() %>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        홈페이지  
                                    </th>
                                    <td id="place_url">
                                        <a href="http://<%= p.getPlaceUrl() %>" target="_blank"><%= p.getPlaceUrl() %></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="place_detail_info">
                <div class="place_detail_content main" id="pl-info">
                    <div class="place_main_text">
                        <div class="place_symbol">
                            <img src="https://svgsilh.com/svg/1084899.svg" alt="dog_symbol">
                        </div>
                        <h3>소개</h3>
                    </div>
                    <div class="place_content_text">
                        <%= p.getPlaceInfo() %>
                    </div>
                </div>
                <div class="place_detail_content sub" id="pl-around">
                    <div class="place_main_text">
                        <div class="place_symbol">
                            <img src="https://svgsilh.com/svg/1084899.svg" alt="dog_symbol">
                        </div>
                        <h3>주요시설</h3>
                    </div>
                    <div class="place_content_text">
                        <%= p.getPlaceAround() %>
                    </div>
                </div>
                <div class="place_detail_content sub" id="pl-price">
                    <div class="place_main_text">
                        <div class="place_symbol">
                            <img src="https://svgsilh.com/svg/1084899.svg" alt="dog_symbol">
                        </div>
                        <h3>이용비용</h3>
                    </div>
                    <div class="place_content_text">
                        <%= p.getPlacePrice() %>
                    </div>
                </div>
                <div class="place_detail_content sub" id="pl-caution">
                    <div class="place_main_text">
                        <div class="place_symbol">
                            <img src="https://svgsilh.com/svg/1084899.svg" alt="dog_symbol">
                        </div>
                        <h3>애견 정책 및 주의사항</h3>
                    </div>
                    <div class="place_content_text">
                        <%= p.getPlaceCaution() %>
                    </div>
                </div>
                <div class="place_detail_content sub" id="pl-map">
                    <div class="place_main_text">
                        <div class="place_symbol">
                            <img src="https://svgsilh.com/svg/1084899.svg" alt="dog_symbol">
                        </div>
                        <h3>지도</h3>
                    </div>
                    <div class="place_content_text">
                        <%= p.getPlaceAddress() %>
                        <iframe src="<%= p.getPlaceMap() %>" 
                            width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
                <div id="place_detail_review">
                    <div class="place_detail_content main" id="pl-review">
                        <div class="place_main_text">
                            <div class="place_symbol">
                                <img src="https://svgsilh.com/svg/1084899.svg" alt="dog_symbol">
                            </div>
                            <h3>리뷰</h3>
                        </div>
                        <div id="place_review">
                        	<div id="place_review_submit">
                        	<table>
                            	<thead>
                      			 	<tr>
                           			<% if(loginUser != null) {%>
	                           			<td colspan="2">
	                           				<textarea id="reviewContent" cols="50" row="2" style="resize: none" onclick="document.getElementById('reviewContent').value='';">리뷰 내용을 작성해 주세요</textarea>
	                           			</td>
	                           			<td>
	                           				<button onclick="insertPlaceReview();" class="btn btn-sm btn-warning">등록</button>
	                       				</td>
                           			<% } else { %>
	                           			<td>
	                           			<textarea id="reviewContent" readonly cols="50" row="1" >로그인 후 이용가능합니다.</textarea>
	                           				</td>
	                           			<td>
	                           				<button>등록</button>
	                           			</td>
                           			<% } %>
                      				</tr>
                   				</thead>
								<tbody>
								
								</tbody>
							</table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="place_nav_bar">
                <div id="back_btn">
                    <a href="<%= contextPath %>/place.pl?ppage=1">
                        <img src="https://svgsilh.com/svg/97591-ffffff.svg" alt="목록으로">
                    </a>
                </div>
                <div id="work_btn">
                    <% if(loginUser != null && loginUser.getMemberId().equals("admin")){ %>
                            <a href="<%= contextPath %>/updateForm.pl?pno=<%= p.getPlaceNo() %>" class="btn btn-sm btn-info">수정하기</a>
                            <a href="<%= contextPath %>/deleteForm.pl?pno=<%= p.getPlaceNo() %>" class="btn btn-sm btn-danger">삭제하기</a>
                    <% } %>
                    
                    <a href="#" class="btn btn-sm btn-secondary">문의하기</a>
                </div>
            </div>
        </div>
    </div>
        <script>
            function selectPlaceReviewList() {

                $.ajax({
                    url : 'plist.pl',
                    data : {
                   	pno : <%= p.getPlaceNo() %>
                   	},
                   	success : function(result) {
                    	console.log(result)
                    	
                    	let resultPlStr = '';
                    	for(let i in result) {
                    		
                    		resultPlStr += '<tr>'
		  							  +  '<td colspan="3" style="padding-left: 20px; padding-top:10px;">' + result[i].placeReviewWriter + ' (' +result[i].placeReviewDate + ')' + '</td>'
		  							  +  '</tr>' 
                                      + '<tr>'
		  							  +  '<td colspan="3" style="padding-left: 20px; padding-bottom:10px;  border-bottom: 1px solid lightgray;">' + result[i].placeReviewContent + '</td>'
		  							  +  '</tr>'
                    	}
                   	
                   		$('#place_review tbody').html(resultPlStr);
                   	},
                    error : function() {
                    	console.log('댓글을 읽어오지 못했습니다.')
                    }
                    
                })
            }
            
            $(function(){
            	selectPlaceReviewList();
            	
            	setInterval(selectPlaceReviewList, 1000);
            });
            
            function insertPlaceReview() {
            	
            	$.ajax({
            		url : 'pinsert.pl',
            		type : 'post',
            		data : {
	           			pno : <%= p.getPlaceNo() %>,
	           			content : $('#reviewContent').val()
            		},
            		success : function(result){
            			if(result > 0) {
        					$('reviewContent').val('');
        					
        					selectPlaceReviewList();
        				};
            		},
            		error : function() {
            			console.log('댓글을 읽어오지 못했습니다.')
            		}
            	})
            	
            }

        </script>
        
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