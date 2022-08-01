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
	<link href="css/base.css" rel="stylesheet" type="text/css" />
</head>
<style>
	section{
		width: 100%;
		height: 100%;
	}
	date{
		font-size: smaller;
	}
	#cmtdiv,#btnBack{
		width:800px;
		margin-left:auto;
		margin-right:auto;
	}
	#cmtdiv > table{
		border: #333333 1px solid;
	}
	#board > *, #cmtdiv > table{
		width:800px;
		margin-left:auto;
		margin-right:auto;
	}
	#boardInfo{
		height: 100px;
		background: #cccccc;
		border-top: #333333 solid 5px;
		border-bottom: #333333 solid 1px;
	}
	#boardContent{
		height:450px;
	}
	#TWD{
		margin: 20px 20px 40px 40px;
	}
	#TWD b{
		font-size: larger;
	}
	#conPadding{
		margin: 20px 20px 40px 40px;
	}
	textarea{
		width: 100%;
		height: 100%;
		border: none;
		resize: none;
	}
	textarea::placeholder{
		color: #999999;
	}
	#repbox , #datbox{
		padding: 10px 10px 10px 10px;
	}
	#PNdiv{
		width: 800px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
<body>
<div id="wrap" class="wrap mx-auto"></div>
<!-- 여기가 헤드 -->
<header>
	<p align="center" onclick=location.href='main'><img class="logo" src="https://img.etnews.com/photonews/1711/1016498_20171123150540_893_0001.jpg"></p>
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
						<li><a class="dropdown-item" href="QnA">Q&A</a></li>
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
	<div id="board">
		<div id="boardInfo">

		</div>
		<div id="boardContent">

		</div>
	</div>

	<%--<table class="board">--%>
	<%--<tr><td>제목:</td><td><input type=text id=title name=title readonly></td></tr>--%>
	<%--<tr><td>작성자:</td><td><input type=text id=writer name=writer readonly></td></tr>--%>
	<%--<tr><td>작성일자:</td><td><input type=text id=joindate name=joindate readonly></td></tr>--%>
	<%--<tr><td style="vertical-align:top;">내용:</td><td><div id=content></div></td></tr>--%>
	<%--</table>--%>
	<br>
	<div id="cmtdiv">
	</div>

	<div id="PNdiv">
	</div>
	<br>
	<div id="btnBack">
	</div>
	<br>
	<input type=text id=uid hidden>
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
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	let RoU = 1;
	$(document)
			.ready(function(){
				selectBD();
				console.log('${userid}');
			})
			.on('click','#btnPut',function(){
				if ('${userid}'==''){
					if(confirm('로그인한 유저만 이용가능합니다.\n로그인하시겠습니까?')){
						document.location='/login'
					}else {
						return false;
					}
				}
				else{
					if($('#dat').val()==""){
						alert('댓글 내용이 필요합니다.')
					}
					else{
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
				}
			})
			.on('click','#reply',function(){
				console.log('clicked')
				RoU=1;
				$(this).closest('div').next('div').find('#addRep').val('답글달기')
				//$('#addRep').val('답글달기');
				if($(this).closest('div').next('div').css('display')=="none"){
					console.log('in1')
					$('.replyWdw').css('display',"none")
					$(this).closest('div').next('div').css('display',"block")
				}
				else{
					console.log('in2')
					$(this).closest('div').next('div').css('display',"none")
				}
			})
			.on('click','#addRep',function(){
				console.log('pSeq='+$(this).attr('name')
						+' ,deep='+$(this).next('input').val())
				console.log('content='+$(this).prev('textarea').val())
				if ('${userid}'==''){
					if(confirm('로그인한 유저만 이용가능합니다.\n로그인하시겠습니까?')){
						document.location='/login'
					}else {
						return false;
					}
				}
				else{
					if($(this).prev('textarea').val()==""){
						alert('내용이 필요합니다.')
						return false;
					}
					else{
						if(RoU==1){
							$.ajax({
								type:'post',dataType:'json',
								url:'addRep',
								data:'bSeq='+${seq}+'&content='+$(this).prev('textarea').val()
										+'&pSeq='+$(this).attr('name')
										+'&deep='+$(this).next('input').val(),
								success:function(data){
									console.log('리플 달기 성공(?)');
									$('#rep').text('');
									selCmt();
								}
							})
						}
						else if(RoU==2){
							$.ajax({
								type:'post',dataType:'json',
								url:'upCmt',
								data:'seq='+$(this).closest('div').parent().attr('id')+'&content='+$(this).prev('textarea').val(),
								success:function(data){
									console.log('댓글 수정 성공(?)');
									$('#rep').text('');
									selCmt();
								}
							})
						}
					}
				}
			})
			.on('click','#delCmt',function(){
				console.log('seq='+$(this).closest('div').parent().attr('id'));
				let writer = $(this).closest('div').find('b').text().split(' ')
				console.log('writer='+writer[0]);
				if ('${userid}'==''){
					if(confirm('로그인한 유저만 이용가능합니다.\n로그인하시겠습니까?')){
						document.location='/login'
					}else {
						return false;
					}
				}
				else{
					if(writer[0]=='${userid}'){
						$.ajax({
							type:'post',dataType:'json',
							url:'delCmt',
							data:'seq='+$(this).closest('div').parent().attr('id')+'&bdseq='+${seq},
							success:function(data){
								selCmt();
							}
						})
					}
					else{
						alert('작성자만 지울 수 있습니다.');
						return false;
					}
				}
			})
			.on('click','#upCmt',function(){
				RoU=2;
				let writer = $(this).closest('div').find('b').text().split(' ')
				if ('${userid}'==''){
					if(confirm('로그인한 유저만 이용가능합니다.\n로그인하시겠습니까?')){
						document.location='/login'
					}else {
						return false;
					}
				}
				else{
					if (writer[0]=='${userid}'){
						$(this).closest('div').next('div').find('#addRep').val('수정하기')
						//$('#addRep').val('수정하기');
						if($(this).closest('div').next('div').css('display')=="none"){
							console.log('in1')
							$('.replyWdw').css('display',"none")
							$(this).closest('div').next('div').css('display',"block")
						}
						else{
							console.log('in2')
							$(this).closest('div').next('div').css('display',"none")
						}
					}
					else{
						alert('작성자만 가능한 기능입니다.');
						return false;
					}
				}
			})
	function selectBD(){
		$.ajax({
			type:'post',dataType:'json',
			url:'selBD',
			data:'seq='+${seq},
			success:function(data){
				let brd = data[0];
				$('#boardInfo').append('<div id="TWD"><b>'+brd['title']+'</b><br>'+brd['writer']+'&nbsp;|&nbsp;<date>'+brd['date']+'</date></div>');
				$('#boardContent').append('<div id=conPadding>'+brd['content']+'</div>');
				// $('#title').val(brd['title']);
				// $('#writer').val(brd['writer']);
				// $('#joindate').val(brd['date']);
				// $('#content').append(brd['content']);
				$('title').text(brd['title']);
				console.log(brd['type']);
				$('#PNdiv').append('<a id=prev href=show?seq='+brd['seq0']+'>다음글: '+brd['title0']+'</a><hr>'
						+'<a id=next href=show?seq='+brd['seq2']+'>이전글: '+brd['title2']+'</a>')
				//일반 게시글 구성: 댓글, 게시글목록으로 귀환
				if(brd['type']==1){
					$('#cmtdiv').append('<table><tr><td id="datbox"><textarea name=dat id=dat'
						+' placeholder="댓글을 입력해 주세요"></textarea></td>'
						+'<td style="width:90px;height:60px"><input type=button id=btnPut value="댓글달기" class="btn btn-sm"'
						+' style="width:80px;height:50px" ></td></tr></table>'
						+'<table border="1px solid" id="cmtList" style="width:800px;justify-content: space-between;">'
						+'</table><br>')
					$('#btnBack').append('<input type=button value="목록으로 돌아가기" class="btn" onclick=location.href="home">')
				}
				//QnA 구성: 댓글, QnA목록으로 귀환
				else if(brd['type']==2){
					$('#cmtdiv').append('<table><tr><td id="datbox"><textarea name=dat id=dat'
							+' placeholder="댓글을 입력해 주세요"></textarea></td>'
							+'<td style="width:90px;height:60px"><input type=button id=btnPut value="댓글달기" class="btn btn-sm"'
							+' style="width:80px;height:50px" ></td></tr></table>'
							+'<table border="1px solid" id="cmtList" style="width:800px;justify-content: space-between;">'
							+'</table><br>')
					$('#btnBack').append('<input type=button value="목록으로 돌아가기" class="btn" onclick=location.href="QnA">')
				}
				//자주묻는 질문: 구성 no 댓글, QnA목록으로 귀환
				else{
					$('#btnBack').append('<input type=button value="목록으로 돌아가기" class="btn" onclick=location.href="QnA">')
				}
				selCmt();
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
					// $('#cmtList').append("<table id='"+cmt['seqCmt']+"' style='width:798px;'><tr>"
					// 		+"<td style='width:100px;'>"+cmt['writer']
					// 		+"</td><td>"+cmt['content']+"</td><td style='width:150px;'>"
					// 		+cmt['date']+"</td><td style='width: 89px;'><div style='width: 89px;' class='dropdown'>"
					// 		+"<a class='btn btn-secondary dropdown-toggle btn-sm' href='#' role='button'"
					// 		+"id='dropdownMenuLink' data-bs-toggle='dropdown' aria-expanded='false'>"
					// 		+"&nbsp;&nbsp;&nbsp;메뉴&nbsp;&nbsp;&nbsp;</a>"
					// 		+"<ul class='dropdown-menu dropdown-menu-dark' aria-labelledby='dropdownMenuLink'>"
					// 		+"<li><a class='dropdown-item' id='delCmt'>삭제</a></li>"
					// 		+"<li><a class='dropdown-item' id=reply>답글</a></li>"
					// 		+"</ul></div></td></tr>"
					// 		+"<tr style='display:none' class='replyWdw'><td hidden>"
					// 		+cmt['seqCmt']+"</td><td hidden>"
					// 		+cmt['deep']+"</td><td id='repbox' colspan=3><textarea placeholder='답글을 입력해 주세요'></textarea></td>"
					// 		+"<td><input type=button class='btn btn-sm' style='width:80px;height:50px;' value='답글달기'  id='addRep'></td>"
					// 		+"</tr></table>");
					$('#cmtList').append('<div id='+cmt['seqCmt']+'><div style="float: right;width: 800px;border: 1px solid black;'
							+'padding-left: 10px;padding-right: 10px;">'
							+'<b style="font-size: larger">'+cmt['writer']+'</b>'
							+'<a style="float: right;font-size: smaller">'+cmt['date']+'</a><br>'
							+cmt['content']+'<br>'
							+'<span style="float: right"><a id="upCmt">수정</a>*<a id="delCmt">삭제</a>*<a id=reply>댓글달기</a></span></div>'
							+'<div id="repbox" class=replyWdw style="float: right;width: 800px;border: 1px solid black;display: none">'
							+'<textarea placeholder="답글을 입력해 주세요"style="height: 80px"></textarea>'
							+'<input type=button class="btn btn-sm" style="width:80px;'
							+'height:50px;float: right" value="답글달기" name='+cmt['seqCmt']+' id="addRep">'
							+'<input type="hidden" value="'+cmt['deep']+'"></div></div>')
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
					var adw = 800-(20*cmt['deep'])
					$('#'+pSeq).after('<div id='+cmt['seqCmt']+'><div style="float: right;width: '+adw+'px;border: 1px solid black;'
							+'padding-left: 10px;padding-right: 10px;">'
							+'<b style="font-size: larger">'+cmt['writer']+'</b>'
							+'<a style="float: right;font-size: smaller">'+cmt['date']+'</a><br>'
							+cmt['content']+'<br>'
							+'<span style="float: right"><a id="upCmt">수정</a>*<a id="delCmt">삭제</a>*<a id=reply>댓글달기</a></span></div>'
							+'<div id="repbox" class=replyWdw style="float: right;width: '+adw+'px;border: 1px solid black;display: none">'
							+'<textarea placeholder="답글을 입력해 주세요"style="height: 80px"></textarea>'
							+'<input type=button class="btn btn-sm" style="width:80px;'
							+'height:50px;float: right" value="답글달기" name='+cmt['seqCmt']+' id="addRep">'
							+'<input type="hidden" value="'+cmt['deep']+'"></div></div>')
					selReply(cmt['seqCmt'])
				}
			}
		})
	}
</script>
</html>