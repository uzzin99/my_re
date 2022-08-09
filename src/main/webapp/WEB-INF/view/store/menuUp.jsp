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
	<link href="css/menuUp.css" rel="stylesheet" type="text/css" />
	<title>menuUp</title>
</head>
<style>
	a:hover{
		cursor: pointer;
	}
	.logo:hover{
		cursor: pointer;
	}
</style>
<body>
<div id="wrap" class="wrap mx-auto"></div>
<!-- 여기가 헤드 -->
<header>
	<div class="login">
		<c:if test="${mname == null }">
			<p align=right><a href="/cart">🛒</a><a onclick=location.href='login'>로그인</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
		</c:if>
		<c:if test="${mname != '' }">
			<c:if test="${userType == '손님' }">
				<p align=right><a href="/cart">🛒</a><a onclick=location.href='signUp'>${mname} 님🍮</a> &nbsp;<a href='logout'>로그아웃</a></p>
			</c:if>
			<c:if test="${userType == '사장님' }">
				<p align=right><a href="/cart">🛒</a><a onclick=location.href='signUp'>${mname} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>로그아웃</a></p>
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
<!-- 메뉴 등록 & 수정 -->
<section>
	<div id="container">
		<div id="menuUp-box">
			<form action="menuAdd" method="post" enctype="multipart/form-data">
				<span><h3>메뉴 등록하기</h3></span>
				<br>
				<input type=hidden id=s_seq name=sSeq value="${sVO.SSeqno}"> <!-- 가게시퀀스 -->
				<input type=hidden id="m_seq" name="mSeq" value="0">
				<p><span class="span">메뉴이름</span>  <input type=text id=menuname name=menuname ></p>
				<p><span class="span">가격</span>  <input type=number id=menuprice name=menuprice min=0 placeholder="0"> 원</p>
				<p><span class="span">칼로리</span>  <input type=number id=menukcal name=menukcal min=0 placeholder="0"> kcal</p>
				<p><span class="span">설명</span>
				<textarea id=menuex name=menuex maxlength=20 placeholder="최대 20자"></textarea></p>

				<div class=filebox>
					<p><span class="span" id="menu_img">메뉴이미지</span>
						<input type=file id=m_img name=file></p>
				</div>
				<div class="btndiv">
				<input type=submit id=btnIn value="추가">&nbsp;&nbsp;
				<input type=button id=btnReset value="비우기">&nbsp;&nbsp;
				<input type=button id=btnDelete value="삭제">
				</div>
			</form>
			<br>

			<!-- 이미지만 수정하기 -->
			<div class="imgMo-box">
				<form action="img_mo" method="post" enctype="multipart/form-data">
					<p><span class="span" > 이미지 변경 전</span>
						<input type="text" id="title" name="title" readonly></p>
					<p><span class="span" id="menu_img2" >이미지 선택</span>
					<input type=hidden id=s_seq2 name=sSeq2 value="${sVO.SSeqno}"> <!-- 가게시퀀스 -->
					<input type=hidden id="m_seq2" name="mSeq2">
					<input type=file id=img_mo name=file2></p>

					<p style="width:300px" align="center"><input type=submit id=btnMo value="사진 수정하기"></p>
				</form>
			</div>
			<div class="back">
				<input type=button id=btnReturn value="돌아가기" method='get' onclick="location.href='s_info'">
			</div>
		</div>

		<!-- 등록된 메뉴리스트 불러오기 -->
		<div id="list-box">
			<span><h3>메뉴 목록</h3></span>
			<br>
			<input type=hidden id="s_seq3" name="sSeq3" value="${sVO.SSeqno}">
			<div id="menu-box"></div><!-- 메뉴리스트 생성 -->
		</div>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)
.ready(function(){
	loadmenulist();
	// $('#btnMo').hide();
	// $('#imgbtn2').hide();
	// $('#menu_img2').hide();
	// $('#hdFName').hide();
	$('.imgMo-box').hide();

})

//비우기 버튼
.on('click','#btnReset',function(){
	$('#menuname').val('');
	$('#menuprice').val('');
	$('#menukcal').val('');
	$('#menuex').val('');
	$('#m_img').val('');
	$('#img_mo').val('');
	$('#btnIn').val('추가');
	$('#m_seq').val(0);
	$('#m_seq2').val('');

	// $('#btnMo').hide();
	// $('#imgbtn2').hide();
	// $('#menu_img2').hide();
	$('.imgMo-box').hide();
	$('.filebox').show();

})

//수정 전 데이터 불러오기
.on('click','#btnSel',function(){
	// $('#btnMo').show();
	// $('#imgbtn2').show();
	// $('#menu_img2').show();
	$('.imgMo-box').show();
	$('.filebox').hide();
	//$('#img-box').append($('#img_mo').show(),$('#btnMo').show()); //폼태그 안에 넣으면 그에 해당하는 폼이 동작됨

	var m_seq=$(this).parent().find('input:eq(1)').val();
	var s_seq=$('#s_seq').val();
	$('#m_seq').val(m_seq);
	$('#m_seq2').val(m_seq);
	$.ajax({
		url:'update', type:'post', dataType:'json',
		data:{sSeq:s_seq, mSeq:m_seq},
		success: function(data){
			$('#btnIn').val('수정');
			let jo=data[0];
			$('#menuname').val(jo['mName']);
			$('#menuprice').val(jo['m_price']);
			$('#menukcal').val(jo['m_cal']);
			$('#menuex').val(jo['m_ex']);
			$('#title').val(jo['m_img']);
			//console.log("이미지이름="+jo['m_img']);
		}
	})
})

//추가&수정버튼 누르기
.on('click','#btnIn',function() {
	if($('#btnIn').val()=='수정'){
		if(!confirm("매뉴를 수정 하시겠습니까?")) return false;
	}else if($('#btnIn').val()=='추가'){
		if($('#menuname').val()==''){
			alert("메뉴 이름을 입력하세요.")
			$('#menuname').focus();
			return false;
		}else if($('#menuprice').val()==''){
			alert("메뉴 가격을 입력하세요.");
			$('#menuprice').focus();
			return false;
		}else {
			if (!confirm("메뉴를 등록 하시겠습니까?")) return false;
		}
	}
})

//이미지 수정버튼누르기
.on('click','#btnMo', function(){
	if(!confirm("이미지를 수정 하시겠습니까?")) return false;
	loadmenulist();
	//console.log("m_seq2="+$('#m_seq2').val()+"/s_seq2="+$('#s_seq2').val());
})

//메뉴삭제하기
.on('click','#btnDelete,#btnDelete2',function(){
	//console.log("delete=>s_seq["+$('#s_seq').val()+"], m_seq["+$('#m_seq').val()+"]");
	let s_seq=$('#s_seq').val();
	let m_seq=$('#m_seq').val();
	let filename=$('#title').val();
	//console.log("file name="+filename);

	if(!confirm("선택한 메뉴를 삭제하시겠습니까?")) return false;
	document.location="delete?mSe="+m_seq+"&sSe="+s_seq+"&deleteFile="+filename;
	loadmenulist();
	$('#btnReset').trigger('click');
})


//메뉴목록 리스트 보여주기
function loadmenulist(){
	let s_seq=$('#s_seq').val();
	$.ajax({
		url:'mls', type: 'post', dataType:'json', data:{sSeq:s_seq},
		success: function(data){
			$('#s_seq').val(s_seq);
			$('#s_seq3').val(s_seq);
			$('#table-box').empty();
			let str='';
			if(data.length==0){
				$('#menu-box').text("메뉴를 등록하세요");
			}else{
				for(let i=0;i<data.length;i++){
					let jo=data[i];
					//console.log(jo['m_img']);
					str+="<div class=a>";
					if(jo['m_img']==null){
						str+="<img src='static/upload/imgload.png' style='width:100px;height:100px;float:left;'>";
					}else{
						str+="<img src='static/upload/"+jo['m_img']+"' style='width:100px;height:100px;float:left;'>";
					}
					str+="<p>메뉴이름: "+jo['mName']+"</p>";
					str+="<p>가격: "+jo['m_price']+" 원</p>";
					if(jo['m_cal']==null){
						str+="<p>칼로리: - kcal</p>";
					}else{
						str+="<p>칼로리: "+jo['m_cal']+" kcal</p>";
					}
					if(jo['m_ex']==null){
						str+="<p>설명: </p>";
					}else{
						str+="<p>설명: "+jo['m_ex']+"</p>";
					}
					str+="<input type=button id=btnSel value=선택><input type=hidden id=mse value='"+jo['mSeq']+"'></div><br>";
				}
				$('#menu-box').append(str);
			}
		}
	})
}
</script>
</html>