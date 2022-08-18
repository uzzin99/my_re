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
  <link href="/css/main.css" rel="stylesheet" type="text/css" />
  <link href="/css/base.css" rel="stylesheet" type="text/css" />

  <title>Main</title>
</head>
<style>
a:hover{
	cursor:pointer;
}
.default:hover{
  cursor: default;
}
</style>
<body>
<div id="wrap" class="wrap mx-auto"></div>
  <!-- 여기가 헤드 -->
  <header>
  <p align="center" onclick=location.href='main'><img class="logos" src="https://img.etnews.com/photonews/1711/1016498_20171123150540_893_0001.jpg"></p>
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
<%--          <li class="nav-item">--%>
<%--            <a class="nav-link active" aria-current="page" href="#">Menu</a>--%>
<%--          </li>--%>

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
              <li><a class="dropdown-item" href="hall?type=1">한식</a></li>
              <li><a class="dropdown-item" href="hall?type=2">중식</a></li>
              <li><a class="dropdown-item" href="hall?type=3">일식</a></li>
              <li><a class="dropdown-item" href="hall?type=4">양식</a></li>
              <li><a class="dropdown-item" href="hall?type=5">치킨</a></li>
              <li><a class="dropdown-item" href="hall?type=6">피자</a></li>
              <li><a class="dropdown-item" href="hall?type=7">분식</a></li>
              <li><a class="dropdown-item" href="hall?type=8">디저트</a></li>
              <li><a class="dropdown-item" href="hall?type=9">족발/보쌈</a></li>
              <li><a class="dropdown-item" href="hall?type=10">고기/구이</a></li>
              <li><a class="dropdown-item" href="hall?type=11">아시안</a></li>
              <li><a class="dropdown-item" href="hall?type=12">패스트푸드</a></li>
            </ul>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
              data-bs-toggle="dropdown" aria-expanded="false">
              게시판
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <li><a class="dropdown-item" href="/SearchWordReJstf?goto=1" >우리들의 이야기</a></li>
              <li><a class="dropdown-item" href="/SearchWordReJstf?goto=2">Q&A</a></li>
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
        <span class="todaymenu" style="margin-left: 40px;">오늘의 가게 추천</span>
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

    <div>
      <c:if test="${userinfo == '' }">
        <div class="login2" float="left">
          <p class="default">로그인을 해주세요</p>
          <p align=center><input type="button" class="btn btn-primary" onclick=location.href='login'
                                 value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배달의민족 로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></p>
          <p style="display:inline;">🔒아이디.비밀번호 찾기</p>
          <p style="display:inline; float: right;" onclick=location.href='signin'>회원가입</p>
        </div>
      </c:if>
      <c:if test="${userType == 'admin'}">
        <div class="login2" float="left">
          <h4 style="color: #333333">관리자님,<br>반갑습니다</h4>
          <p style="float: right;"><span style="margin-right:20px;"><a href="/memberlist" align="right">회원관리</a></span>
                                  <span><a href='logout' align="right">로그아웃</a></span></p>
        </div>
      </c:if>
        <c:if test="${userType == '손님' }">
          <div class="login3" float="left">
            <p style="float: left;" onclick=location.href='signUp'>${mName} 님🍮</p>
            <p style="float: right;"><a href='logout' align="right">로그아웃</a></p>
            <p align="center"><button class="addressbutton" onclick=location.href='signUp/deliveryUp'>
                   ${mAddress },<br>
                   ${mExtraaddress } ${mDetailaddress}
                  </button></p>
            <p style="display:inline; float: right;" onclick=location.href='signUp/payment'>주문/예약내역📄</p>
            <p style="display:inline; float: right;"><a href="cart">장바구니🛒&nbsp;&nbsp;</a></p>
            <p style="display:inline; float: right;" onclick=location.href='/store/z_list'><a>찜<span style="color: red;">❤</span>&nbsp;&nbsp;</a></p>
          </div>
        </c:if>
        <c:if test="${userType == '사장님' }">
          <c:if test="${cntStore == 0}">
            <div class="login4" float="left">
            <p style="float: left;" onclick=location.href='signUp'>${mName} 님👩‍🍳</p>
            <p style="float: right;"><a href='logout' align="right">로그아웃</a></p>
            <p align="center" onclick=location.href='s_up'><button class="addressbutton">
              <a style="background: linear-gradient(to top, #39c0c0 30%, transparent 30%);">
                등록된 가게가 없습니다.<br> 가게를 등록해 주세요.</a>
              </button></p>
            </div>
          </c:if>
          <c:if test="${cntStore == 1}">
            <div class="login4" float="left">
              <p style="float: left;" onclick=location.href='signUp'>${mName} 님👩‍🍳</p>
              <p style="float: right;"><a href='logout' align="right">로그아웃</a></p>
              <p align="center" onclick=location.href='s_info'><button class="addressbutton">
                <a><span style="background: linear-gradient(to top, #39c0c0 30%, transparent 30%);">
                    내 가게:</span>&nbsp;&nbsp;${sVO.SName}</a>
              </button></p>
              <p><span style="display:inline; width:100px;float: right;" onclick=location.href='booking/orderlist?sSeqno=${sVO.SSeqno}'>주문내역</span>
                <span style="display:inline; width:100px;float: right;" onclick=location.href='booking/bookinglist?sSeqno=${sVO.SSeqno}'>예약내역</span></p>
            </div>
        </c:if>
        </c:if>
    </div>

    <div class="Kategorie"><br>
      <div>
        <div class="three">
          <span class="todaymenu" style="margin-left: 30px">메뉴 카테고리</span>
        </div>

        <div class="three">
          <span class="todaymenu">모두의 광장</span>
        </div>

        <div class="three">
          <span class="todaymenu">이런 일도 한답니다</span>
        </div>
      </div>

      <div class="mainmenu">
        <table><br>
          <tr>
            <td onclick=location.href='store?type=1'><img src="/MainLogo/한식.png">
              <p>한식</p>
            </td>
            <td onclick=location.href='store?type=2'><img src="/MainLogo/중식.png">
              <p>중식</p>
            </td>
            <td onclick=location.href='store?type=3'><img src="/MainLogo/일식.png">
              <p>일식</p>
            </td>
            <td onclick=location.href='store?type=4'><img src="/MainLogo/양식.png">
              <p>양식</p>
            </td>
          </tr>
          <tr>
            <td onclick=location.href='store?type=5'><img src="/MainLogo/치킨.png">
              <p>치킨</p>
            </td>
            <td onclick=location.href='store?type=6'><img src="/MainLogo/피자.png">
              <p>피자</p>
            </td>
            <td onclick=location.href='store?type=7'><img src="/MainLogo/분식.png">
              <p>분식</p>
            </td>
            <td onclick=location.href='store?type=8'><img src="/MainLogo/디저트.png">
              <p>디저트</p>
            </td>
          </tr>
          <tr>
            <td onclick=location.href='store?type=9'><img src="/MainLogo/족발.png">
              <p>족발/보쌈</p>
            </td>
            <td onclick=location.href='store?type=10'><img src="/MainLogo/고기.png">
              <p>고기/구이</p>
            </td>
            <td onclick=location.href='store?type=11'><img src="/MainLogo/아시안.png">
              <p>아시안</p>
            </td>
            <td onclick=location.href='store?type=12'><img src="/MainLogo/햄버거.png">
              <p>패스트푸드</p>
            </td>
          </tr>
        </table>
      </div>

      <div class="tab"><br>
        <input type="radio" name="tabmenu" id="tab01" checked>
        <label for="tab01" style="margin-left: 30%;">우리들의 이야기</label>
        <input type="radio" name="tabmenu" id="tab02">
        <label for="tab02">Q&A</label>

        <div class="conbox con1"><div id="boardList"></div></div>
        <div class="conbox con2"><div id="QnAList"></div></div>

      </div>

      <div class="slidershape">
        <div id="slider">
          <div class="mySlideDiv" style="background-image: url('https://betaimg-cdn.baemin.com/fw/ceoImage/2022/7/4/23894220_content.jpg');">
            <div class="content">비오는 날,<br>진짜 전이 많이 <br>팔릴까?</div>
            <div class="img-cover" onclick="location.href='https://ceo.baemin.com/knowhow/8393?utm_source=baeminapp&utm_medium=esg&utm_campaign=knowhow_220710';"></div>
          </div>

          <div class="mySlideDiv" style="background-image: url('https://post-phinf.pstatic.net/MjAxODA4MTZfMTkw/MDAxNTM0NDA3Njg5MTg2.EiX2Z8zlcmK-dFj73jnWkaF8N_216ibyI8246cK_l4sg.5-ROC_DF4DTNz7eiHs-oktP2nKFiPLw4mK6JzmKKjucg.JPEG/6.jpg?type=w1200');">
            <div class="content">여름철 식중독 예방,<br>이것만은 꼭 지키세요.</div>
            <div class="img-cover" onclick="location.href='https://post.naver.com/viewer/postView.naver?volumeNo=16515598&memberNo=15460571&vType=VERTICAL';"></div>
          </div>

          <div class="mySlideDiv" style="background-image: url('https://story.baemin.com/wp-content/uploads/2022/07/220517_%E1%84%87%E1%85%A2%E1%84%86%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A1%E1%86%BC%E1%84%92%E1%85%ACPB_%E1%84%8E%E1%85%AC%E1%84%92%E1%85%A7%E1%86%AB%E1%84%8C%E1%85%B53036-scaled.jpg');">
            <div class="content">우아한형제들<br>구성원들이 말하는<br>진짜 배민이야기.</div>
            <div class="img-cover" onclick="location.href='https://story.baemin.com/?s=%EC%A7%81%EB%AC%B4%EC%9D%B8%ED%84%B0%EB%B7%B0';"></div>
          </div>

          <div class="mySlideDiv"  style="background-image: url('https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FDO9Pu%2Fbtq5kYCYMlA%2Fpay71Bn2dPVEomhoxcTY00%2Fimg.jpg');">
            <div class="content">일상 속,<br>플라스틱 사용 줄이기!</div>
            <div class="img-cover" onclick="location.href='https://brunch.co.kr/@euni8828/16';"></div>
          </div>

        </div>
      </div>

      </div>
      </div>
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
  .ready(function(){
    randomImg();
    selectBrd();
    selectQnA();

  })

  //제목을 눌러서 게시물 들어가서 조회수 증가
  .on('click','#boardList a,#QnAList a',function(){
    $.ajax({
      type:'get',dataType:'json',
      url:'viewUp',
      data:'seq='+$(this).attr("id"),
      success:function(){
      }
    })
  })

  function randomImg(){
	  $.ajax({
			type:'post',dataType:'json',
			url:'randImg',
			data:'',
			success:function(data){
				$('#slider-div').empty();
				for(i=0;i<data.length;i++) {
					let store = data[i];
                  $('#slider-div').append('<div><a href="store/menu?sSeqno='+store['Sseqno']+'"><img class="item" src="/img/'+store['Simg']+'"></a></div>')
				}
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
              })
			}
		})
  }

  function selectBrd() {
    $.ajax({
      type: 'post', dataType: 'json',
      url: 'smBD',
      data: '',
      success: function (data) {
        $('#boardList').empty();
        for (i = 0; i < data.length; i++) {
          let brd = data[i];
          let date = brd['date'].split(' ');
          $('#boardList').append("<div><a id='"+brd['seqno']+"' href='/show?seq=" + brd['seqno'] + "'><div id=date>"
                  + date[0] + "</div><div id=titles> <b>" + brd['title'] + "</b></div> <div id=cntcmt>(" + brd['cntCmt'] + ")</div></a><div>");
        }
      }
    })
  }
  function selectQnA(){
    $.ajax({
      type:'post',dataType:'json',
      url:'smQA',
      data:'',
      success:function(data){
        $('#QnAList').empty();
        for(i=0;i<data.length;i++) {
          let brd = data[i];
          let date = brd['date'].split(' ');
          $('#QnAList').append("<div><a id='"+brd['seqno']+"' href='/show?seq=" + brd['seqno'] + "'><div id=date>"
                  + date[0] + "</div><div id=titles> <b>" + brd['title'] + "</b></div> <div id=cntcmt>(" + brd['cntCmt'] + ")</div></a><div>");
        }
      }
    })
  }
  //이런일도한답니다
  // $(document).ready(function () {
  //   $(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
  //   setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
  // });

  //이전 슬라이드
  /*function prevSlide() {
    $(".mySlideDiv").hide(); //모든 div 숨김
    var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
    var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수

    //반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
    $(".mySlideDiv").each(function(index,item){
      if($(this).hasClass("active")) {
        currentIndex = index;
      }

    });

    //새롭게 나타낼 div의 index
    var newIndex = 0;

    if(currentIndex <= 0) {
      //현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
      newIndex = allSlide.length-1;
    } else {
      //현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
      newIndex = currentIndex-1;
    }

    //모든 div에서 active 클래스 제거
    $(".mySlideDiv").removeClass("active");

    //새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
    $(".mySlideDiv").eq(newIndex).addClass("active");
    $(".mySlideDiv").eq(newIndex).show();

  }

  //다음 슬라이드
  function nextSlide() {
    $(".mySlideDiv").hide();
    var allSlide = $(".mySlideDiv");
    var currentIndex = 0;

    $(".mySlideDiv").each(function(index,item){
      if($(this).hasClass("active")) {
        currentIndex = index;
      }

    });

    var newIndex = 0;

    if(currentIndex >= allSlide.length-1) {
      //현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
      newIndex = 0;
    } else {
      //현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
      newIndex = currentIndex+1;
    }

    $(".mySlideDiv").removeClass("active");
    $(".mySlideDiv").eq(newIndex).addClass("active");
    $(".mySlideDiv").eq(newIndex).show();

  }*/
  $(function(){
    $('#slider').slick({
      slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li
      infinite : true, 	//무한 반복 옵션
      slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
      speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : false, 		// 옆으로 이동하는 화살표 표시 여부
      dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
      autoplay : true,			// 자동 스크롤 사용 여부
      autoplaySpeed : 3000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,		// 세로 방향 슬라이드 옵션
      // prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
      // nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
      // dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
      draggable : true, 	//드래그 가능 여부

      responsive: [ // 반응형 웹 구현 옵션
        {
          breakpoint: 960, //화면 사이즈 960px
          settings: {
            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
            slidesToShow:3
          }
        },
        {
          breakpoint: 768, //화면 사이즈 768px
          settings: {
            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
            slidesToShow:2
          }
        }
      ]

    });
  })
</script>
</html>