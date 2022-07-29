<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<link href="/css/menuDetail.css" rel="stylesheet" type="text/css" />
<title>MenuDetail</title>
</head>
<style>
	a:hover {
		cursor:pointer;
	}

</style>
<body>
<section align="center">
	<table align="center">
		<tr>
			<td colspan="2">
				<img class="menuImg" src=/image/${menu.menuImg }>
			</td>
		</tr>
		<tr>
			<td>메뉴명</td>
			<td>
				${menu.menuName }
			</td>
		</tr>
		<tr>
			<td>한줄설명</td>
			<td>
				${menu.menuEx }
			</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>
				${menu.menuPrice } 원
			</td>
		</tr>
		<tr>
			<td>칼로리</td>
			<td>
				${menu.menuCal } cal
			</td>
		</tr>
	</table>
	<div class="button">
		<div class="button_quantity">
			<span>주문수량</span>
			<input readonly type=text class="quantity_input" value="1">
			<span>
				<input type="button" class="plus_btn" value="+">
				<input type="button" class="minus_btn" value="-">
			</span>
		</div>
		<div class="button_set">
			<input type="button" class="btn_cart" value="장바구니 담기">
			<input type="button" class="btn_buy" value="바로구매"><br>
			<input type="button" class="btn_cel" value="닫기">
		</div>
	</div>

</section>
</body>
<script>
$(document)

//수량 버튼 조작
let quantity = $(".quantity_input").val();
$(".plus_btn").on("click",function(){
	$(".quantity_input").val(++quantity);
})
$(".minus_btn").on("click",function(){
	if(quantity > 1){
		$(".quantity_input").val(--quantity);
	}
})

// 장바구니 추가 버튼
$(".btn_cart").on("click", function(e){
	form.menuCnt = $(".quantity_input").val();
	$.ajax({
		url:'/cart/add',
		type:'post',
		data:form,
		success: function(result){
			cartAlert(result);
		}
	})
});


// 서버로 전송할 데이터
const form = {
		sSe : '${menu.SSe}',
		mSe : '${menu.menuSeqno}',
		menuCnt : ''
}

function cartAlert(result){
	if(result == '0'){
		alert("장바구니에 추가를 하지 못하였습니다.");
	} else if(result == '1'){
		alert("장바구니에 추가되었습니다.");
		moveCart();
	} else if(result == '2'){
		alert("장바구니에 이미 추가되어져 있습니다.");
		moveCart();
	} else if(result == '5'){
		//alert("로그인이 필요합니다.");
		opener.parent.location="/errorLogin";
		window.close();
	}
}
$(".btn_cel").on("click", function(){
	window.close();
})

function moveCart(){
	answer = confirm("장바구니로 이동하시겠습니까?");
	if (answer) {
		opener.parent.location = '/cart';
		window.close();
	}else{
		window.close();
	}
}
</script>
</html>