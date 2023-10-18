<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.pet.place.model.vo.PlaceCategory, com.kh.pet.place.model.vo.LocalCategory" %>
<%
	ArrayList<PlaceCategory> pllist = (ArrayList<PlaceCategory>)request.getAttribute("pllist");
	ArrayList<LocalCategory> lolist = (ArrayList<LocalCategory>)request.getAttribute("lolist");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이스 작성</title>
<!-- placecontentenrollform.css 추가 -->
<link rel="stylesheet" href="resources/css_files/place/placecontentenrollform.css">
</head>
<body>
	 <%@ include file = "../common/menubar.jsp" %>
	
	<div id="place-enroll-form">
		<h2> 플레이스 작성 </h2>

		<form action="<%= contextPath %>/insert.pl" id="enroll-form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
			<div id="place-enroll-form-table">
				<table align="center">
					<tr>
						<th>카테고리</th>
						<td colspan="2">
							<select name="pl-category" class="place-form" required>
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
							<select name="pl-place" class="place-form" required>
								<option value="" selected disabled>지역</option>
								<% for(LocalCategory loc : lolist) { %>
									<option value="<%= loc.getLocalCategoryNo() %>">
										<%= loc.getLocalCategoryName() %>
									</option>
								<% } %>
							</select>
						</td>
					</tr>
					<tr>
						<th>플레이스 이름</th>
						<td colspan="4">
							<input type="text" name="pl-name" required>
						</td>
					</tr>
					<tr>
						<th>플레이스 주소</th>
						<td colspan="4">
							<input type="text" name="pl-address" required>
						</td>
					</tr>
					<tr>
						<th>플레이스 문의처</th>
						<td colspan="4">
							<input type="text" name="pl-phone" required>
						</td>
					</tr>
					<tr>
						<th>플레이스 이용시간</th>
						<td colspan="4">
							<input type="text" name="pl-time" required>
						</td>
					</tr>
					<tr>
						<th>플레이스 홈페이지</th>
						<td colspan="4">
							<input type="text" name="pl-url" required>
						</td>
					</tr>
					<tr>
						<th>플레이스 소개</th>
						<td colspan="4">
							<textarea name="pl-info" style="resize: none;" rows="10"></textarea>
						</td>
					</tr>
					<tr>
						<th>플레이스 주요시설</th>
						<td colspan="4"> 
							<textarea name="pl-around" style="resize: none;" rows="4" required ></textarea>					
						</td>
					</tr>
					<tr>
						<th>플레이스 이용비용</th>
						<td colspan="4">
							<input type="text" name="pl-price" required>
						</td>
					</tr>
					<tr>
						<th>플레이스 주의사항</th>
						<td colspan="4">
							<textarea name="pl-caution" style="resize: none;" rows="4"  required></textarea>
						</td>
					</tr>
					<tr>
						<th>플레이스 지도 (url)</th>
						<td colspan="4">
							<input type="text" name="pl-map" required>
						</td>
					</tr>
					<!-- 썸네일 미리보기 -->
					<tr>
						<th>대표이미지</th>
						<td colspan="4" align="center">
							<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png" alt="대표이미지" id="titleImg" width="250" height="175">
						</td>
					</tr>
					<tr>
						<th>상세이미지</th>
						<td>
							<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png" alt="상세이미지1" id="contentImg1" width="150" height="105">
						</td>
						<td>
							<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png" alt="상세이미지2" id="contentImg2" width="150" height="105">
						</td>
						<td>
							<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png" alt="상세이미지3" id="contentImg3" width="150" height="105">
						</td>
						<td>
							<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png" alt="상세이미지4" id="contentImg4" width="150" height="105">
						</td>
					</tr>
				</table>
			</div>

			<div id="file-area">
				<input class="file" type="file" name="file1" id="file1" required onchange="loadImg(this, 1);">
				<input class="file" type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
				<input class="file" type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
				<input class="file" type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
				<input class="file" type="file" name="file5" id="file5" onchange="loadImg(this, 5);">
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
				<button type="submit" class="btn btn-sm btn-info">작성하기</button>
				<button type="reset" class="btn btn-sm btn-success">다시쓰기</button>
			</div>

		</form>
	</div>
	<!-- <%@ include file = "../common/footer.jsp" %> -->
</body>
</html>