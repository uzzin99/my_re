<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-08-02
  Time: 오전 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
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
    <!-- Slick 불러오기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
    <!-- css -->
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/css/paymentDetails.css" rel="stylesheet" type="text/css" />
    <title>Payment</title>
</head>
<style>
    a:hover{
        cursor:pointer;
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
            <p align=right><a href="/cart">🛒</a> <a onclick=location.href='/login'>로그인</a> &nbsp;<a onclick=location.href='signin'>회원가입</a></p>
        </c:if>
        <c:if test="${userinfo != '' }">
            <c:if test="${userType == '손님' }">
                <p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${userinfo} 님🍮</a> &nbsp;<a href='/logout'>로그아웃</a></p>
            </c:if>
            <c:if test="${userType == '사장님' }">
                <p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${userinfo} 님👩🏻‍🍳</a> &nbsp;<a href='/logout'>로그아웃</a></p>
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
                        <li><a class="dropdown-item" href="/home">우리들의 이야기</a></li>
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
    <%--<div class="conbox con1">
        <div class="mar">
            <p>날짜</p>
            <div>
                <a href="/review">리뷰작성</a>
            </div>
            <div class="sName">
                <a>가게이름</a>
            </div>
            <div class="price">
                가격
            </div>
        </div>
    </div>--%>
        <div class="tab"><br>
            <input type="radio" name="tabmenu" id="tab01"  checked>
            <label for="tab01">주문내역</label>
            <input type="radio" name="tabmenu" id="tab02">
            <label for="tab02">예약내역</label>
            <input type="radio" name="tabmenu" id="tab03">
            <label for="tab03">리뷰내역</label>

            <div class="conbox con1" style="border: 2px solid #c4c2c2; margin-top: 20px;">
                <div class="mar">
                    <!-- <input readonly type="text" value="2022-08-22" style="float: right; text-align: right;"><br> -->
                    <table align="center" style="float: left; margin-top:13px;">
                        <tr><td style="width: 100px; height: 30px;">주문일</td><td>2022-08-22</td></tr>
                        <tr><td style="width: 100px; height: 30px;">가게명</td><td>마초쉐프</td></tr>
                        <tr><td style="width: 100px; height: 30px;">가격</td><td>20000원</td></tr>
                    </table>
                    <p style="float: left; margin: 50px 40px ;"><a href="/review" style="">리뷰작성💌</a></p>
                </div>
            </div>

            <c:forEach var='item' items='${list}'>
                <div class="conbox con2" style="border: 2px solid #c4c2c2; margin-top: 20px;">
                    <table align="center"  class="list" style="margin: auto; margin-top:25px;">
                        <tr><td style="width: 100px; height: 35px;">가게명</td><td style="width: 150px;">${item.SName}</td>
                            <td style="width: 100px;">예약날짜</td><td>${item.HDate}</td></tr>
                        <tr><td style="height: 35px;">예약시간</td><td>${item.HTime}</td>
                            <td>인원수</td><td>${item.HPeople}</td></tr>
                    </table>
                    <input type="button" value="예약취소" class="btlDel" id="${item.HSeqno}" style="float: right; width: 70px; margin-top: -80px; margin-right: 15px; background-color: #c4c2c2;">
                </div>
            </c:forEach><br>


            <c:forEach var="i" items="${rlist }">
                <div class="conbox con3" style="border: 2px solid #c4c2c2; margin-top: 20px;">
                    <div class="c" style="margin-top: 10px;">
                        <input readonly type="text"  value="${i.SName}">
                        <input readonly type="text"  value="${i.score }">
                        <input readonly type="text" style="float: right; width: auto; color: #333333" value="${i.RDate }"><br>
                        <textarea readonly><c:out value="${i.RContent }" /></textarea>
                        <input type="button" value="삭제" class="btnDel" id="${i.RSeqno}" style="float: right; background-color: #c4c2c2;">
                    </div>
                </div>
            </c:forEach><br>

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
    $(".btnDel").on("click",function(event){
        let delSe = $(this).attr("id");
        console.log(delSe);
        answer = confirm("정말 삭제하시겠습니까?");
        if(answer){
            $.ajax({
                url:'/reviewDel',
                type:'get',
                dataType:'json',
                data:{delSe:delSe},
                success:function(data){
                    console.log(data);
                    if(data == 1){
                        // $(".conbox con3").empty();
                        // $("#c").load(location.href + " #c");
                        location.reload();
                        // $("input:radio[id='tab03']").prop("checked",true);
                    }else{
                        alert("다시 시도해주세요");
                    }
                }
            })
        }
    })

    $(".btlDel").on("click",function(event){
        let delbo = $(this).attr("id");
        console.log(delbo);
        answer = confirm("예약취소 하시겠습니까?");
        if(answer){
            $.ajax({
                url:'/delbooking',
                type:'get',
                dataType:'json',
                data:{delbo:delbo},
                success:function(data){
                    console.log(data);
                    if(data == 1){
                        location.reload();
                    }else{
                        alert("다시 시도해주세요");
                    }
                }
            })
        }
    })
</script>
</html>
