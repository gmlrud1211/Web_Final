<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:350px;"></div>

${commonList }
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb3a076e63cf6c8c81345781d651521a"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${commonList.mapx}, ${commonList.mapy}), // 지도의 중심좌표
        level: ${commonList.mlevel} // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption); 
</script>