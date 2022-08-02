<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <script src="https://kit.fontawesome.com/c07327e483.js" crossorigin="anonymous"></script> -->
    <script src="https://js.tosspayments.com/v1"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <!-- Slick 불러오기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <!-- base css -->
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <!-- 섹션 css -->
    <link href="css/cart.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4147e05761dc8e1e1adacb8d5d113391&libraries=services,clusterer,drawing"></script>
    <meta charset="UTF-8">
<style>
    .dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
    .dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
    .number {font-weight:bold;color:#ee6152;}
    .dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
    .distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
    .distanceInfo:after {content:none;}
</style>

<title>Cart</title>
</head>
<style>
    a:hover{
        cursor: pointer;
    }
    .logo:hover{
        cursor:pointer;
    }
</style>
<body>
<div id="wrap" class="wrap mx-auto"></div>
<!-- 여기가 헤드 -->
<header>
    <div class="login">
        <c:if test="${userinfo == null }">
            <p align=right><a href="/cart">🛒</a> <a onclick=location.href='login'>로그인</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
        </c:if>
        <c:if test="${userinfo != '' }">
            <c:if test="${userType == '손님' }">
                <p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${userinfo} 님🍮</a> &nbsp;<a href='logout'>로그아웃</a></p>
            </c:if>
            <c:if test="${userType == '사장님' }">
                <p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${userinfo} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>로그아웃</a></p>
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
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Menu</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        배달&포장
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="store?type=1">한식</a></li>
                        <li><a class="dropdown-item" href="store?type=2">중식</a></li>
                        <li><a class="dropdown-item" href="store?type=3">일식</a></li>
                        <li><a class="dropdown-item" href="store?type=4">양식</a></li>
                        <li><a class="dropdown-item" href="store?type=5">치킨</a></li>
                        <li><a class="dropdown-item" href="store?type=6">피자</a></li>
                        <li><a class="dropdown-item" href="store?type=7">분식</a></li>
                        <li><a class="dropdown-item" href="store?type=8">디저트</a></li>
                        <li><a class="dropdown-item" href="store?type=9">족발/보쌈</a></li>
                        <li><a class="dropdown-item" href="store?type=10">고기/구이</a></li>
                        <li><a class="dropdown-item" href="store?type=11">아시안</a></li>
                        <li><a class="dropdown-item" href="store?type=12">패스트푸드</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        홀예약
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="store?type=1">한식</a></li>
                        <li><a class="dropdown-item" href="store?type=2">중식</a></li>
                        <li><a class="dropdown-item" href="store?type=3">일식</a></li>
                        <li><a class="dropdown-item" href="store?type=4">양식</a></li>
                        <li><a class="dropdown-item" href="store?type=5">치킨</a></li>
                        <li><a class="dropdown-item" href="store?type=6">피자</a></li>
                        <li><a class="dropdown-item" href="store?type=7">분식</a></li>
                        <li><a class="dropdown-item" href="store?type=8">디저트</a></li>
                        <li><a class="dropdown-item" href="store?type=9">족발/보쌈</a></li>
                        <li><a class="dropdown-item" href="store?type=10">고기/구이</a></li>
                        <li><a class="dropdown-item" href="store?type=11">아시안</a></li>
                        <li><a class="dropdown-item" href="store?type=12">패스트푸드</a></li>
                    </ul>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        게시판
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="home">우리들의 이야기</a></li>
                        <li><a class="dropdown-item" href="#">Q&A</a></li>
                        <li><a class="dropdown-item" href="#">자주묻는질문</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <form class="d-flex" name="formsearch" method="post" action="search/store" encType="UTF-8" align="center">
        <input class="form-control me-2" name="word" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-dark" type="submit">Search</button>
    </form>
</nav>

<section>
    <div class="cart" align="center"><br>
        <div id="cart_header"><span class="cartname">🛒장바구니🛒</span></div>
        <c:forEach var="i" items='${cart}'>
            <div id="cart_body"><br>
                <div class="cart_body_menu" id="${i.SSe}" style="float: left; margin-left:350px">
                    <input readonly type="text" value="${i.menuName}">
                    <input readonly type="text" class="cntprice" id="${i.menuPrice}" value="${i.menuPrice * i.menuCnt}" >
                    <input type='button' id="${i.cartSeqno}" class="del_btn" value='x'/>
                    <br>
                    <div style="float: right; margin-left: 10px;">
                        <input type='button' style="display: inline-block;" id="${i.cartSeqno}" class="minus_btn" value='-'/>
                        <input readonly type="text" style="display: inline-block;" id="${i.cartSeqno}" class="quantity_input" value="${i.menuCnt}">
                        <input type='button' style="display: inline-block;" id="${i.cartSeqno}" class="plus_btn" value='+'/>
                        <input type="button" class="modify_btn" id="${i.cartSeqno}" value="수량변경"/>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div id="cart_footer" style="clear: both;"><br>
            <p><span> 총 주문금액</span>&nbsp;<input readonly type="text" id="totalPrice" value=""></p>
            <p><span> 배달팁</span>&nbsp;<input readonly type="text" id="tips" value="">&nbsp;&nbsp;
            <i id="btnMap" title="배달팁이 궁금하시면 클릭해보세요!" class="bi bi-question-circle"></i></p>
            <div id="divMap" style="display: block">
                <div id="map" style="width:500px;height:400px;margin-right: auto;margin-left: auto;"></div>
            <br>
            </div>
            <p><span> 결제예정금액</span>&nbsp;<input readonly type="text" id="totalSum" value=""></p>
        </div>
        <div class="button_set">
            <input type="button" id="btn_buy" class="btn_buy" value="주문하기">
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
    let clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
    let distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
    let dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
    let bycicleHour, bycicleMin, walkHour, walkMin;
    var markers=[];
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    };
    var map = new kakao.maps.Map(container, options);

    // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여
    // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
    // HTML Content를 만들어 리턴하는 함수입니다
    function getTimeHTML(distance) {

        // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
        var walkkTime = distance / 67 | 0;
        walkHour = '', walkMin = '';

        // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
        if (walkkTime > 60) {
            walkHour = '<a class="number">' + Math.floor(walkkTime / 60) + '</a>시간 '
        }
        walkMin = '<a class="number">' + walkkTime % 60 + '</a>분'

        // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
        var bycicleTime = distance / 227 | 0;
        bycicleHour = '', bycicleMin = '';

        // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
        if (bycicleTime > 60) {
            bycicleHour = '<a class="number">' + Math.floor(bycicleTime / 60) + '</a>시간 '
        }
        bycicleMin = '<a class="number">' + bycicleTime % 60 + '</a>분'

        // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
        var content = '<ul class="dotOverlay distanceInfo">';
        content += '    <li>';
        content += '        <a class="label">총거리</a><a class="number">' + distance + '</a>m';
        content += '    </li>';
        content += '    <li>';
        content += '        <a class="label">도보</a>' + walkHour + walkMin;
        content += '    </li>';
        content += '    <li>';
        content += '        <a class="label">자전거</a>' + bycicleHour + bycicleMin;
        content += '    </li>';
        content += '</ul>'

        return content;
    }
    // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
    //마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
    function showDistance(content, position) {
        distanceOverlay = new kakao.maps.CustomOverlay({
            map: map, // 커스텀오버레이를 표시할 지도입니다
            content: content,  // 커스텀오버레이에 표시할 내용입니다
            position: position, // 커스텀오버레이를 표시할 위치입니다.
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 3
        });
    }
    function deleteClickLine() {
        if (clickLine) {
            clickLine.setMap(null);
            clickLine = null;
        }
    }
    function deleteDistnce () {
        if (distanceOverlay) {
            distanceOverlay.setMap(null);
            distanceOverlay = null;
        }
    }
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    $(document)
        .ready(function (){
            Mapping('${Maddr}','${Saddr}');
            $('#divMap').attr("style","display:none;");
        })
    $('#btnMap').on('click',function(){
        Mapping('${Maddr}','${Saddr}');
        $('#divMap').slideToggle('normal');
    })
    $(".modify_btn").on("click",function (){
        let quantity = $(this).parent("div").find(".quantity_input").val();
        let cartSe = $(this).attr("id");
        console.log(quantity,cartSe);
        $.ajax({
            url:'modifyCount',
            type:'get',
            dataType:'json',
            data:{cnt:quantity,
                cartSe:cartSe},
            success:function(data){
                console.log(data);
                if(data == 1){
                    console.log("새로고침 하기전");
                    location.reload();
                }else{
                    alert("다시 시도해주세요");
                }

            }
        })
    })

    //수량 버튼 조작
    $(".plus_btn").on("click",function(){
        let quantity = $(this).parent("div").find(".quantity_input").val();
        $(this).parent("div").find(".quantity_input").val(++quantity);
        let cntprice = $(this).parent("div").parent("div").find(".cntprice").attr('id');
        $(this).parent("div").parent("div").find(".cntprice").val(cntprice*quantity);
        total();
    })
    $(".minus_btn").on("click",function(){
        let quantity = $(this).parent("div").find(".quantity_input").val();
        let cntprice = $(this).parent("div").parent("div").find(".cntprice").attr('id');
        if(quantity > 1){
            $(this).parent("div").find(".quantity_input").val(--quantity);
            $(this).parent("div").parent("div").find(".cntprice").val(cntprice*quantity);
            total();
        }
    })

    //메뉴 삭제
        $(".del_btn").on("click",function(event){
            // $(window).off("beforeunload");
            let delBtn = $(this).attr("id");
            console.log(delBtn);
            answer = confirm("선택메뉴를 삭제하시겠습니까?");
            if(answer){
                $.ajax({
                    url:'delcart',
                    type:'get',
                    dataType:'json',
                    data:{delSe:delBtn},
                    success:function(data){
                        console.log(data);
                        if(data == 1){

                            console.log("새로고침 하기전");
                            location.reload();
                            console.log("새로고침완료");
                        }else{
                            alert("다시 시도해주세요");
                        }
                    }
                })
            }

        })


    function total(){
        let totalprice = 0;
        let deliveryprice = 0;
        let totalsum = 0;
        $(".cart_body_menu").each(function (index, element){
            totalprice += parseInt($(element).find(".cntprice").val());
            console.log(totalprice);
        })
        deliveryprice = $('#tips').val();
        totalsum = parseInt(totalprice) + parseInt(deliveryprice);
        console.log("totalprice = "+totalprice)
        console.log("deliveryprice = "+deliveryprice)
        console.log("totalsum = "+totalsum)
        $("#totalPrice").val(totalprice);
        $('#totalSum').val(totalsum);
    }

    var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
    var tossPayments = TossPayments(clientKey)

    var button = document.getElementById('btn_buy'); // 결제하기 버튼
    button.addEventListener('click', function () {
        if(parseInt(${size})==1){
            ODname = $('.cart_body_menu').find('input:eq(0)').val()
        }else{
            ODname = $('.cart_body_menu').find('input:eq(0)').val()+' 외 '+(parseInt(${size})-1)+'건';
        }
    tossPayments.requestPayment('카드', {
        customerName:'${userinfo}',
        amount: $('#totalSum').val(),
        orderId: getUUID(),
        orderName: ODname,
        successUrl: 'http://localhost:8080/orderList?sSe='+$('.cart_body_menu').attr('id'),
        failUrl: 'http://localhost:8080/cart',
        })
    })

    // var checkUnload = true;
    // $(window).on("beforeunload",function(){
    //     console.log(checkUnload);
    //     if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다";
    // })
    //두 지점의 좌표를 검색해서 거리를 받아옴
    function Mapping(addr1,addr2){
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(addr1, function(result, status) {
            for(i=0;i<markers.length;i++){
                markers[i].setMap(null);
            }
            // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
            deleteClickLine();

            // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
            deleteDistnce();


            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
                markers.push(marker);
            }
            geocoder.addressSearch(addr2, function(result, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {
                    var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker2 = new kakao.maps.Marker({
                        map: map,
                        position: coords2
                    });
                    markers.push(marker2);
                }
                var clickPosition = coords;
                clickLine = new kakao.maps.Polyline({
                    map: map, // 선을 표시할 지도입니다
                    path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
                    strokeWeight: 3, // 선의 두께입니다
                    strokeColor: '#db4040', // 선의 색깔입니다
                    strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                    strokeStyle: 'solid' // 선의 스타일입니다
                });

                // 그려지고 있는 선의 좌표 배열을 얻어옵니다
                var path = clickLine.getPath();
                // 좌표 배열에 클릭한 위치를 추가합니다
                path.push(coords2);
                // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
                clickLine.setPath(path);
                var distance = Math.round(clickLine.getLength());
                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

                var Lat1 = coords.getLat();
                var Lat2 = coords2.getLat();
                var Lat3 = Lat1+Lat2;
                var Lng1 = coords.getLng();
                var Lng2 = coords2.getLng();
                var Lng3 = Lng1+Lng2;
                var last = new kakao.maps.LatLng(Lat3/2,Lng3/2)
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(last);
                if(distance<50){
                    map.setLevel(1)
                }else if(distance<200){
                    map.setLevel(2)
                }else if(distance<400){
                    map.setLevel(3)
                }else if(distance<800){
                    map.setLevel(4)
                }else if(distance<1600){
                    map.setLevel(5)
                }else if(distance<3200){
                    map.setLevel(6)
                }else if(distance<6400){
                    map.setLevel(7)
                }else if(distance<12800){
                    map.setLevel(8)
                }else if(distance<25600){
                    map.setLevel(9)
                }else if(distance<51200){
                    map.setLevel(10)
                }else if(distance<75000){
                    map.setLevel(11)
                }else if(distance<102400){
                    map.setLevel(12)
                }else if(distance<204800){
                    map.setLevel(13)
                }else if(distance<409600){
                    map.setLevel(14)
                }
                // 그려진 선의 거리정보를 지도에 표시합니다
                showDistance(content, path[path.length-1]);
                if(distance<2000){
                    $('#tips').val(4000);
                }
                else if(distance>=2000){
                    var additionalTip = Math.ceil((distance-2000)/500)*1000
                    $('#tips').val(4000+additionalTip);
                }
                total();
            });
        })
    }
    function getUUID() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 3 | 8);
            return v.toString(16);
        });
    }

</script>
</html>