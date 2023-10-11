<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
    div {
        /*border: 1px solid red;*/
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
        border: 1px solid lightgrey;
        border-radius: 10px;
        margin-top: 15px;
        margin-left: 10px;
    }
    
    #img-place:hover ,#name-place:hover {
        cursor: pointer;
        opacity: 0.75;
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
        margin-top: 20px;
        margin-right: 10px;
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
                <img src="https://dangdangmap.net/upload/mapdata/C0070/thumb/content/C0070_F20210828164617001.jpg" alt="">
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
                <p>[카페] - [강원] 쿠키멍스터</p>
            </div>
        </div>
        <div class="place-content" align="center">
            <div id="img-place">
                <img src="https://dangdangmap.net/upload/mapdata/C0017/thumb/content/C0017_F20210818170734001.jpg" alt="">
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
                <p>[공원] - [강원] 휘바핀란드</p>
            </div>
        </div>
        <div class="place-content" align="center">
            <div id="img-place">
                <img src="https://dangdangmap.net/upload/mapdata/C0200/thumb/content/C0200_F20210831192731002.jpg" alt="">
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
                <p>[공원] - [강원] 청초호 호수공원</p>
            </div>
        </div>
    </div>
</body>
</html>