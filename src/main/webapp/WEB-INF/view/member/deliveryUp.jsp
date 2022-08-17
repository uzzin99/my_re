<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
	<link href="/css/base.css" rel="stylesheet" type="text/css" />
	<link href="/css/deliveryUp.css" rel="stylesheet" type="text/css" />
	<title>DeliveryUp</title>
</head>
<style>
	a:hover {
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
			<c:if test="${userType == '손님' }">
				<p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${mname} 님🍮</a> &nbsp;<a href='logout'>로그아웃</a></p>
			</c:if>
			<c:if test="${userType == '사장님' }">
				<p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${mname} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>로그아웃</a></p>
			</c:if>
			<c:if test="${userType == 'admin'}">
				<p align=right><a onclick=location.href='/main'>관리자님</a> &nbsp;<a href='/logout'>로그아웃</a></p>
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
<%--				<li class="nav-item">--%>
<%--					<a class="nav-link active" aria-current="page" href="#">Menu</a>--%>
<%--				</li>--%>

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

		<form class="d-flex" name="formsearch" method="post" action="/search/store" encType="UTF-8" align="center">
			<input class="form-control me-2" name="word" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-dark" type="submit">Search</button>
		</form>
	</div>
</nav>

<section>
	<div align="center">
		<h2>배송지 목록📃</h2><br>
		<input type=button id=btnAdd value='배송지 등록' onclick="openPop()">
		<div><br>
			<table id=tblDelivery>
				<tr><td><span>배송지</span></td><td><span>주소</span></th><td><span>연락처</span></td><td><span>수정/삭제</span></td></tr>
				<c:forEach var="m" items="${list }">
					<tr>
						<td>${m.DName }</td><td>${m.MAddress }, ${m.MDetailAddress }</td><td>${m.DMobile }</td>
						<td><input type=button id=btnUp value='수정' onclick="window.open('dvListup?se=${m.DSeqno}','수정','width=600px,height=700px,scrollbars=yes,resizable=no')">
							<a href="delSe?se=${m.DSeqno }"><input type=button id=btnDel value='삭제'></a>
						</td>
					</tr>
				</c:forEach>
			</table>
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
<%--				<address>--%>
<%--					Cappyright ㉿--%>
<%--					<a href="http://naver.com"><strong>NAVER.</strong>--%>
<%--					</a>--%>
<%--				</address>--%>
			</div>
		</div>
	</div>
</footer>
</body>
<script>
	$(document)
	//추가 팝업창 열기
	function openPop(){
		popup = window.open('dvList','등록','width=600px,height=700px,scrollbars=yes,resizable=no');
	}
</script>
</html>