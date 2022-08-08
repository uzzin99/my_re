<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<link href="/css/base.css" rel="stylesheet" type="text/css" />
	<link href="/css/main.css" rel="stylesheet" type="text/css" />
	<title>게시판 목록</title>
</head>
<style>
	#boardFunction{
		margin: auto;
		width: 700px;
		height: 80px;
	}
	tr td:nth-child(3){
		width:280px;
		text-overflow: ellipsis;  /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
		white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
		overflow     : hidden;    /* 내용이 길면 감춤니다 */
	}
	#boardFunction input{
		height: 40px;
		float: right;
	}
	#btnSearch{
		margin-right: 55px;
		height: 40px;
	}
	#word{
		font-size: 16px;
		width: 300px;
		height: 36px;
	}
	#brdTable{
		margin-left:auto;
		margin-right:auto;
		width:700px;
	}
	#BoardMain{
		width:800px;
		margin:auto;
		text-align: center;
	}
	#divOB > a{
		font-size: x-small;
		color: #ababab;
	}
	#PageNav{
		height: 40px;
	}
</style>
<body>
<div id="wrap" class="wrap mx-auto"></div>
<!-- 여기가 헤드 -->
<header>
	<div class="login">
		<c:if test="${userid == null }">
			<p align=right><a href="/cart">🛒</a> <a onclick=location.href='login'>로그인</a>&nbsp;<a onclick=location.href='signin'>회원가입</a></p>
		</c:if>
		<c:if test="${userid != '' }">
			<c:if test="${userType == '손님' }">
				<p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${userid} 님🍮</a> &nbsp;<a href='logout'>로그아웃</a></p>
			</c:if>
			<c:if test="${userType == '사장님' }">
				<p align=right><a href="/cart">🛒</a> <a onclick=location.href='/signUp'>${userid} 님👩🏻‍🍳</a> &nbsp;<a href='logout'>로그아웃</a></p>
			</c:if>
		</c:if>
	</div>

	<p align="center" onclick=location.href='main'><img class="logo" src="https://img.etnews.com/photonews/1711/1016498_20171123150540_893_0001.jpg"></p>
</header>
<%HttpSession session = request.getSession();%>
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
<div id="BoardMain">
	<span class="todaymenu" style="float: left;font-size:xx-large;margin-bottom: 20px;">자유게시판</span>
	<table id="brdTable" class="table table-sm table-hover">
		<thead>
		<tr><th>작성시각</th><th>제목</th><th>작성자</th><th>조회수</th><th>
			<div id="divOB">
				<c:if test="${orderBy==2}">
					<a id="obtime" href="javascript:void(0);">시간순▲</a>/
					<a id="obview" href="javascript:void(0);">조회수순</a>
				</c:if>
				<c:if test="${orderBy==1}">
					<a id="obtime" href="javascript:void(0);">시간순▼</a>/
					<a id="obview" href="javascript:void(0);">조회수순</a>
				</c:if>
				<c:if test="${orderBy==4}">
					<a id="obtime" href="javascript:void(0);">시간순</a>/
					<a id="obview" href="javascript:void(0);">조회수순▲</a>
				</c:if>
				<c:if test="${orderBy==3}">
					<a id="obtime" href="javascript:void(0);">시간순</a>/
					<a id="obview" href="javascript:void(0);">조회수순▼</a>
				</c:if>
			</div>
		</th></tr>
		</thead>
		<tbody id="brdList" class="table-group-divider">
		</tbody>
	</table>
	<div id="boardFunction">
		<input type="button" class="btn btn-outline-dark" style="float: right;" onclick="location.href='/newpost'" value="새글쓰기">
		<input class="btn btn-outline-dark" type=button id="btnSearch" value="검색">
		<input type=text class="form-control me-2" placeholder="Search" name=word id=word>
	</div>
	<nav id="PageNav" aria-label="Page navigation example">
		<ul id="PageList" class="pagination justify-content-center align-self-center">
		</ul>
	</nav>
	<br>
		<br>
	<input type=number id="maxpage" value="${Maxpage}" hidden>
	<input type=number id="page" value="${crtpage}" hidden>
	<input type=number id="pageIdx" value=1 hidden>
</div>
	<br>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(document)
			.ready(function(){
				$('#page').val(${crtpage});
				//$('#pageIdx').val(Math.ceil((parseInt(${Maxpage})/12)/10));
				selectBrd();
			})
			.on('click','#obtime',function(){
				$.ajax({
					type:'post',dataType:'json',
					url:'obtime',
					data:'',
					success:function(){
						$('#divOB').load(window.location.href+' #divOB');
						console.log('orderBy=${orderBy}');
						selectBrd();
					}
				})
			})
			.on('click','#obview',function(){
				$.ajax({
					type:'post',dataType:'json',
					url:'obview',
					data:'',
					success:function(){
						$('#divOB').load(window.location.href+' #divOB');
						console.log('orderBy=${orderBy}');
						selectBrd();
					}
				})
			})
			.on('click','.page-link',function(){
				if($(this).text()=='Previous'){
					//Previous를 눌러서 페이지를 10씩 당겨보기
					if($('#pageIdx').val()==1){
						$('#pageIdx').val(1)
						$('#page').val(1)
					}else{
						$('#pageIdx').val($('#pageIdx').val()-1)
						$('#page').val((($('#pageIdx').val())*10))
					}
					console.log("페이지 인덱스 :"+$('#pageIdx').val());
					console.log("페이지 :"+$('#page').val());
//		1씩 감소
// 		if($('#page').val()==1){
// 			$('#page').val(1)
// 		}else{
// 			$('#page').val($('#page').val()-1)
// 		}
				}
				else if($(this).text()=='Next'){
					//next를 눌러서 페이지를 10씩 미뤄보기
					if($('#pageIdx').val()==Math.ceil(x/10)){
						$('#pageIdx').val(Math.ceil(x/10))
						$('#page').val(x)
					}else{
						$('#pageIdx').val(parseInt($('#pageIdx').val())+1)
						$('#page').val((($('#pageIdx').val()-1)*10)+1)
					}
					console.log("페이지 인덱스 :"+$('#pageIdx').val());
					console.log("페이지 :"+$('#page').val());
//		1씩 증가
// 		if($('#page').val()==$(this).closest('li').prev('li').find('a').text()){
// 			$('#page').val($(this).closest('li').prev('li').find('a').text())
// 		}else{
// 			$('#page').val(parseInt($('#page').val())+1)
// 		}
				}
				else{
					//번호를 눌렀을 경우
					$('#page').val($(this).text())
				}
				console.log($('#page').val());
				selectBrd();
			})
			.on('click','#title',function(){
				//제목을 눌러서 게시물 들어가서 조회
				$.ajax({
					type:'get',dataType:'json',
					url:'viewUp',
					data:'seq='+$(this).parent().parent().find('td:eq(0)').text(),
					success:function(){
					}
				})
			})
			.on('click','#delBD',function(){
				//삭제
				let writer=$(this).closest('tr').find('td:eq(3)').text().split(' ');
				console.log(writer[0]);
				if ('${userid}'==''){
					if(confirm('로그인한 유저만 이용가능합니다.\n로그인하시겠습니까?')){
						document.location='/login'
					}else {
						return false;
					}
				}
				else{
					if('${userid}'==writer[0]||'${userid}'=='admin'){
						if(!confirm('정말로 삭제하시겠습니까?')){
							return false;
						}
						document.location="delBD?seq="+$(this).closest('tr').find('td:eq(0)').text()
					}
					else{
						alert('작성자만 가능합니다.')
						return false;
					}
				}
			})
			//업데이트 경로로 이동
			.on('click','#upBD',function(){
				let writer=$(this).closest('tr').find('td:eq(3)').text().split(' ');
				if ('${userid}'==''){
					if(confirm('로그인한 유저만 이용가능합니다.\n로그인하시겠습니까?')){
						document.location='/login'
					}else {
						return false;
					}
				}
				else{
					if(writer[0]=='${userid}'){
						document.location="upBD?seq="+$(this).closest('tr').find('td:eq(0)').text()
					}
					else{
						alert('작성자만 가능합니다.')
						return false;
					}
				}
			})
			.on('click','#btnSearch',function(){
				$('#page').val(1);
				$('#pageIdx').val(1);
				searchBtnClicked();
				$('#btnPrv').next('li').find('a').trigger('click');
				$('#word').val('');
			})
	//board 테이블 을 조회해서 목록을 출력
	function selectBrd(){
		$.ajax({
			type:'post',dataType:'json',
			url:'selBrd',
			data:'page='+$('#page').val()+'&orderBy='+$("#orderBy option:selected").val(),
			success:function(data){
				$('#brdList').empty();
				for(i=0;i<data.length;i++) {
					let brd = data[i];
					let date = brd['date'].split(' ');
					$('#maxpage').val(brd['maxPage']);
					$('#brdList').append("<tr><td hidden>"+brd['seq']+"</td><td>"
							+date[0]+"</td><td><a href='/show?seq="+brd['seq']+"' id='title'>"+brd['title']+"</a></td><td>"
							+brd['writer']+"</td><td style='text-align:center;'>"+brd['views']+"</td><td>"
							+"<div class='dropdown'>"
							+"<a class='btn dropdown-toggle btn-sm' href='#' role='button'"
							+"id='dropdownMenuLink' data-bs-toggle='dropdown' aria-expanded='false'>"
							+"메뉴</a>"
							+"<ul class='dropdown-menu' aria-labelledby='dropdownMenuLink'>"
							+"<li><a class='dropdown-item' id='delBD'>삭제</a></li>"
							+"<li><a class='dropdown-item' id='upBD'>수정</a></li>"
							+"</ul></div></td></tr>");
				}
				selectPage();
			}
		})
	}
	//페이지가 얼마나 있는지가져와서 페이지의 수를 생성
	function selectPage(){
		console.log('maxPage='+$('#maxpage').val())
		//x=최대 게시글 수 / 보여줄 게시글의 수 = 페이지의 수
		x = Math.ceil($('#maxpage').val()/12);
		console.log("페이지의 수 = "+x);
		$('#PageList').empty()
		$('#PageList').append('<li id="btnPrv" class="page-item"><a class="page-link">Previous</a></li>'
				+'<li class="page-item"><a class="page-link">Next</a></li>')
		y=$('#pageIdx').val()*10;
		if(y>x){
			y=x;
		}
		console.log($('#maxpage').val()+'/12='+x)
		for(i=y;i>=1;i--){
			$('#btnPrv').after('<li class="page-item"><a class="page-link">'+i+'</a></li>')
			if(i==$('#page').val()){
				$('#btnPrv').next('li').attr('class','page-item active')
			}
			if(i==((($('#pageIdx').val()-1)*10)+1)){
				break;
			}
		}
	}
	function searchBtnClicked(){
		$.ajax({
		type:'post',dataType:'json',
		url:'searchBtnClicked',
		data:'word='+$('#word').val(),
		success:function(data) {
			selectBrd()
		}
	})
	}
	function ResettingWords(){
		$('#page').val(1);
		$('#btnSearch').trigger('click');
		$.ajax({
			type:'get',dataType:'json',
			url:'SearchWordReJstf',
			data:'',
			success:function(){
			}
		})
	}
</script>
</html>
