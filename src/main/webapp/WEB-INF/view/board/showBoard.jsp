<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<style>
	table td{
		border:1px solid blue;
	}
	#cmtList{
		text-align:center;
	}
	#content{
		width:600px;
		height:450px;
	}
</style>
<body>
<header>
	<div class="login">
		<a href="#">🛒</a>
		<c:if test="${userinfo == null}">
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
<table class="board">
<tr><td>제목:</td><td><input type=text id=title name=title readonly></td></tr>
<tr><td>작성자:</td><td><input type=text id=writer name=writer readonly></td></tr>
<tr><td>작성일자:</td><td><input type=text id=joindate name=joindate readonly></td></tr>
<tr><td style="vertical-align:top;">내용:</td><td><div id=content></div></td></tr>
</table>
<br>
<table>
	<tr><td><textarea name=dat id=dat rows=3 cols=76></textarea></td>
	<td><input type=button id=btnPut value='댓글달기' style="width:80px;height:50px"></td></tr>
</table>
<table border="1px solid" id="cmtList" style="width:675px;justify-content: space-between;">
</table>
<div id="PNdiv">
</div>
<br>
<input type=button id=btnExit value='목록으로 돌아가기'>
<input type=text id=uid hidden>
</section>
</body>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)
.ready(function(){
	selectBD();
	selCmt();
	console.log('${userid}');
})
.on('click','#btnPut',function(){
	if('${userid}'=="") {
		alert('로그인 한 유저만 사용가능합니다.')
	}else{
		$.ajax({
			type:'post',dataType:'json',
			url:'addDat',
			data:'seq='+${seq}+'&content='+$('#dat').val(),
			success:function(data){
				$('#dat').val('');
				selCmt();
			}
		})
	}
})
.on('click','#reply',function(){
	if($(this).closest('tr').next('tr').attr('style')=="display:none"){
		$('.replyWdw').attr('style',"display:none")
		$(this).closest('tr').next('tr').attr('style',"display:''")
		console.log($(this).closest('tr').next('tr').attr('style'))
	}
	else{
		$(this).closest('tr').next('tr').attr('style',"display:none")
		console.log($(this).closest('tr').next('tr').attr('style'))
	}
})
.on('click','#addRep',function(){
	console.log('pSeq='+$(this).closest('tr').find('td:eq(0)').text()
			+' ,deep='+$(this).closest('tr').find('td:eq(1)').text())
	console.log('content='+$(this).closest('tr').find('td:eq(2)').find('textarea').val())
	$.ajax({
		type:'post',dataType:'json',
		url:'addRep',
		data:'bSeq='+${seq}+'&content='+$(this).closest('tr').find('td:eq(2)').find('textarea').val()
		+'&pSeq='+$(this).closest('tr').find('td:eq(0)').text()
		+'&deep='+$(this).closest('tr').find('td:eq(1)').text(),
		success:function(data){
			console.log('리플 달기 성공(?)');
			$('#rep').text('');
			selCmt();
		}
	})
})
.on('click','#delCmt',function(){
	if($(this).closest('tr').find('td:eq(0)').text()=='${userid}'){
		$.ajax({
			type:'post',dataType:'json',
			url:'delCmt',
			data:'seq='+$(this).closest('table').attr('id')+'&bdseq='+${seq},
			success:function(data){
				selCmt();
			}
		})
	}
	else{
		alert('작성자만 지울 수 있습니다.');
		return false;
	}
})
.on('click','#btnExit',function(){
	console.log('clicked');
	document.location='/home';
})
function selectBD(){
	$.ajax({
		type:'post',dataType:'json',
		url:'selBD',
		data:'seq='+${seq},
		success:function(data){
			let brd = data[0];
			$('#title').val(brd['title']);
			$('#writer').val(brd['writer']);
			$('#joindate').val(brd['date']);
			$('#content').append(brd['content']);
			$('title').text(brd['title']);
			$('#PNdiv').append('<a id=prev href=show?seq='+brd['seq0']+'>'+brd['title0']+'</a><hr>'
					+'<a id=next href=show?seq='+brd['seq2']+'>'+brd['title2']+'</a>')
		}
	})
}
function selCmt(){
	$.ajax({
		type:'post',dataType:'json',
		url:'selCmt',
		//async:false,
		data:'seq='+${seq},
		success:function(data){
			$('#cmtList').empty();
			for(i=0;i<data.length;i++) {
				var cmt = data[i];
				$('#cmtList').append("<table id='"+cmt['seqCmt']+"' style='width:675px;'><tr>"
							+"<td style='width:100px;'>"+cmt['writer']
							+"</td><td style='width:350px;'>"+cmt['content']+"</td><td style='width:150px;'>"
							+cmt['date']+"</td><td><div class='dropdown'>"
							+"<a class='btn btn-secondary dropdown-toggle btn-sm' href='#' role='button'" 
							+"id='dropdownMenuLink' data-bs-toggle='dropdown' aria-expanded='false'>"
							+"&nbsp;&nbsp;&nbsp;메뉴&nbsp;&nbsp;&nbsp;</a>"
							+"<ul class='dropdown-menu dropdown-menu-dark' aria-labelledby='dropdownMenuLink'>"
						    +"<li><a class='dropdown-item' id='delCmt'>삭제</a></li>"
						    +"<li><a class='dropdown-item' id=reply>답글</a></li>"
						  	+"</ul></div></td></tr>"
						  	+"<tr style='display:none' class='replyWdw'><td hidden>"
							+cmt['seqCmt']+"</td><td hidden>"
							+cmt['deep']+"</td><td colspan=3><textarea cols=71></textarea></td>"
							+"<td><input type=button class='btn btn-sm' value='답글달기' id='addRep'></td>"
						  	+"</tr></table>");
				selReply(cmt['seqCmt']);
			}
		}
	})
}
//대댓글을 조회
function selReply(pSeq){
	$.ajax({
		type:'post',dataType:'json',
		url:'selRep',
		//async:false,
		data:'pSeq='+pSeq,
		success:function(data){
			for(i=0;i<data.length;i++) {
				var cmt = data[i];
				var adw = 100+(20*cmt['deep'])
				$('#'+pSeq).after("<table style='width:675px;' id='"+cmt['seqCmt']+"'><tr>"
						+"<td style='width:"+adw+"px;'>"+cmt['writer']
						+"</td><td style='width:350px;'>"+cmt['content']+"</td><td style='width:150px;'>"
						+cmt['date']+"</td><td><div class='dropdown'>"
						+"<a class='btn btn-secondary dropdown-toggle btn-sm' href='#' role='button'" 
						+"id='dropdownMenuLink' data-bs-toggle='dropdown' aria-expanded='false'>"
						+"&nbsp;&nbsp;&nbsp;메뉴&nbsp;&nbsp;&nbsp;</a>"
						+"<ul class='dropdown-menu dropdown-menu-dark' aria-labelledby='dropdownMenuLink'>"
					    +"<li><a class='dropdown-item' id='delCmt'>삭제</a></li>"
					    +"<li><a class='dropdown-item' id=reply>답글</a></li>"
					  	+"</ul></div></td></tr>"
					  	+"<tr style='display:none' class='replyWdw'><td hidden>"
						+cmt['seqCmt']+"</td><td hidden>"
						+cmt['deep']+"</td><td colspan=3><textarea cols=71></textarea></td>"
						+"<td><input type=button class='btn btn-sm' value='답글달기' id='addRep'></td>"
					  	+"</tr></table>");
				selReply(cmt['seqCmt'])
			}
		}
	})
}
</script>
</html>