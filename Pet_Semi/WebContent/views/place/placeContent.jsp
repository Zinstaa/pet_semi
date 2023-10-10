<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div {
        border: 1px solid red;
        box-sizing: border-box;
    }

    #list-area {
        text-align: center;
        border: 1px solid white;
    }

    .place-content {
        width: 250px;
        height: 200px;
        border: 1px solid lightgray;
        border-radius: 20px;
        background-color: #FFF8DB;
        display: inline-block;
        margin: 7px;
    }

    .place-content > #img-place, .place-content > #btn-place {
        float: left;
        height: 75%;
    }

    #img-place {
        width: 65%;
    }

    #img-place > img {
        width: 125px;
        height: 125px;
        border: 1px solid black;
        margin-top: 10px;
    }

    #btn-place {
        width: 35%;
    }

    #name-place {
        float: left;
        width: 100%;
        height: 25%;
        line-height: 49px;
    }

    .pl-btn {
        background-color: #ffce50;
        width: 50px;
        height: 50px;
        border-radius: 25px;
        margin-top: 15px;
        line-height: 40px;
    }

    #star > a > img {
		width: 30px;
		height: 30px;
		padding: 0;
		margin: 0;
	}

    #map > a > img {
		width: 24px;
		height: 24px;
		padding: 0;
		margin: 0;
	}
</style>
</head>
<body>
    <div id="list-area">
        <!-- 등록된 장소가 없을 때-->
        등록된 장소가 없습니다... <br>
        <!-- 등록된 장소가 있을 때-->
        <div class="place-content" align="center">
            <div id="img-place">
                <img src="" alt="">
            </div>
            <div id="btn-place">
                <div class="pl-btn" id="star">
                    <a href="https://kko.to/G2wEv1yqMf">
                        <img src="https://svgsilh.com/svg/1139372-ffffff.svg" alt="찜">
                    </a>
                </div>
                <div class="pl-btn" id="map">
                    <a href="https://kko.to/G2wEv1yqMf">
                        <img src="https://svgsilh.com/svg/1294814-ffffff.svg" alt="지도">
                    </a>
                </div>
            </div>
            <div id="name-place">
                <p>No.1 | [카테고리] - [지역] 장소명</p>
            </div>
        </div>
        <div class="place-content" align="center">
            <div id="img-place">
                <img src="" alt="">
            </div>
            <div id="btn-place">
                <div class="pl-btn" id="star">
                    <a href="https://kko.to/G2wEv1yqMf">
                        <img src="https://svgsilh.com/svg/1139372-ffffff.svg" alt="찜">
                    </a>
                </div>
                <div class="pl-btn" id="map">
                    <a href="https://kko.to/G2wEv1yqMf">
                        <img src="https://svgsilh.com/svg/1294814-ffffff.svg" alt="지도">
                    </a>
                </div>
            </div>
            <div id="name-place">
                <p>No.2 | [카테고리] - [지역] 장소명</p>
            </div>
        </div>
        <div class="place-content" align="center">
            <div id="img-place">
                <img src="" alt="">
            </div>
            <div id="btn-place">
                <div class="pl-btn" id="star">
                    <a href="https://kko.to/G2wEv1yqMf">
                        <img src="https://svgsilh.com/svg/1139372-ffffff.svg" alt="찜">
                    </a>
                </div>
                <div class="pl-btn" id="map">
                    <a href="https://kko.to/G2wEv1yqMf">
                        <img src="https://svgsilh.com/svg/1294814-ffffff.svg" alt="지도">
                    </a>
                </div>
            </div>
            <div id="name-place">
                <p>No.3 | [카테고리] - [지역] 장소명</p>
            </div>
        </div>
    </div>
</body>
</html>