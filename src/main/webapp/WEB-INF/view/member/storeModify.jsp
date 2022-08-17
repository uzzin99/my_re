<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
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
    <script src="https:/6/cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
    <!-- css -->
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="css/storeUp.css" rel="stylesheet" type="text/css" />
    <title>storeUp</title>
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
<!-- 가게 정보 수정하기 -->
<section>
    <div class="store-box" >
        <form action=storeMo method='POST' enctype="multipart/form-data">
            <div class ="name-box" align="center">
                <span><h3>가게 정보 수정</h3></span>
                <input type=hidden id=member_id name=member_id value="${userinfo}">
                <input type="hidden" id="s_seq" name="s_seq" value="${sVO.SSeqno}">
                <br>
            </div>
            <div class="insert-box">
                <p><span class="span">상호 명</span>
                   <input type=text id=storename name=storename value="${sVO.SName}" maxlength="20" placeholder="최대 20자"/></p>
                <p><span class="span">가게 주소</span>
                   <input type="text" id=postcode name=postcode placeholder="우편번호" style="width:80px" value="${sVO.SPostcode}">&nbsp;
                   <input type="button" id=btnAddress value="우편번호찾기"></p>
                <p><span class="span"></span>
                   <input type="text" id=address name=address placeholder="주소" value="${sVO.SAddress}" readonly></p>
                <p><span class="span"></span>
                   <input type="text" id=detailAddress name=detailAddress placeholder="상세주소" value="${sVO.SDetailaddress}">&nbsp;
                   <input type="text" id=extraAddress name=extraAddress placeholder="참고항목" value="${sVO.SExtraaddress}"readonly></p>

                <p><span class="span">사업자등록번호</span>
                   <input type=number id=storenum name="storenum" value="${sVO.bsNum}" maxlength="20"/></p>
                <p><span class="span">가게 전화번호</span>
                   <input type=number id=storetel name="storetel" value="${sVO.SMobile}" maxlength="15"/></p>
                <p><span class="span">메뉴타입</span>
                   <select id=menutype name="menutype">
                        <option value="${sVO.SType}" style="background:#FBF5BF;">${sVO.typeName}</option>
                        <c:forEach var="li" items="${list}">
                            <option value="${li.SType}">${li.typeName}</option>
                        </c:forEach>
                    </select></p>
                <p><span class="span">로고 등록 및 변경</span>
                   <input type=file id=s_img name="file"></p>
                <p><span class="span">적용중인 로고</span>
                   <input type="text" id="hidlogo" name="hidlogo" value="${sVO.SImg}" readonly></p>
            </div>
            <div class="submit-box">
                <input type=submit id=btnUp value="변경항목 저장">&nbsp;
                <input type="button" id="btnReturn" value="돌아가기" onclick="location.href='s_info'">
            </div>
        </form>
    </div>
</section>
<%--푸터--%>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document)
.ready(function(){
    $("input:file[name='file']").change(function () {
        var str = $(this).val();
        var fileName = str.split('\\').pop().toLowerCase();
        //alert(fileName);

        checkFileName(fileName);
    });
})

//가게 등록하기버튼
.on('click','#btnUp',function() {
    if ($('#storename').val() == '') {
        alert("상호명을 입력해주세요.");
        $('#storename').focus();
        return false;
    } else if ($('#address').val() == '') {
        alert("가게 주소를 입력해 주세요.");
        $('#address').focus();
        return false;
    } else if ($('#detailAddress').val() == ''){
        alert("가게 세부주소를 입력해 주세요.");
        $('#detailAddress').focus();
        return false;
    } else if ($('#storenum').val() == ''){
        alert("사업자등록번호를 입력해 주세요.");
        $('#storenum').focus();
        return false;
    } else if ($('#storetel').val() == ''){
        alert("가게 전화번호를 입력해 주세요.");
        $('#storetel').focus();
        return false;
    }else if($('#menutype option:selected').val()==0){
        alert("메뉴 타입을 선택하여 주세요.");
        return false;
    }else{
        if(confirm("변경 사항을 저장하시겠습니까?")){
            document.location='/signUp';
        }else{
            return false;
        }
    }
})

.on('click','#btnAddress',function(){
    roadMap();
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
//주소 찾기 API 함수
function roadMap(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                $('#extraAddress').val(extraAddr);

            } else {
                $('#extraAddress').val('');
            }

            $('#postcode').val(data.zonecode);
            $('#address').val(addr);

            $('#detailAddress').focus();
        }
    }).open();
}
</script>
</html>
