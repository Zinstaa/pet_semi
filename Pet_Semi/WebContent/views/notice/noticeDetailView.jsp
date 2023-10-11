<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 읽기</title>

<style>
	div{border : 1px solid blue;}
    
    .title-area-inform{
        margin : 0;
        margin-left : 30px;
        display:inline-block;
    }

    .title-area-inform > span {
        position: relative;
        padding-right : 20px;
        
    }
    .title-area-inform > span:after {
        position: absolute;
        content : '';
        right: 9px;
        height: 24px;
        width: 1px;
        background: #ccc;
    }

    .outer1{
        width: 1200px;
		height: 750px;
        margin : auto;
		padding-top: 125px;
        background-color: #fff5ce;
        color: black;
    }
    #title{
        font-size: 25px;
        font-weight: 500;
    }
    #inform{
        text-align: right;
    }

    
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>

    <div class="outer1">
        
            <div id="title-area">
                <table>
                    <tr>
                        <td id="title">일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십삼십삼</td>
                        <td id="inform">
                            <p class="title-area-inform">
                                <span>작성일</span>                            
                                2023-10-10
                            </p>
                            <p class="title-area-inform">
                                <span>작성자</span>
                                admin
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="content-area">
               
                10일 국회 과학기술정보방송통신위원회(위원장 장제원) 국정감사에서 박완주 무소속 의원은 이동관 방통위원장에게 “가짜뉴스는 독일 나치당이 자신들에 맞지 않는 정보를 가리키며 쓴 신조어”라며 “오보와 가짜뉴스는 어떤 차이가 있나”라고 물었다.

                이 위원장이 “고의성 여부”라고 답하자 박 의원은 “누가 판단하나”라고 다시 물었다. 
                이 위원장은 “심의기관, 최종적으로 법원이 판단하겠습니다만”이라고 하자 박 의원은 “그게 위험하다”며 “20대 국회에서 가짜뉴스 정의와 판단에 대한 논의를 했다. 많은 논의가 필요해 신중하게 검토하고 있는데 최근에 굉장히 빠르게 논의되고 있다”고 했다. 
                문재인 정부 당시 규제 시도가 있었으나 표
                
                출처 : 미디어오늘(http://www.mediatoday.co.kr)

                
            </div>
            <div id="button-area">
                <button>목록으로</button>
            </div>
        
    </div>
    
    
</body>
</html>