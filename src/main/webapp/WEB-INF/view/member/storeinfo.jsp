<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head profile="http://www.w3.org/2005/10/profile">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="http://example.com/myicon.png">
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
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="css/storeinfo.css" rel="stylesheet" type="text/css" />
    <title>가게정보수정하기</title>
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
        <c:if test="${mname == '' }">
            <p align=right><a href="#">🛒</a><a onclick=location.href='login'>로그인</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
        </c:if>
        <c:if test="${mname != '' }">
            <c:if test="${userType == '손님' }">
                <p align=right><a href="#">🛒</a><a onclick=location.href='signUp'>${mname} 님🍮</a> &nbsp;<a href='logout'>로그아웃</a></p>
            </c:if>
            <c:if test="${userType == '사장님' }">
                <p align=right><a href="#">🛒</a><a onclick=location.href='signUp'>${mname} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>로그아웃</a></p>
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
    <div align="center">
        <h2>내 가게 정보📌</h2><br>
<%--        <input type=hidden name="managername" value="${sVO.mId}">--%>
        <input type=hidden name="storeseq" value="${sVO.SSeqno}">
        <table>
            <tr>
                <td style="width:200px">상호명</td><td>${sVO.SName}</td>
            </tr>
            <tr>
                <td style="width:200px">가게 주소</td><td>(${sVO.SPostcode}) ${sVO.SAddress} ${sVO.SDetailaddress}, ${sVO.SExtraaddress}</td>
            </tr>
            <tr>
                <td style="width:200px">사업자등록번호</td><td>${sVO.bsNum}</td>
            </tr>
            <tr>
                <td style="width:200px">전화번호</td><td>${sVO.SMobile}</td>
            </tr>
            <tr>
                <td style="width:200px">타입</td><td>${sVO.typeName}</td>
            </tr>
            <tr>
                <td style="width:200px">가게로고이미지</td>
                <c:if test="${sVO.SImg!=null}">
                    <td>
                        <img src="/img/${sVO.SImg}" style="width:200px;height:180px;">
                    </td>
                </c:if>
                <c:if test="${sVO.SImg==null}"><%--가게 로고 등록하기--%>
                    <form action="sImg_mo" method="POST" enctype="multipart/form-data">
                        <td>
                            <input type="file" id="sfile" name="sfile">&nbsp;&nbsp;
                            <input type="submit" id="storeimg" name="storeimg" value="로고등록">
                            <input type="hidden" id="s_seq" name="s_seq" value="${sVO.SSeqno}">
                        </td>
                    </form>
                </c:if>
            </tr>
        </table><br>
        <input type=button id="btnStoreMo" value="가게정보 수정하기" method="get" onclick="location.href='s_list'">
        <input type=button id=btn_s value="메뉴 등록 및 수정하기" method='get' onclick="location.href='m_up'">
        <br>
        <span id="spanReturn"><a id=btnReturn method='get' onclick="location.href='signUp'">돌아가기</a></span>
    </div>
</section>
<%--footer--%>
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
        .ready(function(){
            $("input:file[name='sfile']").change(function () {
                var str = $(this).val();
                var fileName = str.split('\\').pop().toLowerCase();
                //alert(fileName);

                checkFileName(fileName);
            });
        })
function checkFileName(str){

    //1. 확장자 체크
    var ext =  str.split('.').pop().toLowerCase();
    if($.inArray(ext, ['bmp' , 'hwp', 'jpg', 'pdf', 'png', 'xls', 'zip', 'pptx', 'xlsx', 'jpeg', 'doc', 'gif', 'jfif']) == -1) {

    //alert(ext);
    alert(ext+'파일은 업로드 하실 수 없습니다.');
    }

    //2. 파일명에 특수문자 체크
    var pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
    if(pattern.test(str) ){
    //alert("파일명에 허용된 특수문자는 '-', '_', '(', ')', '[', ']', '.' 입니다.");
    alert('파일명에 특수문자를 제거해주세요.');
    }
}
</script>
</html>