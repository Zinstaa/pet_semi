<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하단 푸터</title>
<style>
	div {
        box-sizing: border-box;
        border: 1px solid red;
    }

	.footer{
		width : 1200px;
		height: 200px;
		margin : auto;
	}

	.footer > div{
		float: left;
	}
	
	#footer_logo, #footer_info, #footer_btn {
		height : 100%;
	}

	#footer_logo, #footer_btn {
		width: 20%;
	}

	#footer_info {
		width: 60%;
	}
</style>
</head>
<body>
	<div class="footer">
		<div id="footer_logo"></div>
		<div id="footer_info"></div>
		<div id="footer_btn"></div>
	</div>
</body>
</html>