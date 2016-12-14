<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>샘플코드</title>
</head>
<body>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h8RJ2MpqVTzT6BR1xr6b&submodules=geocoder"></script>
<div class="container">
		<center><div id="map" style="border:1px solid #000;width:80%;height:400px;"></div></center>
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<form class="form-horizontal">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="email">모임명:</label>
			    <div class="col-sm-10">
			      <p class="form-control-static">${juso.getC_name()}</p>
			    </div>
			  </div>
			</form>
			<form class="form-horizontal">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="email">날짜:</label>
			    <div class="col-sm-10">
			      <p class="form-control-static">${juso.getC_date()}</p>
			    </div>
			  </div>
			</form>
			<form class="form-horizontal">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="email">내용:</label>
			    <div class="col-sm-10">
			      <p class="form-control-static">${juso.getC_content()}</p>
			    </div>
			  </div>
			</form>
		</div>
</div>
<script type="text/javascript">
var map = new naver.maps.Map("map", {
    center: new naver.maps.LatLng(37.3595316, 127.1052133),
    zoom: 10,
    mapTypeControl: true
});

var infoWindow = new naver.maps.InfoWindow({
    anchorSkew: true
});

map.setCursor('pointer');



// result by latlng coordinate
function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        address: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var item = response.result.items[0],
            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
            point = new naver.maps.Point(item.point.x, item.point.y);

        infoWindow.setContent([
                '<div style="padding:10px;min-width:200px;line-height:150%;">',
                '<h4>모임주소 : '+ response.result.userquery +'  ${juso.getC_spot2()} </h4><br/>',
                '</div>'
            ].join('\n'));


        map.setCenter(point);
        infoWindow.open(map, point);
    });
}
searchAddressToCoordinate('${juso.getC_spot1()}');

naver.maps.onJSContentLoaded = initGeocoder;
								
	
        </script>
</body>
</html>
