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
    <!-- base css -->
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <!-- 섹션 css -->
    <link href="css/cart.css" rel="stylesheet" type="text/css" />
<title>Cart</title>
</head>
<body>
<div id="wrap" class="wrap mx-auto"></div>
<!-- 여기가 헤드 -->
<header>
    <div class="login">
        <c:if test="${userinfo == '' }">
            <p align=right><a href="cart.jsp">🛒</a> <a onclick=location.href='login'>로그인</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
        </c:if>
        <c:if test="${userinfo != '' }">
            <c:if test="${userType == '손님' }">
                <p align=right><a href="cart.jsp">🛒</a> <a onclick=location.href='/signUp'>${userinfo} 님🍮</a> &nbsp;<a href='logout'>로그아웃</a></p>
            </c:if>
            <c:if test="${userType == '사장님' }">
                <p align=right><a href="cart.jsp">🛒</a> <a onclick=location.href='/signUp'>${userinfo} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>로그아웃</a></p>
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
                <div class="cart_body_menu" style="float: left; margin-left:350px">
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
            <p><span> 배달팁</span>&nbsp;<input readonly type="text"  value=""></p>
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
    $(document)
        .ready(function (){
            total();
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

    totalsum = totalprice + deliveryprice;

    $("#totalPrice").val(totalprice);
    $('#totalSum').val(totalsum);
    }

    var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
    var tossPayments = TossPayments(clientKey)

    var button = document.getElementById('btn_buy'); // 결제하기 버튼
    //결제금액 장바구니 결제금액으로 바꾸기~~
    button.addEventListener('click', function () {
    tossPayments.requestPayment('카드', {
        amount: 10,
        orderId: 'fRuaF2HAH6hCM0yZq385v',
        orderName: '토스 티셔츠 외 2건',
        customerName: '박토스',
        successUrl: 'http://localhost:8080/main',
        failUrl: 'http://localhost:8080/cart',
        })
    })

    // var checkUnload = true;
    // $(window).on("beforeunload",function(){
    //     console.log(checkUnload);
    //     if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다";
    // })

</script>
</html>