<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이스 작성</title>
<style>

	div{
		border: 1px solid black;
		box-sizing: border-box;
	}

	h2 {
        text-align: center;
    }

	/* place_enroll-form 부분 */
    #place-enroll-form {
		text-align: center;
        width: 1200px;
        height: 1500px;
        margin: auto;
        padding-top: 125px;
		background-color: #fff5ce;
    }

	#enroll-form {
		width: 1000px;
		margin: auto;
	}

	#enroll-form > div {
		margin-top: 20px;
	}

	#enroll-form select, #enroll-form input, #enroll-form textarea {
		width: 100%;
	}

	#enroll-form input[type="file"]{
		width: 70%;
	}

	#enroll-form > div > table {
		width: 80%;
		border-collapse: separate;
   		border-spacing: 5px 5px;
	}

	.file {
		text-align: center;
		width: 80%;
	}

	tr > td > img {
		border: 1px solid lightgray;
	}

</style>
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
								<option>카테고리</option>
								<option>식당</option>
								<option>카페</option>
								<option>공원</option>
								<option>쇼핑</option>
								<option>병원</option>
							</select>
						</td>
						<th>지역</th>
						<td>
							<select name="pl-place" class="place-form" required>
								<option>지역</option>
								<option>서울</option>
								<option>경기</option>
								<option>강원</option>
								<option>충북</option>
								<option>충남</option>
								<option>경북</option>
								<option>경남</option>
								<option>전북</option>
								<option>전남</option>
								<option>제주</option>
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
							<input type="text" name="pl-around" required>
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
							<input type="text" name="pl-caution" required>
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
				<button type="submit">작성하기</button>
				<button type="reset">다시쓰기</button>
			</div>

		</form>
	</div>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>