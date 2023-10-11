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
        width: 100px;
        height: 300px;
    }

    #enroll-form input, #enroll-form textarea {
        width: 99%;
        height: 98%;
        font-size: 13px;
    }
</style>
</head>
<body>

<%@ include file = "../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">게시글을 등록하거라~~우하하하~~</h2>
        <br>
    

    <form action="<%=contextPath %>/promotionInsert.pr" id="enroll-form" method="post" enctype="multipart/form-data">
        
        <input type="hidden" name="memberNo" value="<%=loginUser.getMemberNo() %>">
        <table align="center" border="1">
            <tr>
                <th width="70">제목</th>
                <td colspan="3">
                    <input type="text" name="title" width="100" required>
                </td>
                <tr>
                    <th>행사일정</th>
                    <td colspan="3">
                        <input type="text" name="date" width="200" required>
                    </td>
                </tr>
                </tr>
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3" align="center">
                        <img src="https://cdn-icons-png.flaticon.com/512/6583/6583130.png" alt="대표이미지" id="titleImg" width="200" height="130">
                    </td>
                </tr>
                <tr>
                    <td>상세이미지</td>
                    <td><img src="https://cdn-icons-png.flaticon.com/512/6583/6583130.png" alt="상세1" id="contentImg1" width="100" height="60"></td>
                    <td><img src="https://cdn-icons-png.flaticon.com/512/6583/6583130.png" alt="상세2" id="contentImg2" width="100" height="60"></td>
                    <td><img src="https://cdn-icons-png.flaticon.com/512/6583/6583130.png" alt="상세3" id="contentImg3" width="100" height="60"></td>
                </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <textarea name="content" style="resize:none;" rows="10"></textarea>
                </td>
            </tr>
        </table>

        <div id="file-area">
            <input type="file" name="file1" id="file1" required onchange="loadImg(this, 1);"> <!-- onchange 이벤트 속성에다가 loadImg라는 함수를 호출해줄거임 -->
            <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
            <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
            <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
        </div>
        <!-- onchange : input 태그의 내용물이 변경 되었을 떄 발생하는 이벤트 속성 -->

        <script> // loadImg라는 메소드는 없음 -> 그래서 만들거임
            function loadImg(inputFile, num){ //앞에는 인풋요소 받을거고 뒤에는 숫자 받을거
                
                if(inputFile.files.length == 1) { // 파일 첨부 

                    // 선택된 파일을 읽어서 영역에 맞는 미리보기 

                    // 파일을 읽어들일 FileReader객체 생성 
                    let reader = new FileReader(); // new FileReader() -> 이거를 자바스크립트에서 무슨함수라고 했다고? -> 생성자함수라고 했다.
                    // 자바스크립트를 잘하면 좋은데... 못하면 어쩔수 없는거죠... 근데 기본적인건 알아야 되는거죠~ 쌤왈..

                    // console.log(inputFile.files[0]);
                    // FileReader 객체로부터 파일을 읽어들이는 메소드를 호출 

                    reader.readAsDataURL(inputFile.files[0]); // readAsDataURL 이라는 메소드가 있음 
                    // 해당 파일을 읽어들이는 순간 파일만의 고유한 긴 url이 부여됨
                    // 해당 url을 src 속성의 값으로 부여할 것 (attr 속성으로)

                    // 파일 읽기가 완료되면 실행할 익명함수 정의
                    reader.onload = function(e){ // 매개변수 e를 왜 적었을까? e 보면 target이라는 속성이 나올거임
                        // e 의 target => e.target => FileReader => 이벤트 발생한 놈
                        // console.log(e.target);
                        // e.target.result에 파일의 url이 담긴다.

                        // 각 영역에 맞춰서 이미지 미리보기 
                        
                        switch(num){ 
                            case 1 : $('#titleImg').attr('src', e.target.result); break;
                            case 2 : $('#contentImg1').attr('src', e.target.result); break;
                            case 3 : $('#contentImg2').attr('src', e.target.result); break;
                            case 4 : $('#contentImg3').attr('src', e.target.result); break;
                        }
                        // 각각 이미지 태그에 점근해서 이미지 태그 src 속성에다 첨부한 이미지 경로를 넣어주게 되면 
                    }
                }
                else {
                    const str = 'https://cdn-icons-png.flaticon.com/512/6583/6583130.png';
                    switch(num){
                        case 1 : $('#titleImg').attr('src', str); break
                        case 2 : $('#contentImg1').attr('src', str); break;
                        case 3 : $('#contentImg2').attr('src', str); break;
                        case 4 : $('#contentImg3').attr('src', str); break;
                    }
                }
            };

            $(function(){ // '이미지없음' 이미지를 클릭하면 파일을 열리게끔 하기
                $('#file-area').click(function(){
                    $('#file').click();
                });

                $('#titleImg').click(function(){
                    $('#file1').click();
                });

                $('#contentImg1').click(function(){
                    $('#file2').click();
                });

                $('#contentImg2').click(function(){
                    $('#file3').click();
                })
            });

        </script>
        <br>
        <div align="center">
            <button type="submit" class="btn btn-sm btn-info">작성하기</button>
            <button type="reset" class="btn btn-sm btn-warning">다시쓰기</button>
        </div>
        
        

    </form>
   </div>

    

</body>
</html>