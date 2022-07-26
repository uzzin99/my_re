<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckPass</title>
</head>
<style>
.error{
    color:red;
    font-size: 12px;
}
</style>
<body>
<div id=pwdCheck style="display:block">
	<strong>비밀번호 확인</strong>
	<p>회원님의 소중한 정보 보호를 위해, 계정의 현재 비밀번호를 확인해 주세요.</p>
	<input type=text id=id value='${mdto.MEmail }' readonly><br>
	<input type=password id=pwd name=pwd placeholder='비밀번호'>
	<p class=error id=chError></p>
	<input type=button id=btnCheck value='확인' disabled>
</div>

<div id=pwdNew style="display:none">
	<strong>비밀번호 변경</strong>
	<h6>새로운 비밀번호를 입력해 주세요</h6>
	<p>-안전을 위해 자주 사용했거나 쉬운 비밀번호가 아닌 새 비밀번호를 등록하고 주기적으로 변경해 주세요.</p>
	<input type=password id=newpwd name=newpwd placeholder='비밀번호(5~14자리)'><br>
	<input type=password id=newpwd2 name=newpwd2 placeholder='비밀번호 재입력'>
	<p class=error id=upError></p>
	<input type=button id=btnUpdate value='확인' disabled>
</div>

</body>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)

//비밀번호 변경-대소문자,숫자 사용하여 5~14자 체크 후 update
.on('click','#btnUpdate',function(){
	var pwdRegex = /^[a-zA-z0-9]{5,14}$/;
	var passWordTest=pwdRegex.test($('#newpwd').val());
	if(!passWordTest){
		alert('비밀번호는 영문 대소문자와 숫자를 사용하여 5~14자로 입력할 수 있어요.');
		$('#newpwd').focus();
		return false;
	}else{
		$.ajax({
			url:'pwdNew',
			data:{pwd:$('#newpwd').val()},
			dataType:'json',
			type:'post',
			success:function(){
				location.href='/delivery/signUp';
			},
			error:function(){
				alert('변경 실패!');
			}
		})	
	}
})

//비밀번호 변경-비밀번호와 비밀번호확인이 동일할시 버튼 활성화
.on('input','#newpwd2',function(){
	if($('#newpwd').val() == $('#newpwd2').val()){
		$('#btnUpdate').attr("disabled",false);
	}else{
		$('#btnUpdate').attr("disabled",true);
	}
})

/* ------------------------------------------------------------------------------------------------------ */
//비밀번호 체크 후 div 열고 닫기
.on('click','#btnCheck',function(){
	$.ajax({
		url:'pwd_check',
		data:{pwd:$('#pwd').val()},
		dataType:'json',
		type:'post',
		success:function(data){
			if(data == 1){ //비밀번호가 맞을시
				pwdCheck.style.display='none';
				pwdNew.style.display='block';
			}else{ //비밀번호가 틀릴시
				pwdCheck.style.display='block';
				pwdNew.style.display='none';
				chError.innerHTML='입력하신 비밀번호가 올바르지 않습니다. 다시 확인해 주세요.';
			}
		}
	})
})

//비밀번호 체크-id&비밀번호 둘다 공백 아니고, 비밀번호가 5글자 이상이면 버튼 활성화
.on('input','#pwd',function(){
	if(($('#pwd').val() && $('#id').val()) != '' && $('#pwd').val().length >= 5){
		$('#btnCheck').attr("disabled",false);
	}else{
		$('#btnCheck').attr("disabled",true);
	}

})

</script>
</html>