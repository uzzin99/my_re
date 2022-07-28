<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="/css/dvList.css" rel="stylesheet" type="text/css" />
<title>Delivery add/update</title>
</head>
<body>
<section>
	<div id="dvList">
		<h2 align="center">배송지 정보 상세</h2>
		<!-- 추가 -->
		<c:if test="${list == '' }">
			<form method=get action="addDelivery">
				<table>
					<tr>
						<td>배송지명</td>
						<td>
							<input type=text name=newname id=newname>
						</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>
							<input type="text" id=newmobile name=newmobile maxlength=11  placeholder="010부터 입력하세요">
						</td>
					</tr>
					<tr>
						<td rowspan="3">주소</td>
						<td>
							<input type="text" id=postcode name=postcode placeholder="우편번호" style="width:80px">&nbsp;
							<input type="button" id=btnAddress value="우편번호찾기">
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
						</td>
					</tr>
					<tr>
						<td>기본배송지</td>
						<td>
							<input type=checkbox id=default><span>기본 배송지로 설정</span>
							<input type=hidden name=checked>
						</td>
					</tr>
				</table>
				<br>
				<input type=button id=cle value='닫기'> &nbsp;
				<input type=submit id=btnSave value='저장'>
			</form>
		</c:if>
		<!-- 수정 -->
		<c:if test="${list != '' }">
			<form method=get action="upDelivery">
				<table>
					<tr>
						<td>배송지명</td>
						<td>
							<input type=text name=newname id=newname value='${list.DName }'>
						</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>
							<input type="text" id=newmobile name=newmobile value='${list.DMobile }' maxlength=11>
						</td>
					</tr>
					<tr>
						<td rowspan="3">주소</td>
						<td>
							<input type="text" id=postcode name=postcode value='${list.MPostcode }' style="width:80px">&nbsp;
							<input type="button" id=btnAddress value="우편번호찾기">
						</td>
					</tr>
					<tr>
						<td>
							<input type=text id=address name=address value='${list.MAddress }' readonly>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" id=detailAddress name=detailAddress value='${list.MDetailAddress }'>
							<input type="text" id=extraAddress name=extraAddress  readonly value='${list.MExtraAddress }'>
						</td>
					</tr>
					<tr>
						<td>기본배송지</td>
						<td>
							<input type=checkbox id=default><span>기본 배송지로 설정</span>
							<input type=hidden name=checked>
						</td>
					</tr>
				</table>
				<br>
				<input type=hidden name=se value=${list.DSeqno }>
				<input type=button id=cle value='닫기'> &nbsp;
				<input type=submit id=btnSave value='수정'>
			</form>
		</c:if>
	</div>
</section>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document)
//빈칸이 있을시 전송불가능
.on('click','#btnSave',function(){
	check();
	if($('#newname').val() == ''){
		alert('배송지명을 입력해주세요');
		return false;
	}else if($('#newmobile').val() == ''){
		alert('연락처를 입력해주세요');
		return false;
	}else if($('#postcode,#address,#detailAddress').val()=='' || $('#postcode').val()=='' || $('#address').val()=='' || $('#detailAddress').val()==''){
		alert('주소를 입력해 주세요');
		return false;
	}
	return true;
})

.on('click','#cle',function(){
	opener.parent.location='deliveryUp';
	window.close();
})

//휴대폰번호 유효성검사
.on('blur','#usermobile',function(){
	if($('#usermobile').val() == '' || $('#usermobile').val().length != 11 || isNaN($('#usermobile').val())){
		mobileError.innerHTML='휴대폰 번호를 정확히 입력해 주세요';
		$('#usermobile').focus();
		return false;
	}else{
		mobileError.innerHTML='';
	}
})

//우편번호, 우편번호찾기 눌럿을시 API 실행
.on('click','#btnAddress',function(){
	roadMap();
})
.on('click','#postcode',function(){
	roadMap();
})
.on('keyup','#postcode',function(){
	roadMap();
})

//체크박스 기본값 false주기
function check(){
	if($('#default').is(":checked")){
		$('input[name=checked]').val('Y');
	}else{
		$('input[name=checked]').val('N');
	}
}

//주소 찾기 API 함수
function roadMap(){
	 new daum.Postcode({
	        oncomplete: function(data) {
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
	            if(data.userSelectedType === 'R'){
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
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