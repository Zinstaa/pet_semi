<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍보게시판 리스트 뷰에요~</title>
<style>
    .list-area{
        text-align: center;
        border : 1px solid yellowgreen;
    }
    .promotion{
        border : 1px solid yellowgreen;
        width : 300px;
        display : inline-block;
        margin: 7px;
        background-color: lightyellow;
    }
    .promotion > img{
        width: 250px;
        height: 200px;
        padding: 10px;
    }
    .promotion:hover{
        cursor: pointer;
        opacity: 0.9;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
</body>
</html>