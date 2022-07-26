<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글쓰기</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<style>
#title{
	border: 2px solid gray;
	border-radius:2rem;
	height:45px;
	padding:0 20px 0 20px;
	font-size:x-large;
	width:730px;
}
.btn{
	border: 2px solid gray;
	border-radius:2rem;
	height:45px;
	padding:0 20px 0 20px;
	font-size:x-large;
	width: 140px;
}

.btn:hover{
	background-color:black;
	color:white;
}
</style>
<body>
<form action="addBoard" method="post">
<table>
<tr><td><input type=text id=title name=title placeholder="제목을 입력하세요"></td></tr>
<tr><td><textarea id="summernote" name="editordata"></textarea></td></tr>
<tr><td>
<input type=submit value=작성완료 class='btn'>&nbsp;<input type=button value='취소' id=btnList class='btn'></td></tr>
</table>
</form>
</body>
<script>
$(document)
.ready(function(){
	$('#summernote').summernote({
		toolbar: [
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']]
		  ],
		height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정  
		
	});
})
.on('click','#btnList',function(){
	document.location='/delivery/home'
})
</script>
</html>