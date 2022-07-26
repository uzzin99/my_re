<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<title>게시판 목록</title>
</head>
<body>
<div style="width:800px;margin:auto;">
<table align=center class="table table-sm table-hover" style="width:700px">
<thead>
	<tr><th>작성시각</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
</thead>
<tbody id="brdList" class="table-group-divider">
</tbody>

</table>
<input type=number id="page" value="${crtpage}" hidden>
<input type=number id="pageIdx" value=1 hidden>
<nav aria-label="Page navigation example">
  <ul id="PageList" class="pagination justify-content-center">
  </ul>
</nav>
	<a href='newpost'>새글쓰기</a> <a href='test2'>결제테스트로 이동</a>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
let x = Math.ceil(${page}/10);

$(document)
.ready(function(){
	$('#page').val(${crtpage});
	$('#pageIdx').val(Math.ceil(${crtpage}/10));
	selectBrd();
	selectPage();
})
.on('click','.page-link',function(){
	if($(this).text()=='Previous'){
		//Previous를 눌러서 페이지를 10씩 당겨보기
		if($('#pageIdx').val()==1){
 			$('#pageIdx').val(1)
 		}else{
 			$('#pageIdx').val($('#pageIdx').val()-1)
			$('#page').val((($('#pageIdx').val())*10))
 		}
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
		}else{
			$('#pageIdx').val(parseInt($('#pageIdx').val())+1)
			$('#page').val((($('#pageIdx').val()-1)*10)+1)
		}
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
	selectPage();
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
	if($(this).closest('tr').find('td:eq(3)').text()=='${userid}'){
		document.location="delBD?seq="+$(this).closest('tr').find('td:eq(0)').text()
		
	}
	else{
		alert('작성자만 가능합니다.')
		return false;
	}
})
//업데이트 경로로 이동
.on('click','#upBD',function(){
	if($(this).closest('tr').find('td:eq(3)').text()=='${userid}'){
		document.location="upBD?seq="+$(this).closest('tr').find('td:eq(0)').text()
	}
	else{
		alert('작성자만 가능합니다.')
		return false;
	}
})
//board 테이블 을 조회해서 목록을 출력
function selectBrd(){
	$.ajax({
		type:'post',dataType:'json',
		url:'selBrd',
		data:'page='+$('#page').val(),
		success:function(data){
			$('#brdList').empty();
			for(i=0;i<data.length;i++) {
				let brd = data[i];
				let date = brd['date'].split(' ');
				$('#brdList').append("<tr><td hidden>"+brd['seq']+"</td><td>"
						+date[0]+"</td><td><a href='/delivery/show?seq="+brd['seq']+"' id='title'>"+brd['title']+"</a></td><td>"
						+brd['writer']+"</td><td style='text-align:center;'>"+brd['views']+"</td><td>"
						+"<div class='dropdown'>"
						+"<a class='btn btn-info dropdown-toggle btn-sm' href='#' role='button'" 
						+"id='dropdownMenuLink' data-bs-toggle='dropdown' aria-expanded='false'>"
						+"메뉴</a>"
						+"<ul class='dropdown-menu' aria-labelledby='dropdownMenuLink'>"
					    +"<li><a class='dropdown-item' id='delBD'>삭제</a></li>"
					    +"<li><a class='dropdown-item' id='upBD'>수정</a></li>"
					  +"</ul></div></td></tr>");
			}
		}
	})
}
//페이지가 얼마나 있는지가져와서 페이지의 수를 생성
function selectPage(){
	$('#PageList').empty()
	$('#PageList').append('<li id="btnPrv" class="page-item"><a class="page-link">Previous</a></li>'
						+'<li class="page-item"><a class="page-link">Next</a></li>')
	var cnt=0;
	y=$('#pageIdx').val()*10;
	if(y>x){
		y=x;
	}
	console.log(x)
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

</script>
</html>
