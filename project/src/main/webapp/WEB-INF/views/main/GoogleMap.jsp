
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<body>
<div id="map" style="width:1024px;height:600px"></div>
<script>
var myCity = new google.maps.Circle({
    center: azit,
    radius: 100,
    strokeColor: "GREEN",
    strokeOpacity: 0.8,
    strokeWeight: 2,
    fillColor: "GREEN",
    fillOpacity: 0.4
  });
function myMap() {
  var azit = new google.maps.LatLng(36.338458,127.392531);
  
  var mapCanvas = document.getElementById("map");
  var mapOptions = {center: azit, zoom: 16};
  var map = new google.maps.Map(mapCanvas,mapOptions);

  var myCity = new google.maps.Circle({
    center: azit,
    radius: 100,
    strokeColor: "GREEN",
    strokeOpacity: 0.8,
    strokeWeight: 2,
    fillColor: "GREEN",
    fillOpacity: 0.4
  });
  myCity.setMap(map);
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBrQILyA-0r1rluR27ABZp64okQW7L_tLw&callback=myMap"></script>
</body>
</html>
