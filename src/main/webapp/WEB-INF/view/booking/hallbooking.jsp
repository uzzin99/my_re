<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <script src="https://kit.fontawesome.com/c07327e483.js" crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- 달력 불러오기 -->
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<!-- css -->
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/hallbooking.css" rel="stylesheet" type="text/css" />
<%--  카카오 지도 appkey  --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4147e05761dc8e1e1adacb8d5d113391&libraries=services,clusterer,drawing"></script>
<title>Hall</title>
<style>
    input {
        background-color: #c4c2c2;
    }
    a:hover {
        cursor: pointer;
    }
    .logo:hover{
        cursor:pointer;
    }
    #zlog:hover{
        cursor:pointer;
    }
    #adlogo:hover{
        cursor:pointer;
    }
</style>
</head>
<body>
<div id="wrap" class="wrap mx-auto"></div>
<!-- 여기가 헤드 -->
<header>
    <div class="login">
        <c:if test="${mName == null }">
            <p align=right><a href="/cart">🛒</a> <a onclick=location.href='login'>로그인</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
        </c:if>
        <c:if test="${mName != '' }">
            <c:if test="${userType == '손님' }">
                <p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${mName} 님🍮</a> &nbsp;<a href='logout'>로그아웃</a></p>
            </c:if>
            <c:if test="${userType == '사장님' }">
                <p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${mName} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>로그아웃</a></p>
            </c:if>
            <c:if test="${userType == 'admin'}">
                <p align=right><a onclick=location.href='/main'>관리자님</a> &nbsp;<a href='/logout'>로그아웃</a></p>
            </c:if>
        </c:if>
    </div>

    <p align="center" onclick=location.href='/main'><img class="logo" src="https://img.etnews.com/photonews/1711/1016498_20171123150540_893_0001.jpg"></p>
</header>

<!-- 여기가 네비바 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/main">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" aria-current="page" href="#">Menu</a>--%>
<%--                </li>--%>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        배달&포장
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="/store?type=1">한식</a></li>
                        <li><a class="dropdown-item" href="/store?type=2">중식</a></li>
                        <li><a class="dropdown-item" href="/store?type=3">일식</a></li>
                        <li><a class="dropdown-item" href="/store?type=4">양식</a></li>
                        <li><a class="dropdown-item" href="/store?type=5">치킨</a></li>
                        <li><a class="dropdown-item" href="/store?type=6">피자</a></li>
                        <li><a class="dropdown-item" href="/store?type=7">분식</a></li>
                        <li><a class="dropdown-item" href="/store?type=8">디저트</a></li>
                        <li><a class="dropdown-item" href="/store?type=9">족발/보쌈</a></li>
                        <li><a class="dropdown-item" href="/store?type=10">고기/구이</a></li>
                        <li><a class="dropdown-item" href="/store?type=11">아시안</a></li>
                        <li><a class="dropdown-item" href="/store?type=12">패스트푸드</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        홀예약
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="/hall?type=1">한식</a></li>
                        <li><a class="dropdown-item" href="/hall?type=2">중식</a></li>
                        <li><a class="dropdown-item" href="/hall?type=3">일식</a></li>
                        <li><a class="dropdown-item" href="/hall?type=4">양식</a></li>
                        <li><a class="dropdown-item" href="/hall?type=5">치킨</a></li>
                        <li><a class="dropdown-item" href="/hall?type=6">피자</a></li>
                        <li><a class="dropdown-item" href="/hall?type=7">분식</a></li>
                        <li><a class="dropdown-item" href="/hall?type=8">디저트</a></li>
                        <li><a class="dropdown-item" href="/hall?type=9">족발/보쌈</a></li>
                        <li><a class="dropdown-item" href="/hall?type=10">고기/구이</a></li>
                        <li><a class="dropdown-item" href="/hall?type=11">아시안</a></li>
                        <li><a class="dropdown-item" href="/hall?type=12">패스트푸드</a></li>
                    </ul>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        게시판
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="/SearchWordReJstf?goto=1" >우리들의 이야기</a></li>
                        <li><a class="dropdown-item" href="/SearchWordReJstf?goto=2">Q&A</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <form class="d-flex" name="formsearch" method="post" action="/search/store" encType="UTF-8" align="center">
        <input class="form-control me-2" name="word" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-dark" type="submit">Search</button>
    </form>
</nav>

<section>

    <table>
        <tr><br>
            <td>
                <input type="hidden" id=mid name="mid" value="${userinfo}">
                <input type="hidden" id=sSe name="sSe" value="${storename.SSeqno}">

                <p><input type="text" readonly value="${storename.SName }"
                          style="font-size:20px; text-align:center; background: linear-gradient(to top, #39c0c0 40%, transparent 50%);"></p>

                <div class="mySt" style="float:left; margin-left: 44%">
                    <input type="checkbox" name="rating" value="10" id="rat1" <c:if test="${avg > 8}">checked="checked"</c:if> disabled="disabled"/><label for="rat1">⭐</label>
                    <input type="checkbox" name="rating" value="8" id="rat2" <c:if test="${avg > 6 && avg <= 8}">checked="checked"</c:if> disabled="disabled"/><label for="rat2">⭐</label>
                    <input type="checkbox" name="rating" value="6" id="rat3" <c:if test="${avg > 4 && avg <= 6}">checked="checked"</c:if> disabled="disabled"/><label for="rat3">⭐</label>
                    <input type="checkbox" name="rating" value="4" id="rat4" <c:if test="${avg > 2 && avg <= 4}">checked="checked"</c:if> disabled="disabled"/><label for="rat4">⭐</label>
                    <input type="checkbox" name="rating" value="2" id="rat5" <c:if test="${avg > 0 && avg <= 2}">checked="checked"</c:if> disabled="disabled"/><label for="rat5">⭐</label>  <!-- 젤 왼쪽 별 -->
                </div>
                <p style="float: left;">&nbsp;&nbsp;
                    <c:if test="${cnt != ''}">${avg}</c:if>
                    <c:if test="${cnt == ''}">0</c:if></p>
                <p style="clear: both">최근리뷰
                    <c:if test="${cnt != ''}">${cnt}</c:if>
                    <c:if test="${cnt == ''}">0</c:if>
                    |
                    <c:if test="${userinfo == null}">
                        <label id="zlog">🤍 ${zcnt} </label>
                    </c:if>

                    <c:if test="${userinfo != null}">
                        <c:if test="${userType == '손님'}">
                            <c:if test="${count==0}">
                                <label for="btnchoice" id="choice1"><input type="button" id="btnchoice">🤍 ${zcnt} </label>
                            </c:if>
                            <c:if test="${count==1}">
                                <label for="btnchoice" id="choice2"><input type="button" id="btnchoice">
                                <span id="zlogo">❤</span> ${zcnt} </label>
                            </c:if>
                        </c:if>
                        <c:if test="${userType == '사장님' || userType == 'admin'}">
                            <label><span id="adlogo">❤</span> ${zcnt} </label>
                        </c:if>
                    </c:if>
                    | 공유</p>
            </td>
        </tr>
    </table>

    <div align="center">
    </div>

    <div class="tab"><br>

        <input type="radio" name="tabmenu" id="tab01" checked>
        <label for="tab01">예약</label>
        <input type="radio" name="tabmenu" id="tab02">
        <label for="tab02">리뷰</label>
        <input type="radio" name="tabmenu" id="tab03">
        <label for="tab03">가게정보</label>

        <div class="conbox con1" align="center">
            <p>예약날짜 <input type='date' id="currentDate" style="margin-top: 15px;"/></p>
            <p>예약시간선택</p>
            <div class="time">
                <input type="radio" name="touch" id="time01" value="14:00" checked>
                <label for="time01">14:00</label>
                <input type="radio" name="touch" id="time02" value="14:30">
                <label for="time02">14:30</label>
                <input type="radio" name="touch" id="time03" value="15:00">
                <label for="time03">15:00</label>
                <input type="radio" name="touch" id="time04" value="15:30">
                <label for="time04">15:30</label>
                <input type="radio" name="touch" id="time05" value="16:00">
                <label for="time05">16:00</label>
                <br>
                <input type="radio" name="touch" id="time06" value="16:30">
                <label for="time06">16:30</label>
                <input type="radio" name="touch" id="time07" value="17:00">
                <label for="time07">17:00</label>
                <input type="radio" name="touch" id="time08" value="17:30">
                <label for="time08">17:30</label>
                <input type="radio" name="touch" id="time09" value="18:00">
                <label for="time09">18:00</label>
                <input type="radio" name="touch" id="time10" value="18:30">
                <label for="time10">18:30</label>
                <br>
                <input type="radio" name="touch" id="time11" value="19:00">
                <label for="time11">19:00</label>
                <input type="radio" name="touch" id="time12" value="19:30">
                <label for="time12">19:30</label>
                <input type="radio" name="touch" id="time13" value="20:00">
                <label for="time13">20:00</label>
                <input type="radio" name="touch" id="time14" value="20:30">
                <label for="time14">20:30</label>
                <input type="radio" name="touch" id="time15" value="21:00">
                <label for="time15">21:00</label>
            </div>

            <p style="text-align: right;">인원수 <input type="text" id="Bnum" ></p>
            <p style="text-align: right;">예약자 <input type="text" id="Bname" value="${mName}"></p>
            <p style="text-align: right;">예약자ID <input type="text" id="BId" value="${userinfo}" readonly></p>
            <p style="text-align: right;">연락처 <input type="text" id="Bmobile" value="${mMobile}"></p>
            <p style="text-align: right;">요청사항 <input type="text" id="Brequest"></p>
            <input type="button" id="order" value="주문하기">
        </div>

        <c:if test="${rlist.size() < 1}">
            <div class="conbox con2">
                <div id="b">
                    <br><h5>등록된 리뷰가 없습니다.</h5>
                </div>
            </div>
        </c:if>
        <c:forEach var="i" items="${rlist }">
            <div class="conbox con2" align="center"><br>
                <div id="b">
                    <input readonly type="text" style="float: left; margin-left: 20px;" value="${i.MId}">
                    <div class="mySt">
                        <input type="checkbox" name="rating" value="10" id="rate1" <c:if test="${i.score == 10}">checked="checked"</c:if> disabled="disabled"/><label for="rate1">⭐</label>
                        <input type="checkbox" name="rating" value="8" id="rate2" <c:if test="${i.score == 8}">checked="checked"</c:if> disabled="disabled"/><label for="rate2">⭐</label>
                        <input type="checkbox" name="rating" value="6" id="rate3" <c:if test="${i.score == 6}">checked="checked"</c:if> disabled="disabled"/><label for="rate3">⭐</label>
                        <input type="checkbox" name="rating" value="4" id="rate4" <c:if test="${i.score == 4}">checked="checked"</c:if> disabled="disabled"/><label for="rate4">⭐</label>
                        <input type="checkbox" name="rating" value="2" id="rate5" <c:if test="${i.score == 2}">checked="checked"</c:if> disabled="disabled"/><label for="rate5">⭐</label>  <!-- 젤 왼쪽 별 -->
                    </div>
                    <input readonly type="text" style="float: right; margin-right: 10px; width: auto; color: #333333" value="${i.RDate }"><br>
                    <textarea readonly style="width: 70%; height: 30px;"><c:out value="${i.RContent }" /></textarea>
                    <c:if  test="${userinfo == 'admin'}">
                        <input type="button" class="adminDel" id="${i.RSeqno}" value="삭제" style="color: orangered;">
                    </c:if>
                </div>
            </div>
        </c:forEach>

        <div class="conbox con3">
            <div><br>
                대표자명: ${member.MName}<br>
                상호명: ${storename.SName}<br>
                가게번호: ${storename.SMobile}<br>
                사업자주소: ${storename.SAddress}${storename.SExtraaddress},<br>${storename.SDetailaddress}<br>
                사업자등록번호: ${storename.bsNum}
                <div id="map" style="width:500px;height:300px;margin-right: auto;margin-left: auto;"></div>
            </div>
        </div>
    </div>
</section>

<footer id="footer">
    <div class="container2">
        <div class="row">
            <div class="footer">
                <ul>
                    <li><a href="#">사이트 도움말</a></li>
                    <li><a href="#">사이트 이용약관</a></li>
                    <li><a href="#">사이트 운영원칙</a></li>
                    <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                    <li><a href="#">책임과 한계와 법적고지</a></li>
                    <li><a href="#">개시중단요청서비스</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>
                <address>
                    Cappyright ㉿
                    <a href="http://naver.com"><strong>NAVER.</strong>
                    </a>
                </address>
            </div>
        </div>
    </div>
</footer>
</body>
<script>
    $(document)
    /*현재날짜*/
    document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

    $('.adminDel').on('click',function(){
        let admindel = $(this).attr("id");
        console.log(admindel);
        $.ajax({
            url:'/reviewDel',
            type:'get',
            dataType:'json',
            data:{delSe:admindel},
            success:function(data){
                console.log(data);
                if(data == 1){
                    alert("삭제되었습니다.");
                    location.reload();
                }else{
                    alert("다시 시도해주세요");
                }
            }
        })
    })

    $('#order').on('click',function (){
        console.log("클릭");
        if(${userinfo == null }) {
            location.href = "/errorLogin";
        } else {
            console.log("ajax 실행전")
            $.ajax({
                type: 'post',
                url: 'hallbookingadd',
                dataType: 'json',
                data: {
                    hTime: $("input[type=radio][name=touch]:checked").val(),
                    sSeqno: $("#sSe").val(),
                    hDate: $("#currentDate").val(),
                    // hTime:$("#currentTime").val(),
                    hPeople: $("#Bnum").val(),
                    hOnepeople: $("#Bname").val(),
                    mId: $("#BId").val(),
                    hMobile: $("#Bmobile").val(),
                    hRequest: $("#Brequest").val(),
                },
                success: function (data) {
                    console.log(data);

                    location.href = 'bookingend?hseqno=' + data;
                }
            })
        }
    })

    $('#adlogo').on('click',function(){
        alert("손님으로 로그인해주세요.");
    })
    $('#zlog').on('click',function(){
        alert("로그인 후 사용가능합니다.");
    })
    $('#choice1').on('click',function(){
        let mid = $('#mid').val();
        let sSe = $('#sSe').val();
        console.log("mid=" + mid + "sSe=" + sSe);
        console.log("check on");
        $.ajax({
            url: "/store/z_Check", type: "get",
            data: {mid: mid, sSe: sSe},
            dataType: 'text',
            success: function () {
                location.reload(true);
            }
        })
    })
    $('#choice2').on('click',function(){
        let mid=$('#mid').val();
        let sSe=$('#sSe').val();
        console.log("mid="+mid+"sSe="+sSe);
        console.log("check off");
        $.ajax({
            url:"/store/z_Delete", type:"get",
            data:{mid:mid, sSe:sSe},
            dataType:'text',
            success: function(){
                location.reload(true);
            }
        })
    })

    /*지도 불러오기*/
        $('#tab03').on('click',function(){
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch('${storename.SAddress}', function(result, status) {

                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                }
            });
        })
</script>
</html>
