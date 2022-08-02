<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <style>
        .dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
        .dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
        .number {font-weight:bold;color:#ee6152;}
        .dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
        .distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
        .distanceInfo:after {content:none;}
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4147e05761dc8e1e1adacb8d5d113391&libraries=services,clusterer,drawing"></script>
    <meta charset="UTF-8">
    <title>map</title>
</head>
<body>
<div style="width: 550px;margin-right: auto;margin-left: auto;">
    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    지도 보기
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <div id="map" style="width:500px;height:400px;margin-right: auto;margin-left: auto;"></div>
                </div>
            </div>
        </div>
    </div>
    <table>
        <tr>
            <td>출발</td>
            <td></td>
            <td>도착</td>
        </tr>
        <tr>
            <td><input type="text" placeholder="도로명 주소를 입력해주세요." id="addr"></td>
            <td rowspan="2">→</td>
            <td><input type="text" placeholder="도로명 주소를 입력해주세요." id="addr2"></td>
        </tr>
        <tr>
            <td><input type="text" placeholder="주소 이름을 입력해 주세요." id="addr_name"></td>
            <td><input type="text" placeholder="주소 이름을 입력해 주세요." id="addr_name2"></td>
        </tr>
    </table>
    <br><input type="button" id=btnAdd value=추가>
    <p id="r_dist"></p>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    let clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
    let distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
    let dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
    let bycicleHour, bycicleMin, walkHour, walkMin;
    var markers=[];
    var infowindows=[];
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    };

    var map = new kakao.maps.Map(container, options);
    kakao.maps.event.addListener(map, 'center_changed', function() {

        // 지도의  레벨을 얻어옵니다
        var level = map.getLevel();

        // 지도의 중심좌표를 얻어옵니다
        var latlng = map.getCenter();

    });

    // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여
    // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
    // HTML Content를 만들어 리턴하는 함수입니다
    function getTimeHTML(distance) {

        // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
        var walkkTime = distance / 67 | 0;
        walkHour = '', walkMin = '';

        // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
        if (walkkTime > 60) {
            walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
        }
        walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

        // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
        var bycicleTime = distance / 227 | 0;
        bycicleHour = '', bycicleMin = '';

        // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
        if (bycicleTime > 60) {
            bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
        }
        bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

        // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
        var content = '<ul class="dotOverlay distanceInfo">';
        content += '    <li>';
        content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
        content += '    </li>';
        content += '    <li>';
        content += '        <span class="label">도보</span>' + walkHour + walkMin;
        content += '    </li>';
        content += '    <li>';
        content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
        content += '    </li>';
        content += '</ul>'

        return content;
    }
    // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
    //마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
    function showDistance(content, position) {
        distanceOverlay = new kakao.maps.CustomOverlay({
            map: map, // 커스텀오버레이를 표시할 지도입니다
            content: content,  // 커스텀오버레이에 표시할 내용입니다
            position: position, // 커스텀오버레이를 표시할 위치입니다.
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 3
        });
    }
    function deleteClickLine() {
        if (clickLine) {
            clickLine.setMap(null);
            clickLine = null;
        }
    }
    function deleteDistnce () {
        if (distanceOverlay) {
            distanceOverlay.setMap(null);
            distanceOverlay = null;
        }
    }
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    $(document)
        .ready(function(){
        })
        .on('click','#btnAdd',function(){
            // 주소로 좌표를 검색합니다
            geocoder.addressSearch($('#addr').val(), function(result, status) {
                for(i=0;i<markers.length;i++){
                    markers[i].setMap(null);
                    infowindows[i].setMap(null);
                }
                // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
                deleteClickLine();

                // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
                deleteDistnce();


                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    markers.push(marker);
                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#addr_name').val()+'</div>'
                    });
                    infowindows.push(infowindow);
                    infowindow.open(map, marker);
                }
                geocoder.addressSearch($('#addr2').val(), function(result, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {
                        var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker2 = new kakao.maps.Marker({
                            map: map,
                            position: coords2
                        });
                        markers.push(marker2);
                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow2 = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#addr_name2').val()+'</div>'
                        });
                        infowindows.push(infowindow2);
                        infowindow2.open(map, marker2);

                    }

                    var clickPosition = coords;
                    clickLine = new kakao.maps.Polyline({
                        map: map, // 선을 표시할 지도입니다
                        path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
                        strokeWeight: 3, // 선의 두께입니다
                        strokeColor: '#db4040', // 선의 색깔입니다
                        strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                        strokeStyle: 'solid' // 선의 스타일입니다
                    });

                    // 그려지고 있는 선의 좌표 배열을 얻어옵니다
                    var path = clickLine.getPath();
                    // 좌표 배열에 클릭한 위치를 추가합니다
                    path.push(coords2);
                    // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
                    clickLine.setPath(path);
                    var distance = Math.round(clickLine.getLength());
                    content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

                    var Lat1 = coords.getLat();
                    var Lat2 = coords2.getLat();
                    var Lat3 = Lat1+Lat2;
                    var Lng1 = coords.getLng();
                    var Lng2 = coords2.getLng();
                    var Lng3 = Lng1+Lng2;
                    var last = new kakao.maps.LatLng(Lat3/2,Lng3/2)
                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(last);
                    if(distance<50){
                        map.setLevel(1)
                    }else if(distance<200){
                        map.setLevel(2)
                    }else if(distance<400){
                        map.setLevel(3)
                    }else if(distance<800){
                        map.setLevel(4)
                    }else if(distance<1600){
                        map.setLevel(5)
                    }else if(distance<3200){
                        map.setLevel(6)
                    }else if(distance<6400){
                        map.setLevel(7)
                    }else if(distance<12800){
                        map.setLevel(8)
                    }else if(distance<25600){
                        map.setLevel(9)
                    }else if(distance<51200){
                        map.setLevel(10)
                    }else if(distance<75000){
                        map.setLevel(11)
                    }else if(distance<102400){
                        map.setLevel(12)
                    }else if(distance<204800){
                        map.setLevel(13)
                    }else if(distance<409600){
                        map.setLevel(14)
                    }
                    // 그려진 선의 거리정보를 지도에 표시합니다
                    showDistance(content, path[path.length-1]);
                    $('#r_dist').empty();
                    $('#r_dist').append('거리:'+distance+'m<br>도보:'+walkHour+walkMin+'<br>자전거:'+bycicleHour+bycicleMin);
                });
            })
        })
</script>
</html>