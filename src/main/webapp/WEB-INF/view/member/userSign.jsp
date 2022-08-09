<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
	<script src="https:/6/cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<%--다음주소찾기 API--%>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
	<!-- css -->
	<link href="css/base.css" rel="stylesheet" type="text/css" />
	<link href="css/userSign.css" rel="stylesheet" type="text/css" />
	<title>userSign</title>
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
		<c:if test="${mname == null }">
			<p align=right><a href="/cart">🛒</a> <a onclick=location.href='login'>로그인</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
		</c:if>
		<c:if test="${mname != '' }">
			<c:if test="${userType == '손님' }">
				<p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${mname} 님🍮</a> &nbsp;<a href='logout'>로그아웃</a></p>
			</c:if>
			<c:if test="${userType == '사장님' }">
				<p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${mname} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>로그아웃</a></p>
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
<%--				<li class="nav-item">--%>
<%--					<a class="nav-link active" aria-current="page" href="#">Menu</a>--%>
<%--				</li>--%>

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
						<li><a class="dropdown-item" onclick="ResettingWords()" href="/home" >우리들의 이야기</a></li>
						<li><a class="dropdown-item" onclick="ResettingWords()" href="/QnA">Q&A</a></li>
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
		<h1>회원가입<span>🙆‍♀️</span></h1><br>
		<form id=frmAdduser method=post action="usersign">
			<c:if test="${type == '손님 회원가입'}">
				<input type="hidden" name=mType value="3">
			</c:if>
			<c:if test="${type == '사장님 회원가입'}">
				<input type="hidden" name=mType value="2">
			</c:if>
			<table class="section_table" align="center">
				<tr>
					<td style="width:200px;">id</td>
					<td>
						<input type="text" id=userid name=userid placeholder="id를 입력하세요">
						<input type=button id=idoverlap class="check" value='중복확인'>
						<p id=idError class=error></p>
						<input type=hidden id=check>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" id=userpwd name=userpwd maxlength=14 placeholder="비밀번호를 입력하세요">
						<p id=pwdError class=error></p>
					</td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td>
						<input type="password" id=userpwd2 maxlength=14 placeholder="비밀번호를 확인하세요">
						<p id=pwdError2 class=error></p>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" id=username name=username maxlength=15 placeholder="이름을 입력하세요">
						<p id=nameError class=error></p>
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" id=usermobile name=usermobile maxlength=11 placeholder="010부터 입력하세요">
						<p id=mobileError class=error></p>
					</td>
				</tr>
				<tr>
					<td>e-mail</td>
					<td>
						<input type="text" id=useremail name=useremail placeholder="이메일을 입력하세요">
						<p id=emailError class=error></p>
					</td>
				</tr>
				<tr>
					<td rowspan="3">주소</td>
					<td>
						<input type="text" id=postcode name=postcode placeholder="우편번호" style="width:80px">&nbsp;
						<input type="button" id=btnAddress  class="address" value="우편번호찾기">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id=address name=address placeholder="주소" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id=detailAddress name=detailAddress placeholder="상세주소">
						<input type="text" id=extraAddress name=extraAddress placeholder="참고항목" readonly>
						<p id=addressError class=error></p>
					</td>
				</tr>

			</table><br><br>
			<a href=signin><input type=button class="box 01" value='뒤로가기'></a>&nbsp;&nbsp;
			<input type=submit id=btnSign class="box" value='가입'>
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
<script>
	$(document)

			//mail 유효성검사
			.on('blur', '#useremail', function () {
				var mailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				var mailTest = mailRegex.test($('#useremail').val());
				if (!mailTest) {
					emailError.innerHTML = '메일주소를 확인해 주세요';
					$('#useremail').focus();
					return false;
				} else {
					emailError.innerHTML = '';
				}
			})

			//휴대폰번호 유효성검사
			.on('blur', '#usermobile', function () {
				if ($('#usermobile').val() == '' || $('#usermobile').val().length != 11 || isNaN($('#usermobile').val())) {
					mobileError.innerHTML = '휴대폰 번호를 정확히 입력해 주세요';
					$('#usermobile').focus();
					return false;
				} else {
					mobileError.innerHTML = '';
				}
			})

			//이름 유효성검사
			.on('blur', '#username', function () {
				var nameRegex = /^[가-힣]{2,15}$/;
				var nameTest = nameRegex.test($('#username').val());
				if (!nameTest) {
					nameError.innerHTML = '이름은 한글로만 작성해주세요';
					$('#username').focus();
					return false;
				} else {
					nameError.innerHTML = '';
				}
			})

			//비밀번호 대소문자,숫자 사용하여 5~14자 체크
			.on('blur', '#userpwd', function () {
				var pwdRegex = /^[a-zA-z0-9]{5,14}$/;
				var passWordTest = pwdRegex.test($('#userpwd').val());
				if (passWordTest) {
					pwdError.style.color = 'blue';
					pwdError.innerHTML = '조건에 맞는 비밀번호입니다';
				} else if (!passWordTest) {
					pwdError.style.color = 'red';
					pwdError.innerHTML = '비밀번호는 영문 대소문자와 숫자를 사용하여 5~14자로 작성해 주세요';
					$('#userpwd').focus();
					return false;
				}
			})

			//id 중복체크, 유효성 검사
			.on('click', '#idoverlap', function () {
				var idRegex = /^[a-zA-z0-9]{3,14}$/;
				var idTest = idRegex.test($('#userid').val());

				if (!idTest) {
					idError.innerHTML = 'ID는 영문 대소문자와 숫자를 사용하여 3~14자로 작성해 주세요';
					$('#userid').focus();
					return false;
				} else {
					$.ajax({
						url: 'idoverlap',
						data: { userid: $('#userid').val() },
						dataType: 'json',
						type: 'get',
						success: function (data) {
							if (data == 1) { //아이디가 중복일때
								idError.innerHTML = '이미 존재하는 ID입니다.';
								$('#check').val('');
								$('#userid').focus();
							} else { //중복이 아닐시
								idError.style.color = 'blue';
								idError.innerHTML = '사용가능한 ID입니다.';
								$('#check').val($('#userid').val());
								$('#userpwd').focus();
							}
						}
					})
					idError.style.color = 'red';
				}
			})

			//form 태그에 빈칸이 있을 경우 경고
			.on('click', '#btnSign', function () {
				$('#pwdError, #pwdError2, #nameError, #addressError, #mobileError,#emailError').text('');


				if ($('#check').val() != $('#userid').val()) {
					alert('ID 중복확인을 해주세요!!!');
					return false;
				} else if ($('#userpwd2').val() == '') {
					pwdError2.innerHTML = '비밀번호 확인을 입력해 주세요';
					$('#userpwd2').focus();
					return false;
				} else if ($('#username').val() == '') {
					nameError.innerHTML = '이름를 입력해 주세요';
					$('#username').focus();
					return false;
				} else if ($('#useremail').val() == '') {
					emailError.innerHTML = '이메일을 입력해 주세요';
					$('#useremail').focus();
					return false;
				} else if ($('#postcode,#address,#detailAddress').val() == '' || $('#postcode').val() == '' || $('#address').val() == '' || $('#detailAddress').val() == '') {
					addressError.innerHTML = '주소를 입력해 주세요';
					return false;
				} else if ($('#userpwd').val() != $('#userpwd2').val()) {
					pwdError2.innerHTML = '비밀번호가 동일하지 않습니다';
					$('#userpwd').focus();
					return false;
				}
				return true;
			})

			//우편번호, 우편번호찾기 눌럿을시 API 실행
			.on('click', '#btnAddress', function () {
				roadMap();
			})
			.on('click', '#postcode', function () {
				roadMap();
			})
			.on('keyup', '#postcode', function () {
				roadMap();
			})

	//주소 찾기 API 함수
	function roadMap() {
		new daum.Postcode({
			oncomplete: function (data) {
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
				if (data.userSelectedType === 'R') {
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
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