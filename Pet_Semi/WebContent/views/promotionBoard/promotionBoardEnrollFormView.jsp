<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍보게시글 작성 및 등록하는 공간</title>
<style>
    #enroll-form > table{
        border: 1px solid gray;
    }

    #enroll-form input, #enroll-form textarea {
        width: 100%;
    }
</style>
</head>
<body>


    <div class="outer">
        <br>
        <h2 align="center">글써줄래?</h2>
    </div>

    <form action="" id="enroll-form" method="post" enctype="multipart/form-data">

        <table align="center" border="1">
            <tr>
                <th width="100">제목</th>
                <td colspan="3">
                    <input type="text" name="title" width="300" required>
                </td>
                <tr>
                    <th>행사일정</th>
                    <td colspan="3">
                        <input type="text" name="date" required>
                    </td>
                </tr>
                </tr>
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3" align="center">
                        <img src="https://cdn.icon-icons.com/icons2/2348/PNG/512/image_picture_icon_143003.png" alt="대표이미지" id="titleImage" width="50" height="30">
                    </td>
                </tr>
                <tr>
                    <td>상세이미지</td>
                    <td><img src="" alt="상세1" id="contentImg1"></td>
                    <td><img src="" alt="상세2" id="contentImg2"></td>
                    <td><img src="" alt="상세3" id="contentImg3"></td>
                </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <textarea name="content" style="resize:none;" rows="10"></textarea>
                </td>
            </tr>
        </table>

        <div id="file-area">
            <input type="file" name="file1" id="file1" required>
            <input type="file" name="file2" id="file2">
            <input type="file" name="file3" id="file3">
            <input type="file" name="file4" id="file4">
        </div>
        <br>
        <div align="center">
            <button type="submit">작성하기</button>
            <button type="submit">다시쓰기</button>
        </div>
        </div>

    </form>

</body>
</html>