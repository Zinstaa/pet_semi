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

<!-- placecontentdetailview.css 추가-->
<link rel="stylesheet" href="resources/css_files/place/placecontentdetailview.css">
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
	                           				<button class="btn btn-sm btn-warning">등록</button>
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