<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하단 푸터</title>
<style>
	#footer{
		background-color: #975228;
		position: relative;
		width: 100%;
		height: 150px;
		font-weight: 300;
		text-align: left;
		padding: 30px 0;
		font-size: 14px;
			
	}

	.footer_wrap {
		width : 1200px;
		height: 100px;
		margin: auto;
	}

	.footer_wrap > div { 
		float: left;

	}
	
	#footer_logo, #footer_info, #footer_btn {
		height : 100%;
		margin: auto;
	}

	#footer_logo, #footer_btn {
		width: 20%;
	}

	#footer_info {
		width: 60%;
		line-height: 100px;
	}

	#footer_logo {
		background: url("https://www.codingfactory.net/wp-content/uploads/button_search.png");
		background-size: 10%;
		background-color: #975228;
		background-repeat: no-repeat;
	}

	.footer_span {
		color: aliceblue;
		line-height: 20px;
	}

	.copy {
		color: gray;
		line-height: 5px;
	}
</style>
</head>
<body>
	<div id="footer">
		<div class="footer_wrap">
			<div id="footer_logo">

			</div>
			<div id="footer_info">
				<p class="footer_span">
					<span>어댕가지~? | 
					</span><span>팀장 : 김건희 | 
					</span><span>팀원 : 강성태, 변준식, 채찬욱, 황진호</span>
				</p>
				<p class="footer_span">
					<span>서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F</span>
				</p>

				<p class="copy">COPYRIGHT ⓒ 2023 ADEONGGAJI ALL RIGHTS RESERVED.</p>
			</div>
			<div id="footer_btn">

			</div>
		</div>
	</div>
	
</body>
</html>