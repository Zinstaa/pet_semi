<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.pet.place.model.vo.*, java.util.ArrayList" %>
<%
	Place p = (Place)request.getAttribute("p");
	ArrayList<PlaceFile> list = (ArrayList<PlaceFile>)request.getAttribute("list");
	ArrayList<PlaceCategory> pllist = (ArrayList<PlaceCategory>)request.getAttribute("pllist");
	ArrayList<LocalCategory> lolist = (ArrayList<LocalCategory>)request.getAttribute("lolist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이스 수정</title>
<!-- placeupdateform.css 추가 -->
<link rel="stylesheet" href="resources/css_files/place/placeupdateform.css">
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
		<div id="place-update-form">
		<h2> 플레이스 수정 </h2>

		<form action="<%= contextPath %>/update.pl" id="update-form" method="post" enctype="multipart/form-data">

			<input type="hidden" name="pno" value="<%= p.getPlaceNo() %>">
			<% System.out.println(p.getPlaceNo()); %>
			<div id="place-update-form-table">
				<table align="center">
					<tr>
						<th>카테고리</th>
						<td colspan="2">
							<select name="pl-category" id="pl-category" class="place-form" required>
								<option value="" selected disabled>카테고리</option>
								<% for(PlaceCategory plc : pllist) { %>
									<option value="<%= plc.getPlaceCategoryNo() %>">
										<%= plc.getPlaceCategoryName() %>
									</option>
								<% } %>
							</select>
						</td>
						<th>지역</th>
						<td>
							<select name="pl-place" id="pl-place" class="place-form" required >
								<option value="" selected disabled>지역</option>
								<% for(LocalCategory loc : lolist) { %>
									<option value="<%= loc.getLocalCategoryNo() %>">
										<%= loc.getLocalCategoryName() %>
									</option>
								<% } %>
							</select>
							<script>
								$(function(){
									$('#update-form option').each(function(){

										if($(this).text().trim() == '<%= p.getPlaceCategory() %>'){
											$(this).attr('selected', 'true');
										}

										if($(this).text().trim() == '<%= p.getLocalCategory() %>'){
											$(this).attr('selected', 'true');
										}

									});
								});
							</script>
						</td>
					</tr>
					<tr>
						<th>플레이스 이름</th>
						<td colspan="4">
							<input type="text" name="pl-name" required value="<%= p.getPlaceName() %>">
						</td>
					</tr>
					<tr>
						<th>플레이스 주소</th>
						<td colspan="4">
							<input type="text" name="pl-address" required value="<%= p.getPlaceAddress() %>">
						</td>
					</tr>
					<tr>
						<th>플레이스 문의처</th>
						<td colspan="4">
							<input type="text" name="pl-phone" required value="<%= p.getPlacePhone() %>">
						</td>
					</tr>
					<tr>
						<th>플레이스 이용시간</th>
						<td colspan="4">
							<input type="text" name="pl-time" required value="<%= p.getPlaceTimes() %>">
						</td>
					</tr>
					<tr>
						<th>플레이스 홈페이지</th>
						<td colspan="4">
							<input type="text" name="pl-url" required value="<%= p.getPlaceUrl() %>">
						</td>
					</tr>
					<tr>
						<th>플레이스 소개</th>
						<td colspan="4">
							<textarea name="pl-info" style="resize: none;" rows="10"><%= p.getPlaceInfo() %></textarea>
						</td>
					</tr>
					<tr>
						<th>플레이스 주요시설</th>
						<td colspan="4"> 
							<textarea name="pl-around" style="resize: none;" rows="4" required ><%= p.getPlaceAround() %></textarea>					
						</td>
					</tr>
					<tr>
						<th>플레이스 이용비용</th>
						<td colspan="4">
							<input type="text" name="pl-price" required value="<%= p.getPlacePrice() %>">
						</td>
					</tr>
					<tr>
						<th>플레이스 주의사항</th>
						<td colspan="4">
							<textarea name="pl-caution" style="resize: none;" rows="4"  required><%= p.getPlaceCaution() %></textarea>
						</td>
					</tr>
					<tr>
						<th>플레이스 지도 (url)</th>
						<td colspan="4">
							<input type="text" name="pl-map" required value="<%= p.getPlaceMap() %>">
						</td>
					</tr>
					<!-- 썸네일 미리보기 -->
					<tr>
						<th>대표이미지</th>
						<% if(list.size() > 0){%>
							<td colspan="4" align="center">
								<img src="<%= contextPath %>/<%= list.get(0).getPlaceFilePath() %>/<%= list.get(0).getPlaceFileChangeName() %>" alt="대표이미지" id="titleImg" width="250" height="175">
							</td>
							<input type="hidden" name="originFileNo0" value="<%= list.get(0).getPlaceFileNo() %>">
							<input type="hidden" name="originalFileName0" value="<%= list.get(0).getPlaceFileChangeName() %>">
                        <% } %>
					</tr>
					<tr>
						<th>상세이미지</th>					
						
						<% if((list.size() - 1) > 0) {%>
							<% for(int i = 1; i < list.size(); i++) { %>
							<td>
	                            <img src="<%= contextPath %>/<%= list.get(i).getPlaceFilePath()%>/<%= list.get(i).getPlaceFileChangeName() %> " alt="상세이미지<%= i %>" id="contentImg<%= i %>" width="150" height="105">
							</td>
							<input type="hidden" name="originalFileName<%= i %>" value="<%= list.get(i).getPlaceFileChangeName() %>">
							<% } %>
						<% } else { %>
							<% for(int i = 1; i <= (5-list.size()); i++) { %>
							<td>
								<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png" alt="상세이미지<%= i %>" id="contentImg<%= i %>" width="150" height="105">
							</td>
							<% } %>
                        <% } %>
					</tr>
				</table>
			</div>

			<div id="file-area">
				<input class="file" type="file" name="refile1" id="file1" required onchange="loadImg(this, 1);">
				<input class="file" type="file" name="refile2" id="file2" onchange="loadImg(this, 2);">
				<input class="file" type="file" name="refile3" id="file3" onchange="loadImg(this, 3);">
				<input class="file" type="file" name="refile4" id="file4" onchange="loadImg(this, 4);">
				<input class="file" type="file" name="refile5" id="file5" onchange="loadImg(this, 5);">
			</div>

			<script>
				function loadImg(inputFile, num){

					if(inputFile.files.length == 1) {
						let reader = new FileReader();

						reader.readAsDataURL(inputFile.files[0]);

						reader.onload = function(e) {
							switch(num) {
								case 1: $('#titleImg').attr('src', e.target.result); break;
								case 2: $('#contentImg1').attr('src', e.target.result); break;
								case 3: $('#contentImg2').attr('src', e.target.result); break;
								case 4: $('#contentImg3').attr('src', e.target.result); break;
								case 5: $('#contentImg4').attr('src', e.target.result); break;
							}
						}
					} else {
						const str = "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png";
						switch(num) {
							case 1: $('#titleImg').attr('src', str); break;
							case 2: $('#contentImg1').attr('src', str); break;
							case 3: $('#contentImg2').attr('src', str); break;
							case 4: $('#contentImg3').attr('src', str); break;
							case 5: $('#contentImg4').attr('src', str); break;
						}
					}
				};

				$(function(){
					$('#file-area').hide();
					$('#titleImg').click(function(){
						$('#file1').click();
					});
					$('#contentImg1').click(function(){
						$('#file2').click();
					});
					$('#contentImg2').click(function(){
						$('#file3').click();
					});
					$('#contentImg3').click(function(){
						$('#file4').click();
					});
					$('#contentImg4').click(function(){
						$('#file5').click();
					});
				});
				
				
			    
			</script>

			<div align="center">
				<button type="submit" class="btn btn-sm btn-info">수정하기</button>
				<button type="reset" class="btn btn-sm btn-success">다시쓰기</button>
			</div>

		</form>
	</div>
	<%@ include file = "../common/footer.jsp" %>
	
</body>
</html>
