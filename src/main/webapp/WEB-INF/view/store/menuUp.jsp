<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메뉴 등록</title>
</head>
<style>
	* {
		font-family: 'GongGothicMedium';
	}
	@font-face {
		font-family: 'GongGothicMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}


	#container{
		margin: 50px 50px 0 50px;

	}
	#container input[type="text"], input[type="number"]{
		border: none;
		outline: none;
		height: 20px;
		font-size: 16px;

	}
	#container input[type="number"]{
		text-align: right;
	}

	#menuUp-box{
		background:skyblue;
		float:left;
		width:450px;
		height:600px;
		padding-left: 50px;
		outline:none;
	}


	#list-box{
		/* background:yellow; */
		float:left;
		width:500px;
		height:600px;
		padding-left: 50px;
	}

	#menu-box{
		/* background:pink; */
		overflow:scroll;
		width:500px;
		height:500px;
		/* margin:auto; */
		/* display: flex; */
		flex-direction: column;
		overflow-x: hidden;
	}
	/* 스크롤바 디자인 시작 */
	#menu-box::-webkit-scrollbar {
		width: 10px;
		background-color: #f1f1f1;
		border-radius: 10px;
	}
	#menu-box::-webkit-scrollbar-thumb {
		width: 10px;
		background-color: #39c0c0;
		border-radius: 10px;
	}
	/* 스크롤바 디자인 끝 */

	.a{
		width:400px;
		height:100px;
		display: block;
		padding: 10px 0 10px 30px;
		border-radius: 15px;
		background-color: #f1f1f1;
	}

	.a > img{
		padding: 0 10px 0 0;
	}
	.a > p{
		line-height: 0px;
		display: flex;
	}
</style>
<body>
<div id="container">
	<div id="menuUp-box">
		<!-- 메뉴 등록 & 수정 -->
		<form action="menu" method="post" enctype="multipart/form-data">
			<span><h3>메뉴 등록하기</h3></span>
			<input type=text id=s_seq name=sSeq value="${sVO.SSeqno}"> <!-- 가게시퀀스 -->
			<input type=text id="m_seq" name="mSeq" value="0">
			<p>메뉴이름</p><input type=text id=menuname name=menuname >
			<p>가격</p><input type=number id=menuprice name=menuprice min=0>원
			<p>칼로리</p><input type=number id=menukcal name=menukcal min=0>kcal
			<p>설명</p>
			<textarea id=menuex name=menuex maxlength=20 style="width:230px; height:40px; resize:none;" placeholder="최대 20자"></textarea>
			<p>메뉴이미지</p>
			<div id=img-box>
				<!-- <img id="view" art="image"> -->
				<input type=file id=m_img name=file>
				<input type="hidden" id="hdFName">
			</div>
			<br>
			<input type=submit id=btnIn value="추가">&nbsp;&nbsp;
			<input type=button id=btnReset value="비우기">&nbsp;&nbsp;
			<input type=button id=btnDelete value="삭제">
		</form>

		<!-- 이미지만 수정하기 -->
		<form action="img_mo" method="post" enctype="multipart/form-data">
			<input type=text id=s_seq2 name=sSeq2 value="${sVO.SSeqno}"> <!-- 가게시퀀스 -->
			<input type=text id="m_seq2" name="mSeq2" value="0">
			<input type=file id=img_mo name=file2 style="display:none;">&nbsp;&nbsp;
			<input type="hidden" id="title" name="title">
			<input type=submit id=btnMo value="사진 수정하기" style="display:none;">
		</form>
		<br>
		<input type=button id=btnReturn value="돌아가기" method='get' onclick="location.href='s_info'">
	</div>
	<!-- 등록된 메뉴리스트 불러오기 -->
	<div id="list-box">
		<span><h3>메뉴목록</h3></span>
		<input type=text id="s_seq3" name="sSeq3" value="${sVO.SSeqno}">
		<div id="menu-box">
<%--			<c:forEach var="mls" items="${mlist}">
				<div class="a">
					<img src='src/main/resources/static/upload/${mls.menuImg}' style='width:100px;height:100px;float:left;'>
					<p>메뉴이름: ${mls.menuName}</p>
					<p>가격: ${mls.menuPrice} 원</p>
					<p>칼로리: ${mls.menuCal} kcal</p>
					<p>설명: ${mls.menuEx}</p>
					<p><input type=button id=btnSel value=선택><input type=text id=mse value='${mls.menuSeqno}'></p>
				</div><br>
			</c:forEach>--%>
		</div><!-- 메뉴리스트 생성 -->
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)
.ready(function(){
	loadmenulist();
})


//비우기 버튼
.on('click','#btnReset',function(){
	$('#menuname').val('');
	$('#menuprice').val(0);
	$('#menukcal').val(0);
	$('#menuex').val('');
	$('#m_img').text('');
	$('#btnIn').val('추가');
	$('#m_seq').val(0);
	$('#m_seq2').val('');
	$('#btnMo').hide();
	$('#m_img').show();
	$('#img_mo').hide();
})


//수정 전 데이터 불러오기
.on('click','#btnSel',function(){
	$('#img_mo').show();
	$('#btnMo').show();
	$('#m_img').hide();
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
			/* const img=document.getElementById("view");
			img.src="/test/"+jo['m_img']; */
			/* if(jo['m_img']==null){
				const img=document.getElementById("view");
				img.src="";
			}else{
				const img=document.getElementById("view");
				img.src="/test/"+jo['m_img'];
			}*/
			console.log("이미지이름="+jo['m_img']);
		}
	})
})


//수정버튼 누르기
.on('click','#btnIn',function(){
	if($('#btnIn').val()=='수정'){
		if(!confirm("매뉴를 수정 하시겠습니까?")) return false;
	}else{
		if(!confirm("메뉴를 등록 하시겠습니까?")) return false;
	}
})


//이미지 수정버튼누르기
.on('click','#btnMo', function(){
	if(!confirm("이미지를 수정 하시겠습니까?")) return false;
	loadmenulist();
	console.log("m_seq2="+$('#m_seq2').val()+"/s_seq2="+$('#s_seq2').val());
})


//메뉴삭제하기
.on('click','#btnDelete',function(){
	//console.log("delete=>s_seq["+$('#s_seq').val()+"], m_seq["+$('#m_seq').val()+"]");
	let s_seq=$('#s_seq').val();
	let m_seq=$('#m_seq').val();
	let filename=$('#title').val();
	console.log("file name="+filename);

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
					/* str+="<tr><td rowspan=4><img src='/upload/"
						+jo['m_img']+"' style='width:100px;height:100px;'></td><td>메뉴이름</td><td>"+jo['m_name']
						+"</td><td>가격</td><td>"+jo['m_price']
						+"원</td><td rowspan=4><input type=button id=btnSel value=선택><input type=hidden id=mse value='"+jo['m_seq']
						+"'></td></tr><tr><td>칼로리</td><td colspan=3 align=left>"
						+jo['m_cal']+"kcal</td></tr><tr><td colspan=4 align=left>설명</td></tr><tr><td colspan=4>"
						+jo['m_ex']+"</td></tr>"; */
					console.log(jo['m_img']);
					str+="<div class=a>";
					str+="<img src='@{upload/"+jo['m_img']+"}' style='width:100px;height:100px;float:left;'>";
					str+="<p>메뉴이름: "+jo['mName']+"</p>";
					str+="<p>가격: "+jo['m_price']+" 원</p>";
					str+="<p>칼로리: "+jo['m_cal']+" kcal</p>";
					str+="<p>설명: "+jo['m_ex']+"</p>";
					str+="<p><input type=button id=btnSel value=선택><input type=text id=mse value='"+jo['mSeq']+"'></p></div><br>";
				}
				$('#menu-box').append(str);
			}
		}
	})
}
</script>
</html>