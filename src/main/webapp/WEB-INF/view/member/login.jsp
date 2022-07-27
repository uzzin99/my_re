<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
	<!-- css -->
	<link href="base.css" rel="stylesheet" type="text/css" />
	<link href="login.css" rel="stylesheet" type="text/css" />
	<title>base</title>
</head>

<body>
<div id="wrap" class="wrap mx-auto"></div>
<!-- 여기가 헤드 -->
<header>
	<div class="login">
		<c:if test="${userinfo == '' }">
			<p align=right><a href="#">🛒</a>&nbsp;<a onclick=location.href='login'>로그인</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
		</c:if>
		<!-- <c:if test="${userinfo != '' }">
        <c:if test="${userType == '손님' }">
          <p align=right><a href="#">🛒</a>&nbsp;<a onclick=location.href='signUp'>${userinfo} 님🍮</a> &nbsp;<a href='logout'>Logout</a></p>
        </c:if>
        <c:if test="${userType == '사장님' }">
          <p align=right><a href="#">🛒</a>&nbsp;<a onclick=location.href='signUp'>${userinfo} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>Logout</a></p>
        </c:if>
      </c:if> -->
	</div>
	<p align="center" onclick=location.href='main'><img class="logo" src="https://img.etnews.com/photonews/1711/1016498_20171123150540_893_0001.jpg"></p>
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
						<li><a class="dropdown-item" href="#">한식</a></li>
						<li><a class="dropdown-item" href="#">중식</a></li>
						<li><a class="dropdown-item" href="#">양식</a></li>
						<li><a class="dropdown-item" href="#">치킨</a></li>
						<li><a class="dropdown-item" href="#">피자</a></li>
						<li><a class="dropdown-item" href="#">분식</a></li>
						<li><a class="dropdown-item" href="#">디저트</a></li>
						<li><a class="dropdown-item" href="#">족발/보쌈</a></li>
						<li><a class="dropdown-item" href="#">고기/구이</a></li>
						<li><a class="dropdown-item" href="#">아시안</a></li>
						<li><a class="dropdown-item" href="#">패스트푸드</a></li>
					</ul>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
					   data-bs-toggle="dropdown" aria-expanded="false">
						홀예약
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">한식</a></li>
						<li><a class="dropdown-item" href="#">중식</a></li>
						<li><a class="dropdown-item" href="#">양식</a></li>
						<li><a class="dropdown-item" href="#">치킨</a></li>
						<li><a class="dropdown-item" href="#">피자</a></li>
						<li><a class="dropdown-item" href="#">분식</a></li>
						<li><a class="dropdown-item" href="#">디저트</a></li>
						<li><a class="dropdown-item" href="#">족발/보쌈</a></li>
						<li><a class="dropdown-item" href="#">고기/구이</a></li>
						<li><a class="dropdown-item" href="#">아시안</a></li>
						<li><a class="dropdown-item" href="#">패스트푸드</a></li>
					</ul>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
					   data-bs-toggle="dropdown" aria-expanded="false">
						게시판
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">사장님</a></li>
						<li><a class="dropdown-item" href="#">손님</a></li>
						<li><a class="dropdown-item" href="#">Q&A</a></li>
						<li><a class="dropdown-item" href="#">자주묻는질문</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<form class="d-flex" align="center">
			<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-dark" type="submit">Search</button>
		</form>
	</div>
</nav>

<section>
	<div align="center">
		<h4>아직 계정이 없으신가요?🙅‍♀️</h4><br>
		<p class="sign"><a href="signin">🎇가입하기🎇</a></p>
		<form id=frmLogin method=post action="user_check">
			<p>${ch }</p>
			<table align=center id=tblone>
				<tr>
					<td style="width: 80px;">아이디</td>
					<td>
						<input type=text name=id>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type=password name=pwd>
					</td>
				</tr>
			</table><br><br>
			<input class="login_button" type=submit value='로그인'><br><br>

		</form>
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
</html>