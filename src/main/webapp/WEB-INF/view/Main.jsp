<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
  <!-- css -->
  <!-- <link href="main.css" rel="stylesheet" type="text/css" /> -->
  <link href="css/main.css" rel="stylesheet" type="text/css" />
	<title>Main</title>
</head>
<style>
a:hover{
	cursor:pointer; 
}
</style>
<body>
<div id="wrap" class="wrap mx-auto"></div>
  <!-- 여기가 헤드 -->
  <header>
	  <div class="login">
      <a href="#">🛒</a>
		<c:if test="${userinfo == '' }">
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
    <div class="parent">
      <div style="margin-left: 20px;"><br>
        <span class="todaymenu">오늘의 메뉴 추천</span>
      </div>

      <div class="slider-div">
        <div id="slider-div" align="center">
          <div><img class="item" src="../food3/음식1.jpg"></div>
          <div><img class="item" src="../food3/음식2.jpg"></div>
          <div><img class="item" src="../food3/음식3.jpg"></div>
          <div><img class="item" src="../food3/고양이.jpg"></div>
          <div><img class="item" src="../food3/고양이2.jpg"></div>
          <div><img class="item" src="../food3/고양이3.jpg"></div>
        </div>
      </div>

      <div class="login2" float="left">
        <p>로그인을 해주세요</p>
        <p align=center><input type="button" class="btn btn-primary"
            value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배달의민족 로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></p>
        <p style="display:inline;">🔒아이디.비밀번호 찾기</p>
        <p style="display:inline; float: right;">회원가입</p>
      </div>
    </div>

    <div class="Kategorie"><br>
      <div style="margin-left: 20px;">
        <div class="three">
          <span class="todaymenu">메뉴 카테고리🍟</span>
        </div>

        <div class="three">
          <span class="todaymenu">모두의 광장🏰</span>
        </div>

        <div class="three">
          <span class="todaymenu">할인쿠폰🎉</span>
        </div>
      </div>

      <div class="mainmenu">
        <table><br>
          <tr>
            <td><img src="../food2/한식.png">
              <p>한식</p>
            </td>
            <td><img src="../food2/중식.png">
              <p>중식</p>
            </td>
            <td><img src="../food2/일식.png">
              <p>일식</p>
            </td>
            <td><img src="../food2/양식.png">
              <p>양식</p>
            </td>
          </tr>
          <tr>
            <td><img src="../food2/치킨.png">
              <p>치킨</p>
            </td>
            <td><img src="../food2/피자.png">
              <p>피자</p>
            </td>
            <td><img src="../food2/분식.png">
              <p>분식</p>
            </td>
            <td><img src="../food2/디저트.png">
              <p>디저트</p>
            </td>
          </tr>
          <tr>
            <td><img src="../food2/족발.png">
              <p>족발</p>
            </td>
            <td><img src="../food2/고기.png">
              <p>고기</p>
            </td>
            <td><img src="../food2/아시아.png">
              <p>아시아</p>
            </td>
            <td><img src="../food2/햄버거.png">
              <p>햄버거</p>
            </td>
          </tr>
        </table>
      </div>

      <div class="tab"><br>
        <input type="radio" name="tabmenu" id="tab01" checked>
        <label for="tab01" style="margin-left: 30px;">게시판</label>
        <input type="radio" name="tabmenu" id="tab02">
        <label for="tab02">Q&A</label>
        <input type="radio" name="tabmenu" id="tab03">
        <label for="tab03">자주묻는질문</label>
      
        <div class="conbox con1">컨텐츠탭 내용01</div>
        <div class="conbox con2">컨텐츠탭 내용02</div>
        <div class="conbox con3">컨텐츠탭 내용03</div>
      </div>

      <div class="container"><br><br>
        <div class="front card">
          <p>
            <img class="cardimg" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn7dd4fx_bSN7J_kUVz9a8d2c1-3epqlQZDg&usqp=CAU">
          </p>
        </div>
        <div class="back card">
          <p>
            <img class="cardimg" src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/2505918402/B.jpg?944000000">
          </p>
        </div>
      </div>
    </div>

    <!-- <div class="live">
      <div style="margin-left: 20px; float: left; width: 32%;"><br>
        <sapn class="todaymenu">배민 쇼핑 라이브🎁</span>
      </div>

      <div style="float: left; width: 60%;"><br>
        <sapn class="todaymenu">배민 쇼핑 라이브🎁</span>
      </div> -->

      <!-- <div class="video-container">
        <iframe width="100" height="150" src="https://www.youtube.com/embed/36JvP5pw3po" title="[배달의민족 2.0] 우리는 본래 같은 민족이었다 (full ver.)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      </div>   
    </div> -->
    
    </div>
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
<script>
  $(document)
  $('#slider-div').slick({
    slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
    infinite: true,     //무한 반복 옵션     
    slidesToShow: 4,        // 한 화면에 보여질 컨텐츠 개수
    slidesToScroll: 1,        //스크롤 한번에 움직일 컨텐츠 개수
    speed: 100,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
    arrows: true,         // 옆으로 이동하는 화살표 표시 여부
    // dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
    autoplay: true,            // 자동 스크롤 사용 여부
    autoplaySpeed: 2000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
    pauseOnHover: true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
    vertical: false,        // 세로 방향 슬라이드 옵션
    prevArrow: "<button type='button' class='slick-prev'></button>",        // 이전 화살표 모양 설정
    nextArrow: "<button type='button' class='slick-next'>Next</button>",        // 다음 화살표 모양 설정
    dotsClass: "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
    draggable: true,     //드래그 가능 여부 
    responsive: [ // 반응형 웹 구현 옵션
      {
        breakpoint: 960, //화면 사이즈 960px
        settings: {
          slidesToShow: 3
        }
      },
      {
        breakpoint: 768, //화면 사이즈 768px
        settings: {
          slidesToShow: 2
        }
      }
    ]
  });
  
  function randomImg(){
	  $.ajax({
			type:'post',dataType:'json',
			url:'',
			data:'',
			success:function(data){
				$('#brdList').empty();
				for(i=0;i<data.length;i++) {
					let brd = data[i];
					let date = brd['date'].split(' ');
					$('#brdList').append("<tr><td hidden>"+brd['seq']+"</td><td>"
							+date[0]+"</td><td><a href='/ajax/show?seq="+brd['seq']+"' id='title'>"+brd['title']+"</a></td><td>"
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
	  $('#slider-div').append('<div><img class="item" src="../food3/음식1.jpg"></div>')
  }
</script>
</html>