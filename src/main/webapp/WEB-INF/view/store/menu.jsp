<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <!-- Slick 불러오기 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
    <!-- css -->
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="/css/menuSt.css" rel="stylesheet" type="text/css" />

    <title>Menu</title>
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
    <table>
		<tr><br>
			<!-- <td>
				<img class="sImg" src="${i.menuImg }">
			</td> -->
			<td>
                <input type="hidden" id=mid name="mid" value="${userinfo}">
                <input type="hidden" id=sSe name="sSe" value="${storename.SSeqno}">

				<p><input type="text" readonly value="${storename.SName }"
					style="font-size:20px; text-align:center; background: linear-gradient(to top, #39c0c0 40%, transparent 50%);"></p>
				<p>⭐⭐⭐⭐⭐ 4.9</p>
				<p>최근리뷰 228 | 최근사장님댓글 0</p>
<%--				<p>${storename.SMobile } |--%>
<%--                    <label for="choice" id="jjim"></label>--%>
<%--                    <input type="checkbox" id="choice" name="choice"> 찜 | 공유</p>--%>
                <p>전화번호 ${storename.SMobile } |
                    <c:if test="${userinfo == null}">
                        찜하기
                    </c:if>
                    <c:if test="${userinfo != null}">
                        <c:if test="${count==0}">
                            <label for="btnchoice" id="choice"><input type="button" id="btnchoice" name="choice">🤍찜</label>
                        </c:if>
                        <c:if test="${count==1}">
                            <label for="btnchoice" id="choice"><input type="button" id="btnchoice" name="choice">❤찜</label>
                        </c:if>
                    </c:if>
                    | 공유</p>
			</td>
		</tr>
	</table>

	<div class="tab"><br>
		<input type="radio" name="tabmenu" id="tab01"  checked>
		<label for="tab01">대표메뉴</label>
		<input type="radio" name="tabmenu" id="tab02">
		<label for="tab02">리뷰</label>
		<input type="radio" name="tabmenu" id="tab03">
		<label for="tab03">가게정보</label>

		<c:forEach var="i" items="${mlist }">
			<div class="conbox con1" onclick=openPop(${i.menuSeqno},${i.SSe})>
				<div id="a">
                    <c:if test="${i.menuImg!=null}">
					<img class="menuImg" src="/image/${i.menuImg }">
                    </c:if>
                    <c:if test="${i.menuImg==null}">
                        <img class="menuImg" src="/image/imgload.png">
                    </c:if>
					<input readonly type="text" value="${i.menuName }">
					<input readonly type="text" value="${i.menuPrice }원">
					<input readonly type="text" value="${i.menuCal }kcal">
				</div>
			</div>
		</c:forEach>

		<c:forEach var="i" items="${rlist }">
			<div class="conbox con2">
				<div id="b">
<%--					<img class="menuImg" src="/image/${i.menuImg }">--%>
					<input readonly type="text" style="float: left; margin-left: 20px;" value="${i.MId}">
					<input readonly type="text" style="float: left; margin-left: 21px;" class="score ${i.score }"><br>
<%--                    <small class="score ${i.score}"></small>--%>
                    <div id="mySt">
                        <input type="radio" name="rating" value="10" id="rate1" onclick="return(false);"><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="8" id="rate2" onclick="return(false);"><label for="rate2">⭐</label>
                        <input type="radio" name="rating" value="6" id="rate3" onclick="return(false);"><label for="rate3">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate4" onclick="return(false);"><label for="rate4">⭐</label>
                        <input type="radio" name="rating" value="2" id="rate5" onclick="return(false);"><label for="rate5">⭐</label>  <!-- 젤 왼쪽 별 -->
                    </div>
					<input readonly type="text" style="float: right; margin-right: 10px; width: auto; color: #333333" value="${i.RDate }"><br>
					<textarea readonly style="width: 70%; height: 100px;"><c:out value="${i.RContent }" /></textarea>
				</div>
			</div>
		</c:forEach>
		
		<div class="conbox con3">컨텐츠탭 내용03</div>

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
    <%--.ready(function (){--%>
    <%--    document.querySelector("#mySt input[value='${rlist.score}']").setAttribute('checked' , true);--%>
    <%--})--%>
// 별점임 지우지마셈
// $(".2").html("💛 🤍 🤍 🤍 🤍");
// $(".4").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
// $(".6").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
// $(".8").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
// $(".10").html("&#9733; &#9733; &#9733; &#9733; &#9733;");

.on('click','#choice',function(){
    let mid=$('#mid').val();
    let sSe=$('#sSe').val();
    console.log("mid="+mid+"sSe="+sSe);
    if(true){
        console.log("check on");
        $.ajax({
            url:"/z_Check", type:"get",
            data:{mid:mid, sSe:sSe},
            dataType:'text',
            success: function(){
                location.reload();
            }
        })
    }else{
        console.log("check off");
        $.ajax({
            url:"/z_Delete", type:"get",
            data:{mid:mid, sSe:sSe},
            dataType:'text',
            success: function(){
                location.reload();
            }
        })
    }


})

function openPop(mse,sse){
   window.open('/store/menuDetail?mSe='+mse+'&sSe='+sse,'menuDetail','width=600px,height=700px,scrollbars=yes,resizable=no');
}
</script>
</html>


