<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하단 푸터</title>
<style>
	div {
		/*border: 1px solid black;*/
		box-sizing: border-box;
	}

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
		background-size: 100%;
		background-color: #975228;
		background-repeat: repeat;
	}

	#footer_logo>img {
		width : 50%;
        height : 100%;
        margin: auto;
	}

	.footer_span {
		color: aliceblue;
		line-height: 20px;
	}

	.copy {
		color: gray;
		line-height: 5px;
	}

	#footer_btn  {
		float: right;
    	position: relative;
	}

	.ft{
		float: right;
		position: absolute;
		right: 40px;
		display: block;
		top: 30px;
	}

	.ft > div {
		width: 40px;
		height: 40px;
		float: left;
		text-align: center;
		line-height: 35px;
		background-color: #ffce50;
		margin-right: 10px;
		cursor: pointer;
		border: none;
		border-radius: 25px;
	}

	.ft > img {
		width: 24px;
		height: 24px;
		padding: 0;
		margin: 0;
	}


</style>
</head>
<body>
	<div id="footer">
		<div class="footer_wrap">
			<div id="footer_logo">
				<img src="https://media.tenor.com/vxJjiiRh3CUAAAAd/%EC%B6%98%EC%8B%9D-%EC%B6%98%EC%8B%9D%EC%9D%B4.gif" alt="logo">
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
				<div class="ft">
					<div>
						<a href="https://bemypet.kr/">
							<img src="https://svgsilh.com/svg/309113.svg" alt="사이트">
						</a>
					</div>
					<div>
						<a href="https://www.instagram.com/kh_iei">
							<img src="https://svgsilh.com/svg/1562139.svg" alt="sns">
						</a>
					</div>
					<div>
						<a href="https://kko.to/G2wEv1yqMf">
							<img src="https://svgsilh.com/svg/1093169.svg" alt="지도">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>