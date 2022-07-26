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

    <title>Menu</title>
</head>
<!-- <style>
	* {
		font-family: 'GongGothicMedium';
	}
	/* 가게정보 */
	table {
		width: 100%;
		text-align: center;
		background-color: #ccc;
		border-radius: 15px;
	}
	td {
		width: 30%;
	}
	input {
		border:none;
		background: #gray;
		border-radius: 3px;
	}
	.sImg {
		width: 200px;
		height: 150px;
	}

	/* 탭 */
	.tab {
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}

	input[type="radio"] {
		display: none;
	}

	input[type="radio"]+label {
		display: inline-block;
		background: #ccc;
		color: #999;
		font-size: 15px;
		cursor: pointer;
		font-family: 'GongGothicMedium';
		border-radius: 3px;
		width: 100px;
		height: 30px;

	}

	input[type="radio"]:checked+label {
		background: #aaa;
		color: #000;
	}

	.conbox {
		width: 60%;
		height: 170px;
		display: none;
		border-radius: 15px;
		background-color: #999;
		margin-left: 20px;
		margin-top: 20px;
	}

	input[id="tab01"]:checked~.con1 {
		display: block;
	}

	input[id="tab02"]:checked~.con2 {
		display: block;
	}

	input[id="tab03"]:checked~.con3 {
		display: block;
	}

	/* 밑에 이미지 */
	.menuImg {
		width: 150px;
		height: 130px;
	}

	#a input:read-only {
		margin-top: 17px;
		margin-right: 5px;
		width: 60%;
		height: 30px;
	}

	#a img {
		float: left;
		margin-top: 17px;
		margin-left: 20px;
	}

	#b input {
		margin-top: 7px;
		margin-right: 5px;
		width: 15%;
	}

	#b img {
		float: right;
		margin-top: 17px;
		margin-right: 20px;
	}

	/* 폰트 */
	@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
</style> -->

<body>
<div id="wrap" class="wrap mx-auto"></div>
<!-- 여기가 헤드 -->
<header>
    <div class="login">
        <a href="#">🛒</a>
        <c:if test="${userinfo == '' }">
            <p align=right><a onclick=location.href='login'>Login</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
        </c:if>
        <c:if test="${userinfo != '' }">
            <c:if test="${userType == '손님' }">
                <p align=right><a onclick=location.href='signUp'>${userinfo} 님🍮</a> &nbsp;<a href='logout'>Logout</a></p>
            </c:if>
            <c:if test="${userType == '사장님' }">
                <p align=right><a onclick=location.href='signUp'>${userinfo} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>Logout</a></p>
            </c:if>
        </c:if>

        <!--  <input type="button" onclick=location.href='login'>Login
         <input type="button" onclick=location.href='signin'>Logout -->
    </div>


    <p align="center" onclick=location.href='/main'><img class="logo" src="https://img.etnews.com/photonews/1711/1016498_20171123150540_893_0001.jpg"></p>
</header>

<!-- 여기가 네비바 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Menu</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
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
    <table>
		<tr><br>
			<!-- <td>
				<img class="sImg" src="${i.menuImg }">
			</td> -->
			<td>
				<p><input type="text" value="${mlist[0].SName }"
					style="font-size:20px; text-align:center; background: linear-gradient(to top, #39c0c0 40%, transparent 50%);"></p>
				<p>⭐⭐⭐⭐⭐ 4.9</p>
				<p>최근리뷰 228 | 최근사장님댓글 0</p>
				<p>전화 | 찜 | 공유</p>
			</td>
			<!-- <td style="text-align: right;">
				<p><span>최소주문금액</span>&nbsp;<input type=text></p>
				<p><span>결제방법</span>&nbsp;<input type=text value="바로결제, 만나서결제"></p>
				<P><span>배달시간</span>&nbsp;<input type=text></P>
				<p><span>배달팁</span>&nbsp;<input type=text></p>
			</td> -->
		</tr>
	</table>

	<div class="tab"><br>
		<input type="radio" name="tabmenu" id="tab01"  checked>
		<label for="tab01">대표메뉴</label>
		<input type="radio" name="tabmenu" id="tab02">
		<label for="tab02">리뷰</label>
		<input type="radio" name="tabmenu" id="tab03">
		<label for="tab03">가게정보</label>

<%-- 		<div class="conbox con1">
				<c:forEach var="i" items="${mlist }">
				<div id="a" onclick="window.open('menuDetail?mSe=${i.menuSeqno }&sSe=${i.sSe }','메뉴상세페이지','width=600px,height=700px,scrollbars=yes,resizable=no')">
					<img class="menuImg" src="${i.menuImg }">
					<input readonly type="text" value="${i.menuName }">
					<input readonly type="text" value="${i.menuPrice }원">
					<input readonly type="text" value="${i.menuCal }kcal">
				</div>
			</c:forEach>
			</div> --%>
			
		<c:forEach var="i" items="${mlist }">
			<div class="conbox con1">
				<div id="a">
					<img class="menuImg" src="${i.menuImg }">
					<input readonly type="text" value="${i.menuName }">
					<input readonly type="text" value="${i.menuPrice }원">
					<input readonly type="text" value="${i.menuCal }kcal">
				</div>
			</div>
		</c:forEach>

<%-- 			<div class="conbox con2">
		<c:forEach var="i" items="${rlist }">
				<div id="b">
					<img class="menuImg" src="${i.menuImg }">
					<input readonly type="text" style="float: left; margin-left: 20px;" value="${i.mId }"><br>
					<input readonly type="text" style="float: right; margin-right: 25px;" value="${i.score }">
					<input readonly type="text" style="float: right;" value="${i.rDate }"><br>
					<input readonly type="textarea" value="${i.rContent }" style="width: 70%; height: 80px;">
				</div>
			</div>
		</c:forEach> --%>
		
		<c:forEach var="i" items="${rlist }">
			<div class="conbox con2">
				<div id="b">
					<img class="menuImg" src="${i.menuImg }">
					<input readonly type="text" style="float: left; margin-left: 20px;" value="${i.MId}"><br>
					<input readonly type="text" style="float: right; margin-right: 25px;" value="${i.score }">
					<input readonly type="text" style="float: right;" value="${i.RDate }"><br>
					<input readonly type="textarea" value="${i.RContent }" style="width: 70%; height: 80px;">
				</div>
			</div>
		</c:forEach>
		
		<div class="conbox con3">컨텐츠탭 내용03</div>
	</div>

	<div class="cart"><br>
		<div id="cart_header"><span>🛒장바구니🛒</span></div>

		<div id="cart_body">
			<div class="cart_body_menu">
				<input readonly type="text" value="${i.menuName }">
				
				<input type='button' style="width: 25px; float: right;" value='x'/>
				
				<input readonly type="text"  value="${i.menuPrice }원">
				
				<div style="float: right;">
					<input type='button' style="width: 20px; display: inline-block;" onclick='count("minus")' value='-'/>
					<input readonly type="text" style="width: 20px; display: inline-block;" value="13">
					<input type='button' style="width: 20px; display: inline-block;" onclick='count("plus")' value='+'/>
				</div>
			</div>
		</div>

		<div id="cart_footer">
			<span>총 주문금액</span><input readonly type="text"  value="${i.menuName }"><br>
			<span>배달팁</span><input readonly type="text"  value="${i.menuName }"><br>
			<span>결제예정금액</span><input readonly type="text"  value="${i.menuName }">
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
      
</script>
</html>


