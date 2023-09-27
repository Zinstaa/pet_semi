<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러발생</title>
	<style>
		h1{
		color : black;
		margin-top : 150px;
		text-align : center;
		font-size : 50px;
		font-weight : bold;
		}
	</style>

</head>
<body>
		<h1><%= errorMsg %></h1>
</body>
</html>