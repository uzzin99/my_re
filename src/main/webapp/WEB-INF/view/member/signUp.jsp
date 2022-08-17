<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

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
    <script src="https:/6/cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
    <!-- css -->
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="css/signUp.css" rel="stylesheet" type="text/css" />
    <title>singUp</title>
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
        <c:if test="${mname == null }">
            <p align=right><a href="/cart">🛒</a> <a onclick=location.href='login'>로그인</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
        </c:if>
        <c:if test="${mname != '' }">
            <c:if test="${userType == '손님' }">
                <p align=right><a href="/cart">🛒</a> <a onclick=location.href='signUp'>${mname} 님🍮</a> &nbsp;<a href='logout'>로그아웃</a></p>
            </c:if>
            <c:if test="${userType == '사장님' }">
                <p align=right><a href="/cart">🛒</a> <a onclick=location.href='signUp'>${mname} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>로그아웃</a></p>
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
    <div align="center"><br><br>
        <h2>계정 정보</h2><br>
        <div onclick=location.href='signUp/checkpwd'>
            <p>${mdto.MName } 님</p>
        </div>
        <div onclick=location.href='signUp/informationUp'>
            <p>로그인 정보</p>
        </div>
        <c:if test="${userType == '손님' }">
            <div onclick=location.href='signUp/payment'>
                <p>주문내역</p>
            </div>
            <div onclick=location.href='signUp/deliveryUp'>
                <p>배송지 관리 (총 ${cnt }건)</p>
                <p>현재 주소지: ${mdto.MAddress } ${mdto.MExtraAddress}, ${mdto.MDetailAddress }</p>
            </div>
            <a id=back class="back">돌아가기</a>&nbsp;&nbsp;&nbsp;
            <a id=delInformationu class="back 01">회원탈퇴</a>
        </c:if>
        <c:if test="${userType == '사장님' }">
            <div>
                <c:if test="${cntStore == 0}">
                    <div onclick=location.href='s_up'>
                        <a>등록된 가게가 없습니다. 가게를 등록해 주세요.</a><br>
                    </div>
                </c:if>
                <c:if test="${cntStore == 1}">
                    <div onclick=location.href='s_info'>
                        <table class="storeIntro"><br><br>
                            <tr>
                                <td rowspan=3 class="img" style="width: 250px;" align="center">
                                    <c:if test="${sVO.SImg==null}"><img id=logoImg src="static/upload/imgload.png"> </c:if>
                                    <c:if test="${sVO.SImg!=null}"><img id=logoImg src='/img/${sVO.SImg}'></c:if>
                                </td>
                                <td style="width: 100px;">가게명</td>
                                <td style="width: 450px;">${sVO.SName}</td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td>${sVO.SMobile }</td>
                            </tr>
                            <tr>
                                <td>가게주소</td>
                                <td>${sVO.SAddress} ${sVO.SExtraaddress}</td>
                            </tr>
                        </table>
                    </div>
                </c:if>
            </div>
            <a id=back class="back">돌아가기</a>&nbsp;&nbsp;&nbsp;
            <a id=delInformation class="back 01">회원탈퇴</a>
        </c:if><br>
<%--        <a id=back class="back">돌아가기</a>&nbsp;&nbsp;&nbsp;--%>
<%--        <a id=delInformation class="back 01" onclick=location.href='signUp/delInformation?SSe=${sVO.SSeqno}'>회원탈퇴</a>--%>
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
<%--                <address>--%>
<%--                    Cappyright ㉿--%>
<%--                    <a href="http://naver.com"><strong>NAVER.</strong>--%>
<%--                    </a>--%>
<%--                </address>--%>
            </div>
        </div>
    </div>
</footer>
</body>
<script>
    $(document)
        .on('click', '#back', function () {
            location.href = 'main';
        })
        //손님탈퇴
        .on('click', '#delInformationu', function () {
            answer = confirm("정말 탈퇴하시겠습니까??");
            if (answer) {
                $.ajax({
                    url:'signUp/delInformationu',
                    type:'get',
                    dataType:'json',
                    data:'',
                    success:function(data){

                        location.href = '/main';
                    }
                })

            }
        })
        //사장탈퇴
        .on('click', '#delInformation', function () {
            answer = confirm("정말 탈퇴하시겠습니까??");
            if (answer) {
                $.ajax({
                    url:'signUp/delInformation?SSe=${sVO.SSeqno}',
                    type:'get',
                    dataType:'json',
                    data:'',
                    success:function(data){
                        location.href = '/main';
                    }
                })
            }
        })
</script>

</html>